package Controller;

import Board.Dto.BoardVO;
import Board.Service.BoardService;
import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;
import Customer.Service.CustomerService;
import org.apache.commons.io.FileUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

@Controller
public class MainController {

    @Inject
    private BoardService service;

    @Inject
    private CustomerService customerService;

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

    @RequestMapping(value = "/loginPost.do", method = RequestMethod.POST)
    public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {

        System.out.println(loginDTO.getC_id()); //웹상에 입력한 아이디값
        CustomerVO customerVO = customerService.login(loginDTO);
        System.out.println(customerVO + "--------------------------");

        System.out.println("객체 확인");
        if (customerVO == null || !BCrypt.checkpw(loginDTO.getC_pwd(), customerVO.getC_pwd())) {
            return;
        }
        model.addAttribute("customerVO", customerVO);

        // 로그인 유지를 선택할 경우
        if (loginDTO.isUseCookie()) {
            int amount = 60 * 60 * 4;  // 4시간
            Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정
            customerService.keepLogin(customerVO.getC_id(), httpSession.getId(), sessionLimit);
        }
    }

    //아이디 중복체크
    @RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
    public String idCheckGET(@RequestParam(value = "c_id", defaultValue = "", required = false) String c_id, Model model) {
        model.addAttribute("c_id", c_id);
        return "user/idCheck";
    }

    @RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
    public String idCheckPOST(HttpServletRequest request, Model model) throws Exception {
        String c_id = request.getParameter("c_id");
        CustomerVO customerVO = customerService.idCheck(c_id);

        if (customerVO == null) {
            model.addAttribute("check", 0);
        } else {
            model.addAttribute("check", 1);
        }
        model.addAttribute("c_id", c_id);
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
        String hashedPw = BCrypt.hashpw(customerVO.getC_pwd(), BCrypt.gensalt());
        customerVO.setC_pwd(hashedPw);
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
                customerService.keepLogin(customerVO.getC_id(), "none", new Date());
            }
        }

        return "user/logout";
    }


    @RequestMapping(value = "/forgot_password.do", method = RequestMethod.GET)
    public String forgot_password() {
        return "user/forgot_password";
    }


    @RequestMapping(value = "/outputs_write.do", method = RequestMethod.GET)  //산출물 게시글 작성 페이지
    public String outputs_write() {
        return "/outputs/outputs_write";
    }

    @RequestMapping(value = "/outputs.do", method = RequestMethod.GET)//산출물 게시판 글목록 보기
    public String outputs(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "/outputs/outputs";
    }

    @RequestMapping(value = "/outputs_content.do", method = RequestMethod.GET)//산출물 작성글 보기
    public String outputs_content(@RequestParam("no") int no, Model model) {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/outputs/outputs_content";
    }

    @RequestMapping(value = "/outputs_delete.do", method = RequestMethod.GET)//산출물 작성글 삭제
    public String outputs_delete(@RequestParam("no") int no) {
        service.delete(no);
        return "redirect:/outputs.do";
    }

    @RequestMapping(value = "/outputs_update.do", method = RequestMethod.GET)  //산출물 게시글 수정 페이지
    public String outputs_update(@RequestParam("no") int no, Model model) {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/outputs/outputs_update";
    }

    @RequestMapping(value = "/outputs_move_update.do", method = RequestMethod.POST)//산출물 작성글 수정 기능
    public String outputs_move_update(Model model, BoardVO boardVO) {

        String Result = service.updateBoard(boardVO);
        model.addAttribute("BoardList", Result);
        return "redirect:/outputs.do";
    }

    @RequestMapping(value = "/outputs_move_write.do", method = RequestMethod.POST)// 산출물 게시글 작성 기능
    public String outputs_move_write(Model model, BoardVO boardVO) {
        String Result = service.insertBoard(boardVO);
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", Result);
        return "redirect:/outputs.do";
    }


    @RequestMapping(value = "/issue.do", method = RequestMethod.GET)//이슈 게시판 글목록 보기
    public String issue(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "issue/issue";
    }
    @RequestMapping(value = "/issue_content.do", method = RequestMethod.GET)//이슈 작성글 보기
    public String issue_content(@RequestParam("no") int no, Model model)  {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/issue/issue_content"; }

    @RequestMapping(value = "/issue_delete.do", method = RequestMethod.GET)//이슈 작성글 삭제
    public String issue_delete(@RequestParam("no") int no) {
        service.delete(no);
        return "redirect:/issue.do";
    }
    @RequestMapping(value = "/issue_update.do", method = RequestMethod.GET)  //산출물 게시글 수정 페이지
    public String issue_update(@RequestParam("no") int no, Model model) {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/issue/issue_update";
    }
    @RequestMapping(value = "/meetingrecord.do", method = RequestMethod.GET)//회의록 목록 보기
    public String meetingrecord(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "meetingrecord/meetingrecord";
    }
    @RequestMapping(value = "/meetingrecord_content.do", method = RequestMethod.GET)//회의록 작성글 보기
    public String meetingrecord_content(@RequestParam("no") int no, Model model)  {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/meetingrecord/meetingrecord_content"; }
    @RequestMapping(value = "/regularreport.do", method = RequestMethod.GET)//정기보고 목록 보기
    public String regularreport(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "regularreport/regularreport";
    }
    @RequestMapping(value = "/regularreport_content.do", method = RequestMethod.GET)//정기보고 작성글 보기
    public String regularreport_content(@RequestParam("no") int no, Model model)  {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/regularreport/regularreport_content"; }
    @RequestMapping(value = "/danger.do", method = RequestMethod.GET)//위험관리 목록 보기
    public String danger(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "danger/danger";
    }
    @RequestMapping(value = "/danger_content.do", method = RequestMethod.GET)//위험관리 작성글 보기
    public String danger_content(@RequestParam("no") int no, Model model)  {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/danger/danger_content"; }


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
    public void uploadAjaxPost(MultipartFile[] uploadFile) {
        System.out.println("update ajax post.................");

        String uploadFolder = "C:\\upload";

        for(MultipartFile multipartFile : uploadFile) {
            System.out.println("---------------------------------");
            System.out.println("Upload File Name :"+multipartFile.getOriginalFilename());
            System.out.println("Upload File Size : " + multipartFile.getSize());

            String uploadFileName = multipartFile.getOriginalFilename();

            //IE has file path
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
            System.out.println("only file name : " + uploadFileName);

            File saveFile = new File(uploadFolder, uploadFileName);

            try {
                multipartFile.transferTo(saveFile);
            }catch (Exception e) {
                System.out.println(e.getMessage());
            }//end catch
        }//end for
    }

}
