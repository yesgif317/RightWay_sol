package Controller;

import javax.inject.Inject;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.util.List;

import Board.Dto.BoardVO;
import Board.Service.BoardService;
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
import Project.Dto.ProjectVO;
import Project.Service.ProjectService;
import Team.Dto.TeamVO;
import Team.Dto.TeammemberVO;
import Team.Service.TeamService;
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

//    마이페이지
//    @RequestMapping(value = "/mypage.do")
//    public String mypage(){
//        return "user/mypage";
//    }

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
        if(no>0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        }
        else{}
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
        for(int i = 0; i<normalVOList.size();i++){
           normalVOList.get(i).setCus_name(customerService.selectNumToName(normalVOList.get(i).getCus_num()));
        }
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("NormalList", normalVOList);
        return "/notice/notice";
    }

    @RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
    public String notice_write(Model model){

        return "/notice/notice_write";
    }


    @RequestMapping(value = "/request.do", method = RequestMethod.GET)//요청사항 게시판 글목록 보기
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

    @RequestMapping(value = "/issue_content.do", method = RequestMethod.GET)//이슈 작성글 보기
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
    public String meetingrecord_write(@RequestParam("post_num") int no,Model model) {
        if(no>0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        }
        else{}
        return "/meetingrecord/meetingrecord_write";
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
    public String regularreport_write(@RequestParam("post_num") int no,Model model) {
        if(no>0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        }
        else{}
        return "/regularreport/regularreport_write";
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

    @RequestMapping(value = "/danger.do", method = RequestMethod.GET)//위험관리 목록 보기
    public String danger(Model model) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<BoardVO> boardVoList = service.selectAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("BoardList", boardVoList);
        return "danger/danger";
    }

    @RequestMapping(value = "/danger_content.do", method = RequestMethod.GET)//위험관리 작성글 보기
    public String danger_content(@RequestParam("no") int no, Model model) {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "/danger/danger_content";
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
        if(prj_num>0){
            ProjectVO Result = projectService.viewProject(prj_num);
            model.addAttribute("ProjectList",Result);
        }
        return "project/project_write";
    }

    //project 상세 페이지 이동
    @RequestMapping(value = "/project_content.do", method = RequestMethod.GET)
    public String project_content(@RequestParam("prj_num") int prj_num, Model model) {
        ProjectVO Result = projectService.viewProject(prj_num);
        model.addAttribute("ProjectList",Result);
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
        if(no>0) {
            List<TeammemberVO> Result = teamService.viewTeammember(no);
            model.addAttribute("TeamList", Result);
        }
        else{}
        List<CustomerVO> Result1 = customerService.selectAll();
        model.addAttribute("CustomerList", Result1);
        return "/team/team_write";
    }
    //팀관리 page
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
        return "team/team_content";
    }
    //팀관리 작성글 삭제
    @RequestMapping(value = "/team_delete.do", method = RequestMethod.GET)
    public String team_delete(@RequestParam("team_num") int no) {
        teamService.deleteTeammember(no);
        teamService.deleteTeam(no);
        return "redirect:/team.do";
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

    //자료실
    @RequestMapping(value = "/datacenter_content.do", method = RequestMethod.GET)
    public String datacenter_content(@RequestParam("post_num") int no, Model model) {
        NormalVO Result = normalService.viewPost(no);
        model.addAttribute("PostList", Result);
        return "/datacenter/datacenter_content";
    }
    @RequestMapping(value = "/datacenter.do",method = RequestMethod.GET)
    public String datacenter(Model model){
        List<NormalVO> normalVOList = normalService.selectAll(13);
        model.addAttribute("PostList",normalVOList);

        return "/datacenter/datacenter";
   }
   @RequestMapping(value = "/datacenter_write.do", method = RequestMethod.GET)
   public String datacenter_writer(){
        return "/datacenter/datacenter_write";
   }
    @PostMapping("/file-upload.do")
    public String datacenter_Post(MultipartFile[] uploadFile, @RequestParam(value = "title") String title
            , @RequestParam(value = "contents") String contents) {
        System.out.println("update ajax post.................");
        System.out.println(title + contents);
        fileService.insertFile(uploadFile, 1, 13);

        return "index";
    }

    //파일 업로드
    @GetMapping("/file-upload.do")
    public void uploadAjax() {
        System.out.println("upload ajax");
    }

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
    //승인 요청 POST
    @ResponseBody
    @PostMapping("/permission.do")
    public String permissionPost(@RequestParam(value = "c_num") String[] c_num) {
        System.out.println("permission ajax post.................");
        int[] num = new int[c_num.length];
        for(int j=0;j<c_num.length;j++) {
            num[j] = Integer.parseInt(c_num[j]);
        }

        List<CustomerVO> list = customerService.select_PermissionCustomer(num);

        System.out.println(list);

        customerService.PermissionCustomer(list);
        System.out.println("Permission complete!");
        return "index";
    }

}






