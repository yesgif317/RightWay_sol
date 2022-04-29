package Controller;

import javax.inject.Inject;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.util.List;

import Board.Dto.BoardVO;
import Board.Service.BoardService;
import Commons.Excel.Service.ExcelService;
import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;
import Customer.Service.CustomerService;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import File.Dto.FileVO;
import File.Service.FileService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {

    @Inject
    private BoardService service;

    @Inject
    private CustomerService customerService;

    @Inject
    private ExcelService excelService;

    @Inject
    private FileService fileService;


    // 메인 페이지 이동
    @RequestMapping(value = "/index.do", method = RequestMethod.GET)
    public String main() {
        return "index";
    }

    //로그인 GET,POST
    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String loginGET(@ModelAttribute("LoginDTO") LoginDTO loginDTO) {
        return "user/login";
    }
    //로그인 Post
    @RequestMapping(value = "/loginPost.do", method = RequestMethod.POST)
    public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {

        System.out.println(loginDTO.getCus_id()); //웹상에 입력한 아이디값
        CustomerVO customerVO = customerService.login(loginDTO);
        System.out.println(customerVO + "--------------------------");

        System.out.println("객체 확인");
        if (customerVO == null || !BCrypt.checkpw(loginDTO.getCus_pwd(), customerVO.getCus_pwd())) {
            return;
        }
        model.addAttribute("customerVO", customerVO);

        // 로그인 유지를 선택할 경우
        if (loginDTO.isUseCookie()) {
            int amount = 60 * 60 * 4;  // 4시간
            Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정
            customerService.keepLogin(customerVO.getCus_id(), httpSession.getId(), sessionLimit);
        }
    }

    //아이디 중복체크
    @RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
    public String idCheckGET(@RequestParam(value = "cus_id", defaultValue = "", required = false) String cus_id, Model model) {
        model.addAttribute("cus_id", cus_id);
        return "user/idCheck";
    }

    @RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
    public String idCheckPOST(HttpServletRequest request, Model model) throws Exception {
        String cus_id = request.getParameter("cus_id");
        CustomerVO customerVO = customerService.idCheck(cus_id);

        if (customerVO == null) {
            model.addAttribute("check", 0);
        } else {
            model.addAttribute("check", 1);
        }
        model.addAttribute("cus_id", cus_id);
        return "user/idCheck";
    }


    //회원가입 GET, POST
    @RequestMapping(value = "/register.do", method = RequestMethod.GET)
    public String registerGET() throws Exception {
        return "user/register";
    }

    @RequestMapping(value = "/register.do", method = RequestMethod.POST)
    public String registerPOST(CustomerVO customerVO, RedirectAttributes redirectAttributes) throws Exception {

        System.out.println("Post register");
        customerService.insertCustomer(customerVO);
        redirectAttributes.addFlashAttribute("msg", "REGISTERED");

        return "redirect:/login.do";
    }

    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
    public String logout(HttpServletRequest request,
                         HttpServletResponse response,
                         HttpSession httpSession) throws Exception {

        Object object = httpSession.getAttribute("login");

        if (object != null) {
            CustomerVO customerVO = (CustomerVO) object;
            httpSession.removeAttribute("login");
            httpSession.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if (loginCookie != null) {
                System.out.println("login Cookie != null");
                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                customerService.keepLogin(customerVO.getCus_id(), "none", new Date());
            }
        }

        return "user/logout";
    }


    @RequestMapping(value = "/forgot_password.do", method = RequestMethod.GET)
    public String forgot_password() {
        return "user/forgot_password";
    }

    //산출물 게시글 작성 페이지
    @RequestMapping(value = "/outputs_write.do", method = RequestMethod.GET)
    public String outputs_write() {
        return "/outputs/outputs_write";
    }
    //산출물 게시판 글목록 보기
    @RequestMapping(value = "/outputs.do", method = RequestMethod.GET)
    public String outputs(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "/outputs/outputs";
    }
    //산출물 작성글 보기
    @RequestMapping(value = "/outputs_content.do", method = RequestMethod.GET)
    public String outputs_content(@RequestParam("no") int no, Model model) {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/outputs/outputs_content";
    }
    //산출물 작성글 삭제
    @RequestMapping(value = "/outputs_delete.do", method = RequestMethod.GET)
    public String outputs_delete(@RequestParam("no") int no) {
        service.delete(no);
        return "redirect:/outputs.do";
    }

    //산출물 작성글 수정 기능
    @RequestMapping(value = "/outputs_move_update.do", method = RequestMethod.POST)
    public String outputs_move_update(Model model, BoardVO boardVO) {

        String Result = service.updateBoard(boardVO);
        model.addAttribute("BoardList", Result);
        return "redirect:/outputs.do";
    }
    // 산출물 게시글 작성 기능
    @RequestMapping(value = "/outputs_move_write.do", method = RequestMethod.POST)
    public String outputs_move_write(Model model, BoardVO boardVO) {
        String Result = service.insertBoard(boardVO);
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", Result);
        return "redirect:/outputs.do";
    }
    //산출물 게시글 수정 페이지
    @RequestMapping(value = "/issue_update.do", method = RequestMethod.GET)
    public String issue_update(@RequestParam("no") int no, Model model) {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/issue/issue_update";
    }
    //공지사항 게시판 글목록 보기
    @RequestMapping(value = "/notice.do", method = RequestMethod.GET)
    public String notice(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "/notice/notice";
    }



    //요청사항 게시판 글목록 보기
    @RequestMapping(value = "/request.do", method = RequestMethod.GET)
    public String request(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "/request/request";
    }

    @RequestMapping(value = "/issue.do", method = RequestMethod.GET)//이슈 게시판 글목록 보기
    public String issue(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "issue/issue";
    }
    //이슈 게시글 작성 페이지
    @RequestMapping(value = "/issue_write.do", method = RequestMethod.GET)
    public String issue_write() {
        return "/issue/issue_write";
    }

    //이슈 작성글 보기
    @RequestMapping(value = "/issue_content.do", method = RequestMethod.GET)
    public String issue_content(@RequestParam("no") int no, Model model) {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/issue/issue_content";
    }

    @RequestMapping(value = "/issue_delete.do", method = RequestMethod.GET)//이슈 작성글 삭제
    public String issue_delete(@RequestParam("no") int no) {
        service.delete(no);
        return "redirect:/issue.do";
    }

    //회의록 게시글 작성 페이지
    @RequestMapping(value = "/meetingrecord_write.do", method = RequestMethod.GET)
    public String meetingrecord_write() {
        return "/meetingrecord/meetingrecord_write";
    }
    //회의록 목록 보기
    @RequestMapping(value = "/meetingrecord.do", method = RequestMethod.GET)
    public String meetingrecord(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "meetingrecord/meetingrecord";
    }
    //회의록 작성글 보기
    @RequestMapping(value = "/meetingrecord_content.do", method = RequestMethod.GET)
    public String meetingrecord_content(@RequestParam("no") int no, Model model) {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/meetingrecord/meetingrecord_content"; }


    //정기보고 게시글 작성 페이지
    @RequestMapping(value = "/regularreport_write.do", method = RequestMethod.GET)
    public String regularreport_write() {
        return "/regularreport/regularreport_write";
    }
    //정기보고 목록 보기
    @RequestMapping(value = "/regularreport.do", method = RequestMethod.GET)
    public String regularreport(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "regularreport/regularreport";
    }
    //정기보고 작성글 보기
    @RequestMapping(value = "/regularreport_content.do", method = RequestMethod.GET)
    public String regularreport_content(@RequestParam("no") int no, Model model)  {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/regularreport/regularreport_content"; }
    //위험관리 목록 보기
    @RequestMapping(value = "/danger.do", method = RequestMethod.GET)
    public String danger(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "danger/danger";
    }
    //위험관리 작성글 보기
    @RequestMapping(value = "/danger_content.do", method = RequestMethod.GET)
    public String danger_content(@RequestParam("no") int no, Model model) {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/danger/danger_content";
    }

    //adminpermission page
    @RequestMapping(value = "/adminpermission.do", method = RequestMethod.GET)
    public String adminpermission(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);

        return "adminpermission/adminpermission";
    }

    //event page
    @RequestMapping(value = "/event.do", method = RequestMethod.GET)
    public String event(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();

        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);

        return "event/event";
    }

    //행사관리 글쓰기 페이지 이동
    @RequestMapping(value = "/event_write.do", method = RequestMethod.GET)
    public String event_write() {
        return "event/event_write";
    }

    //행사관리 상세 페이지 이동
    @RequestMapping(value = "/event_content.do", method = RequestMethod.GET)
    public String event_content() {
        return "event/event_content";
    }

    //company page
    @RequestMapping(value = "/company.do", method = RequestMethod.GET)
    public String company(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();

        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);

        return "company/company";
    }

    //company 글쓰기 페이지 이동
    @RequestMapping(value = "/company_write.do", method = RequestMethod.GET)
    public String company_write() {
        return "company/company_write";
    }

    //company 상세 페이지 이동
    @RequestMapping(value = "/company_content.do", method = RequestMethod.GET)
    public String company_content() {
        return "company/company_content";
    }

    //team page
    @RequestMapping(value = "/team.do", method = RequestMethod.GET)
    public String team(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();

        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);

        return "team/team";
    }

    //team 글쓰기 페이지 이동
    @RequestMapping(value = "/team_write.do", method = RequestMethod.GET)
    public String team_write() {
        return "team/team_write";
    }

    //team 상세 페이지 이동
    @RequestMapping(value = "/team_content.do", method = RequestMethod.GET)
    public String team_content() {
        return "team/team_content";
    }

    //테이블 페이지 이동
    @RequestMapping(value = "/tables.do", method = RequestMethod.GET)
    public String tables(Model model) {

        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();

        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);

        return "redirect:/outputs.do";
    }

    //테이블 글쓰기 페이지 이동
    @RequestMapping(value = "/move_tableswrite.do", method = RequestMethod.GET)
    public String tableswrite() {
        return "tableswrite";
    }

    //글 작성 버튼 작동
    @RequestMapping(value = "/tableswrite.do", method = RequestMethod.POST)
    public String tableswrite(Model model, BoardVO boardVO) {


        //
        String Result = service.insertBoard(boardVO);

        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();

        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", Result);

        return "tables";
    }

    // 글 수정 페이지 이동
    @RequestMapping(value = "/move_update.do", method = RequestMethod.GET)
    public String update(Model model, HttpServletRequest request) {
        String id = request.getParameter("id");
        //BoardVO result = service.selectboard()selectboard();
        //model.addAttribute("BoardList", boardVoList);
        return "update";
    }

    //글 수정 버튼 작동
    @RequestMapping(value = "/update.do", method = RequestMethod.POST)
    public String update(Model model, BoardVO boardVO) {


        //
        String Result = service.updateBoard(boardVO);

        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();

        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);

        return "tables";
    }

    // blank page
    @RequestMapping(value = "/blank.do", method = RequestMethod.GET)
    public String blank() {
        return "blank";
    }


    @GetMapping("/file-upload.do")
    public void uploadAjax() {
        System.out.println("upload ajax");
    }

    @PostMapping("/file-upload.do")
    public String uploadAjaxPost(MultipartFile[] uploadFile, @RequestParam(value = "title") String title,
                                 @RequestParam(value = "writer") String writer, @RequestParam(value = "contents") String contents) {
        System.out.println("update ajax post.................");
        System.out.println(title + writer + contents);
        fileService.insertFile(uploadFile, 1, 1);
        return "index";
    }

    @RequestMapping(value = "/usermanagement.do", method = RequestMethod.GET)
    public String usermanagement() {
        return "/usermanagement/usermanagement";
    }


    @RequestMapping(value = "/excelform_download.do", method = RequestMethod.GET)
    public void excelDownload(HttpServletResponse response) throws IOException {
        System.out.println("로그1");
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("아이디");
        cell = row.createCell(1);
        cell.setCellValue("비밀번호");
        cell = row.createCell(2);
        cell.setCellValue("이름");
        cell = row.createCell(3);
        cell.setCellValue("이메일");
        cell = row.createCell(4);
        cell.setCellValue("전화번호");
        cell = row.createCell(5);
        cell.setCellValue("부서명");
        cell = row.createCell(6);
        cell.setCellValue("직책명");

        // Body
        for (int i = 0; i < 7; i++) {
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(i + "_ID");
            cell = row.createCell(1);
            cell.setCellValue(i + "_PWD");
            cell = row.createCell(2);
            cell.setCellValue(i + "_NAME");
            cell = row.createCell(3);
            cell.setCellValue(i + "_Email");
            cell = row.createCell(4);
            cell.setCellValue(i + "_Phone");
            cell = row.createCell(5);
            cell.setCellValue(i + "_Dep");
            cell = row.createCell(6);
            cell.setCellValue(i + "_Position");
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=form_management.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }

    @RequestMapping(value = "/ExcelDownload.do", method = RequestMethod.GET)
    public void ExcelGET(@ModelAttribute("customerVO") CustomerVO customerVO, HttpServletRequest
            request, HttpServletResponse response, ModelMap model) throws Exception {
        System.out.println("인원관리 다운로드");
        excelService.getUserExcel(customerVO, request, response);

    }

}






