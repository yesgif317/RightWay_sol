package Controller;

import javax.inject.Inject;
import javax.servlet.http.*;
import javax.servlet.http.Cookie;
import java.io.*;
import java.util.*;
import java.util.List;

import Board.Dto.BoardVO;
import Board.Service.BoardService;
import Commons.Excel.Dto.ExcelVO;
import Commons.Excel.Service.ExcelService;
import Company.Dto.CompanyVO;
import Company.Service.CompanyService;
import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;
import Customer.Service.CustomerService;
import Event.Dto.EventVO;
import Event.Service.EventService;
import Post.Dto.NormalVO;
import Post.Service.NormalService;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import File.Service.FileService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
    private CompanyService companyService;
    @Inject
    private ExcelService excelService;
    @Inject
    private FileService fileService;
    @Inject
    private NormalService normalService;
    @Inject
    private EventService eventService;


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
        System.out.println(customerVO);
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
    public String outputs_write(@RequestParam("post_num") int no, Model model) {
        if(no>0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        }
        else{}
        return "/outputs/outputs_write";
    }
    //산출물 게시판 글목록 보기
    @RequestMapping(value = "/outputs.do", method = RequestMethod.GET)
    public String outputs(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<NormalVO> postVoList = normalService.selectPost();

        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("PostList", postVoList);
        List<NormalVO> prj_numList = normalService.selectPrj_num();
        model.addAttribute("prj_numList", prj_numList);
        return "/outputs/outputs";
    }
    //산출물 작성글 보기
    @RequestMapping(value = "/outputs_content.do", method = RequestMethod.GET)
    public String outputs_content(@RequestParam("post_num") int no, Model model) {
        NormalVO Result = normalService.viewPost(no);
        model.addAttribute("PostList", Result);

        return "/outputs/outputs_content";
    }
    //산출물 작성글 삭제
    @RequestMapping(value = "/outputs_delete.do", method = RequestMethod.GET)
    public String outputs_delete(@RequestParam("post_num") int no) {
        normalService.deletePost(no);
        return "redirect:/outputs.do";
    }
    //산출물 작성글 수정 기능
    @RequestMapping(value = "/outputs_update.do", method = RequestMethod.POST)
    public String outputs_move_update(Model model, NormalVO postVO) {

        String Result = normalService.updatePost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/outputs.do";
    }
    // 산출물 게시글 작성 기능
    @RequestMapping(value = "/outputs_insert.do", method = RequestMethod.POST)
    public String outputs_insert(Model model, NormalVO postVO) {
        String Result = normalService.insertPost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/outputs.do";
    }
    //회의록 게시글 작성 페이지
    @RequestMapping(value = "/meetingrecord_write.do", method = RequestMethod.GET)
    public String meetingrecord_write(@RequestParam("post_num") int no,Model model) {
        if(no>0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        }
        else{}
        return "/meetingrecord/meetingrecord_write";
    }
    //회의록 목록 보기
    @RequestMapping(value = "/meetingrecord.do", method = RequestMethod.GET)
    public String meetingrecord(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<NormalVO> PostVoList = normalService.selectPost();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("PostList", PostVoList);
        return "meetingrecord/meetingrecord";
    }
    //회의록 작성글 보기
    @RequestMapping(value = "/meetingrecord_content.do", method = RequestMethod.GET)
    public String meetingrecord_content(@RequestParam("post_num") int no, Model model) {
        NormalVO Result = normalService.viewPost(no);
        model.addAttribute("PostList", Result);
        return "/meetingrecord/meetingrecord_content"; }
    //회의록 작성글 삭제
    @RequestMapping(value = "/meetingrecord_delete.do", method = RequestMethod.GET)
    public String meetingrecord_delete(@RequestParam("post_num") int no) {
        normalService.deletePost(no);
        return "redirect:/meetingrecord.do";
    }
    //회의록 작성글 수정 기능
    @RequestMapping(value = "/meetingrecord_update.do", method = RequestMethod.POST)
    public String meetingrecord_move_update(Model model, NormalVO postVO) {

        String Result = normalService.updatePost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/meetingrecord.do";
    }
    // 회의록 게시글 작성 기능
    @RequestMapping(value = "/meetingrecord_insert.do", method = RequestMethod.POST)
    public String meetingrecord_insert(Model model, NormalVO postVO) {
        String Result = normalService.insertPost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/meetingrecord.do";
    }


    //정기보고 게시글 작성 페이지
    @RequestMapping(value = "/regularreport_write.do", method = RequestMethod.GET)
    public String regularreport_write(@RequestParam("post_num") int no,Model model) {
        if(no>0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        }
        else{}
        return "/regularreport/regularreport_write";
    }
    //정기보고 목록 보기
    @RequestMapping(value = "/regularreport.do", method = RequestMethod.GET)
    public String regularreport(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<NormalVO> PostVoList = normalService.selectPost();
        //.jsp 파일로 DB 결과값 전달하기
        model.addAttribute("PostList", PostVoList);
        return "regularreport/regularreport";
    }
    //정기보고 작성글 보기
    @RequestMapping(value = "/regularreport_content.do", method = RequestMethod.GET)
    public String regularreport_content(@RequestParam("post_num") int no, Model model)  {
        NormalVO Result = normalService.viewPost(no);
        model.addAttribute("PostList", Result);
        return "/regularreport/regularreport_content"; }
    //정기보고 작성글 삭제
    @RequestMapping(value = "/regularreport_delete.do", method = RequestMethod.GET)
    public String regularreport_delete(@RequestParam("post_num") int no) {
        normalService.deletePost(no);
        return "redirect:/regularreport.do";
    }
    //정기보고 작성글 수정 기능
    @RequestMapping(value = "/regularreport_update.do", method = RequestMethod.POST)
    public String regularreport_move_update(Model model, NormalVO postVO) {

        String Result = normalService.updatePost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/regularreport.do";
    }
    // 정기보고 게시글 작성 기능
    @RequestMapping(value = "/regularreport_insert.do", method = RequestMethod.POST)
    public String regularreport_insert(Model model, NormalVO postVO) {
        String Result = normalService.insertPost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/regularreport.do";
    }
    //공지사항 게시글 작성 페이지
    @RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
    public String notice_write(@RequestParam("post_num") int no,Model model) {
        if(no>0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        }
        else{}
        return "/notice/notice_write";
    }
    //공지사항 게시판 글목록 보기
    @RequestMapping(value = "/notice.do", method = RequestMethod.GET)
    public String notice(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<NormalVO> PostVoList = normalService.selectPost();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("PostList", PostVoList);
        return "/notice/notice";
    }
    //공지사항 작성글 보기
    @RequestMapping(value = "/notice_content.do", method = RequestMethod.GET)
    public String notice_content(@RequestParam("post_num") int no, Model model) {
        NormalVO Result = normalService.viewPost(no);
        model.addAttribute("PostList", Result);
        return "/notice/notice_content";
    }
    //공지사항 작성글 삭제
    @RequestMapping(value = "/notice_delete.do", method = RequestMethod.GET)
    public String notice_delete(@RequestParam("post_num") int no) {
        normalService.deletePost(no);
        return "redirect:/notice.do";
    }
    //공지사항 작성글 수정 기능
    @RequestMapping(value = "/notice_update.do", method = RequestMethod.POST)
    public String notice_move_update(Model model, NormalVO postVO) {

        String Result = normalService.updatePost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/notice.do";
    }
    // 공지사항 게시글 작성 기능
    @RequestMapping(value = "/notice_insert.do", method = RequestMethod.POST)
    public String notice_insert(Model model, NormalVO postVO) {
        String Result = normalService.insertPost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/notice.do";
    }
    //자료실 게시글 작성 페이지
    @RequestMapping(value = "/datacenter_write.do", method = RequestMethod.GET)
    public String datacenter_write(@RequestParam("post_num") int no,Model model) {
        if(no>0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        }
        else{}
        return "/datacenter/datacenter_write";
    }
    //자료실 게시판 글목록 보기
    @RequestMapping(value = "/datacenter.do", method = RequestMethod.GET)
    public String datacenter(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<NormalVO> PostVoList = normalService.selectPost();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("PostList", PostVoList);
        return "/datacenter/datacenter";
    }
    //자료실 작성글 보기
    @RequestMapping(value = "/datacenter_content.do", method = RequestMethod.GET)
    public String datacenter_content(@RequestParam("post_num") int no, Model model) {
        NormalVO Result = normalService.viewPost(no);
        model.addAttribute("PostList", Result);
        return "/datacenter/datacenter_content";
    }
    //자료실 작성글 삭제
    @RequestMapping(value = "/datacenter_delete.do", method = RequestMethod.GET)
    public String datacenter_delete(@RequestParam("post_num") int no) {
        normalService.deletePost(no);
        return "redirect:/datacenter.do";
    }
    //자료실 작성글 수정 기능
    @RequestMapping(value = "/datacenter_update.do", method = RequestMethod.POST)
    public String datacenter_move_update(Model model, NormalVO postVO) {

        String Result = normalService.updatePost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/datacenter.do";
    }
    // 자료실 게시글 작성 기능
    @RequestMapping(value = "/datacenter_insert.do", method = RequestMethod.POST)
    public String datacenter_insert(Model model, NormalVO postVO) {
        String Result = normalService.insertPost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/datacenter.do";
    }
    //요청사항 게시글 작성 페이지
    @RequestMapping(value = "/request_write.do", method = RequestMethod.GET)
    public String request_write(@RequestParam("post_num") int no,Model model) {
        if(no>0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        }
        else{}
        return "/request/request_write";
    }
    //요청사항 게시판 글목록 보기
    @RequestMapping(value = "/request.do", method = RequestMethod.GET)
    public String request(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<NormalVO> PostVoList = normalService.selectPost();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("PostList", PostVoList);
        return "/request/request";
    }
    //요청사항 작성글 보기
    @RequestMapping(value = "/request_content.do", method = RequestMethod.GET)
    public String request_content(@RequestParam("post_num") int no, Model model) {
        NormalVO Result = normalService.viewPost(no);
        model.addAttribute("PostList", Result);
        return "/request/request_content";
    }
    //요청사항 작성글 삭제
    @RequestMapping(value = "/request_delete.do", method = RequestMethod.GET)
    public String request_delete(@RequestParam("post_num") int no) {
        normalService.deletePost(no);
        return "redirect:/request.do";
    }
    //요청사항 작성글 수정 기능
    @RequestMapping(value = "/request_update.do", method = RequestMethod.POST)
    public String request_move_update(Model model, NormalVO postVO) {

        String Result = normalService.updatePost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/request.do";
    }
    // 요청사항 게시글 작성 기능
    @RequestMapping(value = "/request_insert.do", method = RequestMethod.POST)
    public String request_insert(Model model, NormalVO postVO) {
        String Result = normalService.insertPost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/request.do";
    }

    //이슈 게시판 글목록 보기
    @RequestMapping(value = "/issue.do", method = RequestMethod.GET)
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
    //위험관리 등록
    @RequestMapping(value = "/danger_write.do", method = RequestMethod.GET)
    public String danger_write() {
        return "/danger/danger_write";
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
        List<EventVO> eventVOList = eventService.selectEvent();

        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("EventList", eventVOList);

        return "event/event";
    }

    //행사관리 글쓰기 페이지 이동
    @RequestMapping(value = "/event_write.do", method = RequestMethod.GET)
    public String event_write(@RequestParam("post_num") int post_num, Model model) {
        if(post_num>0){
            EventVO Result = eventService.viewEvent(post_num);
            model.addAttribute("EventList",Result);
        }
        return "event/event_write";
    }

    //행사관리 상세 페이지 이동
    @RequestMapping(value = "/event_content.do", method = RequestMethod.GET)
    public String event_content(@RequestParam("post_num") int post_num, Model model) {
        EventVO Result = eventService.viewEvent(post_num);
        model.addAttribute("EventList",Result);
        return "event/event_content";
    }

    //행사관리 insert
    @RequestMapping(value = "/event_insert.do", method = RequestMethod.POST)
    public String event_insert(Model model, EventVO eventVO) {
        String Result = eventService.insertEvent(eventVO);
        model.addAttribute("EventList", Result);
        return "redirect:/event.do";
    }

    //행사관리 delete
    @RequestMapping(value = "/event_delete.do", method = RequestMethod.GET)
    public String event_delete(@RequestParam("post_num") int post_num) {
        eventService.delete(post_num);
        return "redirect:/event.do";
    }
    //행사관리 update
    @RequestMapping(value = "/event_update.do", method = RequestMethod.POST)
    public String event_update(Model model, EventVO eventVO) {
        String Result = eventService.updateEvent(eventVO);
        model.addAttribute("EventList", Result);
        return "redirect:/event.do";
    }

    //company page
    @RequestMapping(value = "/company.do", method = RequestMethod.GET)
    public String company(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<CompanyVO> companyVOList = companyService.selectCompany();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("CompanyList", companyVOList);

        return "company/company";
    }

    //company 글쓰기 페이지 이동
    @RequestMapping(value = "/company_write.do", method = RequestMethod.GET)
    public String company_write(@RequestParam("com_num") int com_num, Model model) {
        if(com_num>0){
            CompanyVO Result = companyService.viewCompany(com_num);
            model.addAttribute("CompanyList",Result);
        }
        return "company/company_write";
    }

    //company 상세 페이지 이동
    @RequestMapping(value = "/company_content.do", method = RequestMethod.GET)
    public String company_content(@RequestParam("com_num") int com_num, Model model) {
        CompanyVO Result = companyService.viewCompany(com_num);
        model.addAttribute("CompanyList",Result);
        return "company/company_content";
    }

    //company insert
    @RequestMapping(value = "/company_insert.do", method = RequestMethod.POST)
    public String company_insert(Model model, CompanyVO companyVO) {
        System.out.println(companyVO.getCom_contract());
        System.out.println(companyVO.getCom_name());
        String Result = companyService.insertCompany(companyVO);
        model.addAttribute("CompanyList", Result);
        return "redirect:/company.do";
    }

    //company delete
    @RequestMapping(value = "/company_delete.do", method = RequestMethod.GET)
    public String company_delete(@RequestParam("com_num") int com_num) {
        companyService.delete(com_num);
        return "redirect:/company.do";
    }

    //company update
    @RequestMapping(value = "/company_update.do", method = RequestMethod.POST)
    public String company_update(Model model, CompanyVO companyVO) {
        String Result = companyService.updateCompany(companyVO);
        model.addAttribute("CompanyList", Result);
        return "redirect:/company.do";
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

    //project page
    @RequestMapping(value = "/project.do", method = RequestMethod.GET)
    public String project(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();

        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);

        return "project/project";
    }

    //project 글쓰기 페이지 이동
    @RequestMapping(value = "/project_write.do", method = RequestMethod.GET)
    public String project_write() {
        return "project/project_write";
    }

    //project 상세 페이지 이동
    @RequestMapping(value = "/project_content.do", method = RequestMethod.GET)
    public String project_content() {
        return "project/project_content";
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

    //페이지 이동
    @RequestMapping(value = "/usermanagement.do", method = RequestMethod.GET)
    public String usermanagement() {
        return "/usermanagement/usermanagement";
    }


    //인원관리 엑셀 폼 다운로드
    @RequestMapping(value = "/excelform_download.do", method = RequestMethod.GET)
    public void excelDownload(HttpServletResponse response) throws IOException {
        System.out.println("excelform download");
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;
        sheet.setColumnWidth((short) 0, (short) 3000);
        sheet.setColumnWidth((short) 1, (short) 6000);
        sheet.setColumnWidth((short) 2, (short) 3000);
        sheet.setColumnWidth((short) 3, (short) 6000);
        sheet.setColumnWidth((short) 4, (short) 5000);
        sheet.setColumnWidth((short) 5, (short) 5000);
        sheet.setColumnWidth((short) 6, (short) 3000);
        sheet.setColumnWidth((short) 7, (short) 3000);


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
        cell.setCellValue("팀명");
        cell = row.createCell(6);
        cell.setCellValue("직급");
        cell = row.createCell(7);
        cell.setCellValue("상태");
        cell = row.createCell(8);
        cell.setCellValue("회사번호");


        // Body
        for (int i = 0; i < 8; i++) {
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
            cell = row.createCell(7);
            cell.setCellValue(0);
            cell = row.createCell(8);
            cell.setCellValue(1);
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=form_management.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }

    //인원관리 엑셀 다운로드
    @RequestMapping(value = "/ExcelDownload.do", method = RequestMethod.GET)
    public void ExcelGET(@ModelAttribute("customerVO") CustomerVO customerVO, HttpServletRequest
            request, HttpServletResponse response, ModelMap model) throws Exception {
        System.out.println("인원관리 다운로드");
        excelService.getUserExcel(customerVO, request, response);
    }

    //인원관리 엑셀 업로드
    @ResponseBody
    @RequestMapping(value = "/ExcelUpload.do", method = RequestMethod.POST)
    public ResponseEntity<ExcelVO> memberExcelUp(MultipartHttpServletRequest request, HttpServletResponse response) {
        System.out.println("컨트롤러 넘어옴");
        ExcelVO excelVO = new ExcelVO();
        response.setCharacterEncoding("UTF-8");
        try {
            MultipartFile file = null;
            Iterator<String> iterator = request.getFileNames();
            // Excel 파일 가져오기
            if (iterator.hasNext()) {
                file = request.getFile(iterator.next());
                System.out.println(file);
            }
            System.out.println("서비스단 실행전");
            excelService.memberExcelUp(file);
            return new ResponseEntity<>(excelVO, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(excelVO, HttpStatus.OK);
        }
    }

}






