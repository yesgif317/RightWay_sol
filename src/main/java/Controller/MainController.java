package Controller;

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
import File.Service.FileService;
import File.Dto.FileVO;
import Post.Dto.NormalVO;
import Post.Service.NormalService;
import Project.Dto.ProjectVO;
import Project.Service.ProjectService;
import Risk.Dto.RiskVO;
import Risk.Service.RiskService;
import Team.Dto.TeamVO;
import Team.Dto.TeammemberVO;
import Team.Service.TeamService;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;


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

    @Inject
    private NormalService normalService;

    @Inject
    private CompanyService companyService;

    @Inject
    private EventService eventService;

    @Inject
    private ProjectService projectService;

    @Inject
    private TeamService teamService;

    @Inject
    private RiskService riskService;


    // 메인 페이지 이동 및 차트 데이터 가져오기
    @RequestMapping(value = "/index.do", method = RequestMethod.GET)
    public String main(Model model) {
        List<NormalVO> normalVOList = normalService.selectNotice();
        System.out.println(normalVOList);

        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("NormalList", normalVOList);
        return "index";
    }

    //로그인 GET,POST
    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String loginGET(@ModelAttribute("LoginDTO") LoginDTO loginDTO) {
        return "user/login";
    }

    @RequestMapping(value = "/loginPost.do", method = RequestMethod.POST)
    public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {

        CustomerVO customerVO = customerService.login(loginDTO);

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

    //아이디 중복체크 GET, POST
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

    //회사선택 GET, POST
    @RequestMapping(value = "/comCheck.do", method = RequestMethod.GET)
    public String comCheckGET() {
        return "user/comCheck";
    }

    @RequestMapping(value = "/comCheck.do", method = RequestMethod.POST)
    public String comCheckPOST(HttpServletRequest request, Model model) throws Exception {
        String com_name = request.getParameter("com_name");

        List<CompanyVO> companyList = companyService.checkCompany(com_name);


        model.addAttribute("companyList", companyList);
        System.out.println(companyList);

        return "user/comCheck";
    }


    //회원가입 GET, POST
    @RequestMapping(value = "/register.do", method = RequestMethod.GET)
    public String registerGET() {
        return "user/register";
    }

    @RequestMapping(value = "/register.do", method = RequestMethod.POST)
    public String registerPOST(CustomerVO customerVO, RedirectAttributes redirectAttributes) throws Exception {

        System.out.println("Post register");
        customerService.insertCustomer(customerVO);
        redirectAttributes.addFlashAttribute("msg", "REGISTERED");

        return "redirect:/login.do";
    }

    //로그아웃
    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
    public String logout(HttpServletRequest request,
                         HttpServletResponse response,
                         HttpSession httpSession) throws Exception {
        System.out.println(httpSession.getAttribute("login"));
        Object object = httpSession.getAttribute("login");
        System.out.println(object);

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

    //마이페이지
    @RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
    public String mypage() {
        return "user/mypage";
    }

    //산출물 게시판 글목록 보기 cate=1
    @RequestMapping(value = "/outputs.do", method = RequestMethod.GET)
    public String outputs(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<NormalVO> postVoList = normalService.selectAll(1);
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("PostList", postVoList);
        return "/outputs/outputs";
    }

    //산출물 게시글 작성 페이지
    @RequestMapping(value = "/outputs_write.do", method = RequestMethod.GET)
    public String outputs_write(@RequestParam("post_num") int no, Model model) {
        if (no > 0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        } else {
        }
        return "/outputs/outputs_write";
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
    public String outputs_update(Model model, NormalVO postVO) {

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


    @RequestMapping(value = "/notice.do", method = RequestMethod.GET)//공지사항 게시판 글목록 보기
    public String notice(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<NormalVO> normalVOList = normalService.selectNotice();
        System.out.println(normalVOList);

//        for(int i = 0; i<normalVOList.size();i++){
//           normalVOList.get(i).setCus_name(customerService.selectNumToName(normalVOList.get(i).getCus_num()));
//        }
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("NormalList", normalVOList);
        return "/notice/notice";
    }

    @RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
    public String notice_write(Model model) {

        return "/notice/notice_write";
    }

    //작성한 공지사항 DB저장
    @RequestMapping(value = "/notice_insert.do",method = RequestMethod.POST)
    public String notice_insert(MultipartFile[] uploadFile, @RequestParam(value = "title") String title
            , @RequestParam(value = "contents") String contents, @RequestParam(value = "cus_num") String cus_num) {

//        MultipartHttpServletRequest mult_req = (MultipartHttpServletRequest)request;
        System.out.println("//Title : " + title + "//Contents : " + contents + "//requestFile : " + uploadFile + cus_num);

        //int prj_num = Integer.parseInt(request.getParameter("prj_num"));
        //게시글 저장
        NormalVO normal = new NormalVO(12, 2, title, contents, Integer.parseInt(cus_num));
        normalService.insertPost(normal);
        //첨부파일저장
        fileService.insertFile(uploadFile,2,12);

        return "redirect:/notice.do";
    }

    @RequestMapping(value = "/notice_content.do", method = RequestMethod.GET)
    public String notice_content(@RequestParam("post_num") int no, Model model) {
        NormalVO Result = normalService.viewPost(no);
        model.addAttribute("PostList", Result);

        return "/notice/notice_content";
    }

    //요청사항 게시판 글목록 보기 cate=15
    @RequestMapping(value = "/request.do", method = RequestMethod.GET)
    public String request(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<NormalVO> postVoList = normalService.selectAll(15);
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("PostList", postVoList);
        return "/request/request";
    }

    //요청사항 게시글 작성 페이지
    @RequestMapping(value = "/request_write.do", method = RequestMethod.GET)
    public String request_write(@RequestParam("post_num") int no, Model model) {
        if (no > 0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        } else {
        }
        return "/request/request_write";
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
    public String request_update(Model model, NormalVO postVO) {

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

    //issue page
    @RequestMapping(value = "/issue.do", method = RequestMethod.GET)
    public String issue(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<RiskVO> riskVOList = riskService.selectIssue();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("RiskList", riskVOList);

        return "issue/issue";
    }

    //issue 글쓰기 페이지 이동
    @RequestMapping(value = "/issue_write.do", method = RequestMethod.GET)
    public String issue_write(@RequestParam("post_num") int post_num, Model model) {
        List<CustomerVO> customerVOList = customerService.selectAllCustomer();
        model.addAttribute("CustomerList",customerVOList);
        if(post_num>0){
            RiskVO Result = riskService.viewRisk(post_num);
            model.addAttribute("RiskList",Result);
        }
        return "issue/issue_write";
    }

    //issue 상세 페이지 이동
    @RequestMapping(value = "/issue_content.do", method = RequestMethod.GET)
    public String issue_content(@RequestParam("post_num") int post_num, Model model) {
        RiskVO Result = riskService.viewRisk(post_num);
        model.addAttribute("RiskList",Result);
        return "issue/issue_content";
    }

    //issue insert
    @RequestMapping(value = "/issue_insert.do", method = RequestMethod.POST)
    public String issue_insert(Model model, RiskVO riskVO) {
        System.out.println(riskVO.getRisk_imp());
        String Result = riskService.insertRisk(riskVO);
        model.addAttribute("RiskList", Result);
        return "redirect:/issue.do";
    }

    //issue delete
    @RequestMapping(value = "/issue_delete.do", method = RequestMethod.GET)
    public String issue_delete(@RequestParam("post_num") int post_num) {
        riskService.delete(post_num);
        return "redirect:/issue.do";
    }

    //issue update
    @RequestMapping(value = "/issue_update.do", method = RequestMethod.POST)
    public String issue_update(Model model, RiskVO riskVO) {
        System.out.println(riskVO.getRisk_tit());
        System.out.println(riskVO.getRisk_mng());
        System.out.println(riskVO.getRisk_pgs());
        System.out.println(riskVO.getRisk_imp());
        String Result = riskService.updateRisk(riskVO);
        model.addAttribute("RiskList", Result);
        return "redirect:/issue.do";
    }

    //회의록 목록 보기 cate=2
    @RequestMapping(value = "/meetingrecord.do", method = RequestMethod.GET)
    public String meetingrecord(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<NormalVO> PostVoList = normalService.selectAll(2);
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("PostList", PostVoList);
        return "meetingrecord/meetingrecord";
    }

    //회의록 게시글 작성 페이지
    @RequestMapping(value = "/meetingrecord_write.do", method = RequestMethod.GET)
    public String meetingrecord_write(@RequestParam("post_num") int no, Model model) {
        if (no > 0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        } else {
        }
        return "/meetingrecord/meetingrecord_write";
    }

    //회의록 작성글 보기
    @RequestMapping(value = "/meetingrecord_content.do", method = RequestMethod.GET)
    public String meetingrecord_content(@RequestParam("post_num") int no, Model model) {
        NormalVO Result = normalService.viewPost(no);
        model.addAttribute("PostList", Result);
        return "/meetingrecord/meetingrecord_content";
    }

    //회의록 작성글 삭제
    @RequestMapping(value = "/meetingrecord_delete.do", method = RequestMethod.GET)
    public String meetingrecord_delete(@RequestParam("post_num") int no) {
        normalService.deletePost(no);
        return "redirect:/meetingrecord.do";
    }

    //회의록 작성글 수정 기능
    @RequestMapping(value = "/meetingrecord_update.do", method = RequestMethod.POST)
    public String meetingrecord_update(Model model, NormalVO postVO) {

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

    //정기보고 목록 보기 cate=3
    @RequestMapping(value = "/regularreport.do", method = RequestMethod.GET)
    public String regularreport(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<NormalVO> PostVoList = normalService.selectAll(3);
        //.jsp 파일로 DB 결과값 전달하기
        model.addAttribute("PostList", PostVoList);
        return "regularreport/regularreport";
    }

    //정기보고 게시글 작성 페이지
    @RequestMapping(value = "/regularreport_write.do", method = RequestMethod.GET)
    public String regularreport_write(@RequestParam("post_num") int no, Model model) {
        if (no > 0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        } else {
        }
        return "/regularreport/regularreport_write";
    }

    //정기보고 작성글 보기
    @RequestMapping(value = "/regularreport_content.do", method = RequestMethod.GET)
    public String regularreport_content(@RequestParam("post_num") int no, Model model) {
        NormalVO Result = normalService.viewPost(no);
        model.addAttribute("PostList", Result);
        return "/regularreport/regularreport_content";
    }

    //정기보고 작성글 삭제
    @RequestMapping(value = "/regularreport_delete.do", method = RequestMethod.GET)
    public String regularreport_delete(@RequestParam("post_num") int no) {
        normalService.deletePost(no);
        return "redirect:/regularreport.do";
    }

    //정기보고 작성글 수정 기능
    @RequestMapping(value = "/regularreport_update.do", method = RequestMethod.POST)
    public String regularreport_update(Model model, NormalVO postVO) {

        String Result = normalService.updatePost(postVO);
        model.addAttribute("PostList", Result);
        return "redirect:/regularreport.do";
    }

    // 정기보고 게시글 작성 기능
    @RequestMapping(value = "/regularreport_insert.do", method = RequestMethod.POST)
    public String regularreport_insert(Model model, NormalVO postVO) {
        String Result = normalService.insertPost(postVO);
        return "redirect:/regularreport.do";
    }

    //danger page
    @RequestMapping(value = "/danger.do", method = RequestMethod.GET)
    public String danger(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<RiskVO> riskVOList = riskService.selectDanger();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("RiskList", riskVOList);

        return "danger/danger";
    }

    //danger 글쓰기 페이지 이동
    @RequestMapping(value = "/danger_write.do", method = RequestMethod.GET)
    public String danger_write(@RequestParam("post_num") int post_num, Model model) {
        List<CustomerVO> customerVOList = customerService.selectAllCustomer();
        model.addAttribute("CustomerList",customerVOList);
        if(post_num>0){
            RiskVO Result = riskService.viewRisk(post_num);
            model.addAttribute("RiskList",Result);
        }
        return "danger/danger_write";
    }

    //danger 상세 페이지 이동
    @RequestMapping(value = "/danger_content.do", method = RequestMethod.GET)
    public String danger_content(@RequestParam("post_num") int post_num, Model model) {
        RiskVO Result = riskService.viewRisk(post_num);
        model.addAttribute("RiskList",Result);
        return "danger/danger_content";
    }

    //danger insert
    @RequestMapping(value = "/danger_insert.do", method = RequestMethod.POST)
    public String danger_insert(Model model, RiskVO riskVO) {
        String Result = riskService.insertRisk(riskVO);
        model.addAttribute("RiskList", Result);
        return "redirect:/danger.do";
    }

    //danger delete
    @RequestMapping(value = "/danger_delete.do", method = RequestMethod.GET)
    public String danger_delete(@RequestParam("post_num") int post_num) {
        riskService.delete(post_num);
        return "redirect:/danger.do";
    }

    //danger update
    @RequestMapping(value = "/danger_update.do", method = RequestMethod.POST)
    public String danger_update(Model model, RiskVO riskVO) {
        String Result = riskService.updateRisk(riskVO);
        model.addAttribute("RiskList", Result);
        return "redirect:/danger.do";
    }


    //adminpermission page (관리자 승인)
    @RequestMapping(value = "/adminpermission.do", method = RequestMethod.GET)
    public String adminpermission(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<CustomerVO> customerVOList = customerService.select_nonPermissionCus();

        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("CustomerList", customerVOList);

        return "/adminpermission/adminpermission";
    }

    //event page
    @RequestMapping(value = "/event.do", method = RequestMethod.GET)
    public String event(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<EventVO> eventVOList = eventService.selectEvent();
        System.out.println(eventVOList);
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("EventList", eventVOList);

        return "event/event";
    }

    //행사관리 글쓰기 페이지 이동
    @RequestMapping(value = "/event_write.do", method = RequestMethod.GET)
    public String event_write(@RequestParam("post_num") int post_num, Model model) {
        if (post_num > 0) {
            EventVO Result = eventService.viewEvent(post_num);
            model.addAttribute("EventList", Result);
        }
        return "event/event_write";
    }

    //행사관리 상세 페이지 이동
    @RequestMapping(value = "/event_content.do", method = RequestMethod.GET)
    public String event_content(@RequestParam("post_num") int post_num, Model model) {
        EventVO Result = eventService.viewEvent(post_num);
        model.addAttribute("EventList", Result);
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
        if (com_num > 0) {
            CompanyVO Result = companyService.viewCompany(com_num);
            model.addAttribute("CompanyList", Result);
        }
        return "company/company_write";
    }

    //company 상세 페이지 이동
    @RequestMapping(value = "/company_content.do", method = RequestMethod.GET)
    public String company_content(@RequestParam("com_num") int com_num, Model model) {
        CompanyVO Result = companyService.viewCompany(com_num);
        model.addAttribute("CompanyList", Result);
        return "company/company_content";
    }

    //company insert
    @RequestMapping(value = "/company_insert.do", method = RequestMethod.POST)
    public String company_insert(Model model, CompanyVO companyVO) {
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

    //project page
    @RequestMapping(value = "/project.do", method = RequestMethod.GET)
    public String project(Model model) {
        System.out.println("controller");
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기

        List<ProjectVO> projectVOList = projectService.selectProject();

        System.out.println(projectVOList);
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("ProjectList", projectVOList);

        return "project/project";
    }

    //project 글쓰기 페이지 이동
    @RequestMapping(value = "/project_write.do", method = RequestMethod.GET)
    public String project_write(@RequestParam("prj_num") int prj_num, Model model) {
        if (prj_num > 0) {
            ProjectVO Result = projectService.viewProject(prj_num);
            model.addAttribute("ProjectList", Result);
        }
        return "project/project_write";
    }

    //project 상세 페이지 이동
    @RequestMapping(value = "/project_content.do", method = RequestMethod.GET)
    public String project_content(@RequestParam("prj_num") int prj_num, Model model) {
        ProjectVO Result = projectService.viewProject(prj_num);
        model.addAttribute("ProjectList", Result);
        return "project/project_content";
    }

    //project insert
    @RequestMapping(value = "/project_insert.do", method = RequestMethod.POST)
    public String project_insert(Model model, ProjectVO projectVO) {
        String Result = projectService.insertProject(projectVO);
        model.addAttribute("ProjectList", Result);
        return "redirect:/project.do";
    }

    //project delete
    @RequestMapping(value = "/project_delete.do", method = RequestMethod.GET)
    public String project_delete(@RequestParam("prj_num") int prj_num) {
        projectService.delete(prj_num);
        return "redirect:/project.do";
    }

    //project update
    @RequestMapping(value = "/project_update.do", method = RequestMethod.POST)
    public String project_update(Model model, ProjectVO projectVO) {
        String Result = projectService.updateProject(projectVO);
        model.addAttribute("ProjectList", Result);
        return "redirect:/project.do";
    }



    //팀관리 게시글 작성 페이지
    @RequestMapping(value = "/team_write.do", method = RequestMethod.GET)
    public String team_write(@RequestParam("team_num") int no, Model model) {
        List<CustomerVO> customerVoList = customerService.selectAllCustomer();
        List<TeammemberVO> teammemberVOList = teamService.viewTeammember(no);
        List<CustomerVO> cusmodalVoList=customerService.selectAllCustomer();
        List<CustomerVO> testList= new ArrayList<>();
        TeamVO teamVoList = teamService.viewTeam(no);
        for (TeammemberVO teammemberVO : teammemberVOList) {
            for (CustomerVO customerVO : customerVoList) {
                if(Integer.parseInt(String.valueOf(customerVO.getCus_num()))==Integer.parseInt(String.valueOf(teammemberVO.getCus_num()))){
                    testList.add(customerVO);
                }
            }
        }
        for (int i=0;i<testList.size();i++){
            cusmodalVoList.remove(testList.get(i));
        }

        model.addAttribute("CusmodalList", cusmodalVoList);
        model.addAttribute("CustomerList", customerVoList);
        model.addAttribute("TeamList", teamVoList);
        model.addAttribute("TeammemberList", teammemberVOList);
        return "/team/team_write";
    }
    //팀관리 목록
    @RequestMapping(value = "/team.do", method = RequestMethod.GET)
    public String team(Model model) {
        List<TeamVO> teamVoList = teamService.selectTeam();
        model.addAttribute("TeamList", teamVoList);
        List<TeammemberVO> teammemberVoList = teamService.countmember();
        model.addAttribute("TeammemberList", teammemberVoList);
        return "team/team";
    }

    //팀관리 작성글 보기
    @RequestMapping(value = "/team_content.do", method = RequestMethod.GET)
    public String team_content(@RequestParam("team_num") int no, Model model) {
        TeamVO teamVoList = teamService.viewTeam(no);
        model.addAttribute("TeamList", teamVoList);
        List<TeammemberVO> Result = teamService.viewTeammember(no);
        model.addAttribute("TeammemberList", Result);
        List<CustomerVO> customerVoList = customerService.selectAllCustomer();
        model.addAttribute("CustomerList", customerVoList);
        return "team/team_content";
    }
    //팀관리 작성글 삭제
    @RequestMapping(value = "/team_delete.do", method = RequestMethod.GET)
    public String team_delete(@RequestParam("team_num") int no) {
        teamService.deletemember(no);
        teamService.deleteTeam(no);
        return "redirect:/team.do";
    }
    //팀관리 작성글 수정 기능
    @RequestMapping(value = "/team_update.do", method = RequestMethod.POST)
    public String team_update(Model model, TeamVO teamVO) {
        String Result = teamService.updateTeam(teamVO);
        model.addAttribute("TeamList", Result);
        return "redirect:/team.do";
    }
    // 팀관리 팀 등록 기능
    @RequestMapping(value = "/team_insert.do", method = RequestMethod.POST)
    public String team_insert(Model model, TeamVO teamVO) {
        String Result = teamService.insertTeam(teamVO);
        model.addAttribute("TeamList", Result);
        return "redirect:/team.do";
    }
    //팀관리 팀원 삭제
    @RequestMapping(value = "/teammember_delete.do", method = RequestMethod.DELETE)
    public String teammember_delete(@RequestParam("team_num") int team_num,Model model,TeammemberVO teammemberVO) {
        teamService.deleteTeammember(teammemberVO);
        return "redirect:/team_write.do?team_num="+team_num+"&update=1";
    }
    // 팀관리 팀원 등록 기능
    @RequestMapping(value = "/teammember_insert.do", method = RequestMethod.POST)
    public String teammember_insert(@RequestParam("team_num") int team_num,Model model, TeammemberVO teammemberVO) {
        String Result = teamService.insertTeammember(teammemberVO);
        model.addAttribute("TeammemberList", Result);

        return "redirect:/team_write.do?team_num="+team_num+"&update=1";
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
        //BoardVO result = service.selectboard();
        //model.addAttribute("BoardList", boardVoList);
        return "" +
                "update";
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

    //자료실
    @RequestMapping(value = "/datacenter_content.do", method = RequestMethod.GET)
    public String datacenter_content(@RequestParam("post_num") int no, Model model) {
        NormalVO Result = normalService.viewPost(no);
        model.addAttribute("PostList", Result);
        return "/datacenter/datacenter_content";
    }

    @RequestMapping(value = "/datacenter.do", method = RequestMethod.GET)
    public String datacenter(Model model) {
        List<NormalVO> normalVOList = normalService.selectAll(13);
        model.addAttribute("PostList", normalVOList);

        return "/datacenter/datacenter";
    }

    @RequestMapping(value = "/datacenter_write.do", method = RequestMethod.GET)
    public String datacenter_writer() {
        return "/datacenter/datacenter_write";
   }

    //파일 업로드
//    @GetMapping("/file-upload.do")
//    public void uploadAjax() {
//        System.out.println("upload ajax");
//    }

    //자료실 파일 업로드
    @PostMapping("/file-upload.do")
    public String uploadAjaxPost(MultipartFile[] uploadFile, @RequestParam(value = "title") String title
            , @RequestParam(value = "contents") String contents) {
        System.out.println("update ajax post.................");
        System.out.println(title + contents);
        fileService.insertFile(uploadFile, 1, 13);
        return "index";
    }

    @RequestMapping(value = "/usermanagement.do", method = RequestMethod.GET)
    public String usermanagement() {
        return "/usermanagement/usermanagement";
    }


    @RequestMapping(value = "/excelform_download.do", method = RequestMethod.GET)
    public void excelDownload(HttpServletResponse response) throws IOException {
        System.out.println("엑셀폼 다운로드");
        XSSFWorkbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet();
        sheet.setColumnWidth((short) 0, (short) 6000);
        sheet.setColumnWidth((short) 1, (short) 4000);
        sheet.setColumnWidth((short) 2, (short) 3000);
        sheet.setColumnWidth((short) 3, (short) 8000);
        sheet.setColumnWidth((short) 4, (short) 5000);
        sheet.setColumnWidth((short) 5, (short) 3000);
        sheet.setColumnWidth((short) 6, (short) 3000);
        sheet.setColumnWidth((short) 7, (short) 3000);
        sheet.setColumnWidth((short) 8, (short) 5000);

        Row row = sheet.createRow(0);
        Cell cell = null;
        CellStyle cs = wb.createCellStyle();
        Font font = wb.createFont();
        cell = row.createCell(0);
        cell.setCellValue("투입인력 관리");
        sheet.addMergedRegion(new CellRangeAddress(row.getRowNum(), row.getRowNum(), 0, 9));
        int rowNum = 1;

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
        cell.setCellValue("계정상태");

        cell = row.createCell(8);
        cell.setCellValue("회사명");


        // Body
        for (int i = 0; i < 9; i++) {
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(i + "_ID");
            cell = row.createCell(1);
            cell.setCellValue(i + "_PWD");
            cell = row.createCell(2);
            cell.setCellValue(i + "_NAME");
            cell = row.createCell(3);
            cell.setCellValue(i + "_EMAIL");
            cell = row.createCell(4);
            cell.setCellValue(i + "_PHONE");
            cell = row.createCell(5);
            cell.setCellValue(i + "_DEP");
            cell = row.createCell(6);
            cell.setCellValue(i + "_POSITION");
            cell = row.createCell(7);
            cell.setCellValue(0);
            cell = row.createCell(8);
            cell.setCellValue(i + "_COMNAME");
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=form_management.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }

    @ResponseBody
    @RequestMapping(value = "/ExcelUpload.do", method = RequestMethod.POST)
    public ResponseEntity<ExcelVO> memberExcelUp(MultipartHttpServletRequest request, HttpServletResponse response) {
        System.out.println("컨트롤러 넘어옴");
        ExcelVO excelVO = new ExcelVO();
        response.setCharacterEncoding("UTF-8");
        try {
            MultipartFile file = null;
            Iterator<String> iterator = request.getFileNames();
            if (iterator.hasNext()) {
                file = request.getFile(iterator.next());
                System.out.println(file);
            }
            System.out.println("서비스 실행전");
            excelService.memberExcelUp(file);
            return new ResponseEntity<>(excelVO, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(excelVO, HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/ExcelDownload.do", method = RequestMethod.GET)
    public void ExcelGET(@ModelAttribute("customerVO") CustomerVO customerVO, HttpServletRequest
            request, HttpServletResponse response) throws Exception {
        System.out.println("인원관리 다운로드");
        excelService.getUserExcel(customerVO, request, response);

    }

    //승인 요청 POST
    @ResponseBody
    @PostMapping("/permission.do")
    public String permissionPost(@RequestParam(value = "c_num") String[] c_num) {
        System.out.println("permission ajax post.................");
        int[] num = new int[c_num.length];
        for (int j = 0; j < c_num.length; j++) {
            num[j] = Integer.parseInt(c_num[j]);
        }

        List<CustomerVO> list = customerService.select_PermissionCustomer(num);

        System.out.println(list);

        customerService.PermissionCustomer(list);
        System.out.println("Permission complete!");
        return "index";
    }

}






