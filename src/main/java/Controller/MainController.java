package Controller;

import Board.Service.BoardService;
import Comment.Dto.CommentVO;
import Comment.Service.CommentService;
import Commons.Excel.Dto.ExcelDTO;
import Commons.Excel.Dto.StatusEnum;
import Commons.Excel.Service.ExcelService;
import Commons.ScriptUtil.ScriptUtil;
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
import Project.Dto.ProjectDetailVO;
import Project.Dto.ProjectVO;
import Project.Service.ProjectService;
import Re_Comment.Dto.Re_CommentVO;
import Re_Comment.Service.Re_CommentService;
import Risk.Dto.RiskVO;
import Risk.Service.RiskService;
import Team.Dto.TeamVO;
import Team.Dto.TeammemberVO;
import Team.Service.TeamService;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.charset.Charset;
import java.util.*;

import static java.lang.Integer.parseInt;


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

    @Inject
    private CommentService commentService;
    @Inject
    private Re_CommentService re_commentService;


    // 각 게시판별, comment 값 받아오기 위한 메서드 작성
    public class AddCmt {
        public void comment(int post_num, Model model, HttpServletRequest request) {
            List<CommentVO> commentVoList = commentService.selectCommentAll();
            // .jsp 파일로 DB 결과값 전달하기
            model.addAttribute("CommentList", commentVoList);

            //Re_comment
            List<Re_CommentVO> Re_commentVOList = re_commentService.selectRe_CommentAll();
            model.addAttribute("Re_CommentList", Re_commentVOList);

            int countComment = commentService.countComment(post_num);
            model.addAttribute("countComment", countComment);

            String uri = request.getRequestURI();
            String post_num_str = Integer.toString(post_num);
            uri += "?post_num=" + post_num_str;
            System.out.println("uri: " + uri);
            // uri값 jsp로 보내기
            model.addAttribute("uri", uri);
        }
    }

    public class Addd extends AddCmt {
    }
    // 메서드 종료

    public class Selcus {
        public List<ProjectVO> selectcus(Model model, HttpSession httpSession) {

            //login시 만든 회원정보 세션 불러오기
            Object object = httpSession.getAttribute("login");

            //로그인한 계정정보로 프로젝트 조회
            List<ProjectVO> projectVOList = projectService.projectVOList(object);
            httpSession.setAttribute("ProjectList", projectVOList);

            return projectVOList;

        }
    }

    public class Scus extends Selcus {
    }


    // 메인 페이지 이동 및 차트 데이터 가져오기
    @RequestMapping(value = "/index.do", method = RequestMethod.GET)
    public String main(Model model, HttpServletRequest request,
                       HttpServletResponse response,
                       HttpSession httpSession, ModelAndView modelAndView) {

        //프로젝트 이름이 선택되어있는 경우
        if (httpSession.getAttribute("prj_list") != null) {
            Object object = httpSession.getAttribute("prj_list");
            ProjectVO selectproject_list = projectService.selectproject_list2(object);
            httpSession.setAttribute("prj_list", selectproject_list);
        }
        //프로젝트 이름이 선택되지 않은 경우
        else {
            Selcus selcus = new Scus();
            List<ProjectVO> projectVOList = selcus.selectcus(model, httpSession);
            //프로젝트가 존재하는지 여부
            if (projectVOList.size() != 0) {
                ProjectVO selectproject_list = projectService.selectproject_list(projectVOList.get(0).getPrj_name());
                httpSession.setAttribute("prj_list", selectproject_list);
            } else {
                System.out.println("do not have project");
                httpSession.setAttribute("prj_list", null);
                return "redirect:/project_write.do?prj_num=0&update=0";
            }
        }

        Object object_cus = httpSession.getAttribute("login");
        Object object = httpSession.getAttribute("prj_list");
        List<NormalVO> normalVOList = normalService.selectNotice(object);
        List<RiskVO> RiskVOList = riskService.selectDanger(object);
        List<RiskVO> IssueVOList = riskService.selectIssue(object);
        List<EventVO> EventVOList = eventService.selectEvent(object);
        List<CommentVO> CommentVOList = commentService.selectComment_fromNew(object_cus);


        httpSession.setAttribute("RVList", RiskVOList);
        httpSession.setAttribute("IVList", IssueVOList);
        httpSession.setAttribute("NormalList", normalVOList);
        httpSession.setAttribute("EvtList", EventVOList);
        httpSession.setAttribute("CommentList", CommentVOList);

        return "index";
    }

    @ResponseBody
    @PostMapping("Select_project.do")
    public String select_prj(@RequestParam(value = "prj_name", required = false) String prj_name, HttpSession httpSession, Model model) {

        //프로젝트 변경 메서드드
       if (prj_name != null) {
            ProjectVO selectproject_list = projectService.selectproject_list(prj_name);
            httpSession.setAttribute("prj_list", selectproject_list);
        } else {
            return "forward:/index.do";
        }
        //메인페이지 차트 데이터를 위한 세션 유지
        Object object = httpSession.getAttribute("prj_list");
        List<NormalVO> normalVOList = normalService.selectNotice(object);
        List<RiskVO> RiskVOList = riskService.selectDanger(object);
        List<RiskVO> IssueVOList = riskService.selectIssue(object);

        httpSession.setAttribute("RVList", RiskVOList);
        httpSession.setAttribute("IVList", IssueVOList);
        httpSession.setAttribute("NormalList", normalVOList);
        return "forward:/index.do";
    }

    // 비밀번호 찾기 GET, POST
    @RequestMapping(value = "/forgot_password.do", method = RequestMethod.GET)
    public String forgot_password_GET() {
        return "user/forgot_password";
    }

    @ResponseBody
    @RequestMapping(value = "/forgot_password.do", method = RequestMethod.POST)
    public String forgot_password_POST(@ModelAttribute CustomerVO customerVO, HttpServletResponse response) throws Exception {
        customerService.findPw(response, customerVO);
        return "user/forgot_password";
    }

    //로그인 GET,POST
    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String loginGET(@ModelAttribute("LoginDTO") LoginDTO loginDTO) {
        return "user/login";
    }

    @RequestMapping(value = "/loginPost.do", method = RequestMethod.POST)
    public String loginPOST(LoginDTO loginDTO, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession, Model model) throws Exception {

        //로그인창 Null값 제외하기위한 아이디 체크
        if(customerService.idnullCheck(loginDTO) == 0) {
            return "/loginPost";
        }
        //해당 아이디의 세션 유무 확인후 없을시 로그인 가능(다중로그인 차단용, 로그인 되어있는 계정 로그인시 차단)
        CustomerVO checksession = customerService.checkLogin(loginDTO);
        if (!Objects.equals(checksession.getCus_sess_key(), "none")){
            return "user/loginoverlap";
        }

        CustomerVO customerVO = customerService.login(loginDTO);

        //입력한 비밀번호와 암호화된 비밀번호 일치한지 확인
        if (customerVO == null || !BCrypt.checkpw(loginDTO.getCus_pwd(), customerVO.getCus_pwd())) {
            return "/loginPost";
        }
        //계정 상태값 확인해서 승인안되어있을시 로그인에러 창으로 넘어가게함.
        if (customerVO.getCus_state() == 0) {
            return "user/loginerror";
        }

        model.addAttribute("customerVO", customerVO);

        // 로그인 유지를 선택할 경우
        if (loginDTO.isUseCookie()) {
            int amount = 60 * 60 * 4;  // 4시간
            Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정
            customerService.keepLogin(customerVO.getCus_id(), httpSession.getId(), sessionLimit);
        }
        return "/loginPost";
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
    public String comCheckGET(Model model) throws Exception {
        System.out.println("allselect");
        List<CompanyVO> companyList = companyService.checkCompany("");
        model.addAttribute("companyList", companyList);
        return "user/comCheck";
    }

    @RequestMapping(value = "/comCheck.do", method = RequestMethod.POST)
    public String comCheckPOST(HttpServletRequest request, Model model) throws Exception {
        System.out.println("textselect");
        String com_name = request.getParameter("com_name");
        List<CompanyVO> companyList = companyService.checkCompany(com_name);
        model.addAttribute("companyList", companyList);
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

    //마이페이지
    @RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
    public String mypage() {
        return "user/mypage";
    }

    //mypage update
    @RequestMapping(value = "/mypage_update.do", method = RequestMethod.POST)
    public String mypage_update(HttpServletRequest request, Model model, CustomerVO customerVO) {
        String Result = customerService.updateCustomer(customerVO);
        model.addAttribute("CustomerList", Result);
        HttpSession httpSession = request.getSession();
        CustomerVO customerview = customerService.viewCustomer(parseInt(customerVO.getCus_num()));
        httpSession.setAttribute("login", customerview);
        return "user/mypage";
    }

    @RequestMapping(value = "/updatePassword.do", method = RequestMethod.POST)
    public String updatePassword(@RequestParam("check_pwd") String check_pwd, CustomerVO customerVO, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {
        String old_pwd = request.getParameter("old_pwd");
        System.out.println(old_pwd);
        if (!BCrypt.checkpw(old_pwd, check_pwd)) {
            redirectAttributes.addFlashAttribute("msg", "fail");
            return "redirect:/mypage.do";
        }
        customerService.updatePassword(customerVO);
        redirectAttributes.addFlashAttribute("msg", "update");
        HttpSession httpSession = request.getSession();
        CustomerVO customerview = customerService.viewCustomer(parseInt(customerVO.getCus_num()));
        httpSession.setAttribute("login", customerview);
        return "redirect:/mypage.do";
    }

    //게시판 작성글 삭제 (산출물, 정기보고, 회의록, 공지사항, 자료실, 요청사항)
    @RequestMapping(value = "/post_delete.do", method = RequestMethod.DELETE)
    public String post_delete(@RequestParam("post_num") int no, @RequestParam("cate") int cate) {

        List<CommentVO> commentList = commentService.selectCommentbyPost(no);
        for (int i = 0; i < commentList.size(); i++) {
            re_commentService.deleteRe_CommentAll(commentList.get(i).getCmt_num());
        }
        commentService.deleteCommentbyPost(no);
        normalService.deletePost(no);
        switch (cate) {
            case 1:
                return "redirect:/outputs.do";
            case 2:
                return "redirect:/meetingrecord.do";
            case 3:
                return "redirect:/regularreport.do";
            case 12:
                return "redirect:/notice.do";
            case 13:
                return "redirect:/datacenter.do";
            case 15:
                return "redirect:/request.do";
        }
        return "redirect:/request.do";
    }

    //산출물 게시판 글목록 보기 cate=1
    @RequestMapping(value = "/outputs.do", method = RequestMethod.GET)
    public String outputs(Model model, HttpSession httpSession) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        ProjectVO object = (ProjectVO) httpSession.getAttribute("prj_list");
        List<NormalVO> allpostVoList = normalService.selectAll(1);
        List<NormalVO> postVoList = new ArrayList<>();
        for (int i = 0; i < allpostVoList.size(); i++)
            if (allpostVoList.get(i).getPrj_num() == object.getPrj_num()) {
                postVoList.add(allpostVoList.get(i));
            }
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
        }
        return "/outputs/outputs_write";
    }

    //산출물 작성글 보기
    @RequestMapping(value = "/outputs_content.do", method = RequestMethod.GET)
    public String outputs_content(@RequestParam("post_num") int no, Model model, HttpServletRequest request, HttpServletResponse response) {
        NormalVO Result = normalService.viewPost(no);
        if (Result == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "존재하지 않는 게시글 입니다.", "/outputs.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }
        model.addAttribute("PostList", Result);
        // comment 추가 위한 2줄
        AddCmt addcmt = new Addd();
        addcmt.comment(no, model, request);
        // comment 종료

        //첨부파일
        List<FileVO> files = fileService.viewFiles(no);
        System.out.println(files);
        for (int i = 0; i < files.size(); i++) {
            files.get(i).setFile_link("/upload/" + files.get(i).getFile_name());
        }
        model.addAttribute("FileList", files);

        return "/outputs/outputs_content";
    }


    //산출물 작성글 수정 기능
    @RequestMapping(value = "/outputs_update.do", method = RequestMethod.POST)
    public String outputs_update(MultipartFile[] uploadFile,NormalVO postVO) {
        postVO.setNor_tit(postVO.getTitle());
        postVO.setNor_cnt(postVO.getContents());
        normalService.updatePost(postVO);
        //첨부파일저장
        if (uploadFile != null) {
            fileService.insertFile(uploadFile, postVO.getPrj_num(), 2);
        }
        return "redirect:/outputs.do";
    }

    // 산출물 게시글 작성 기능
    @RequestMapping(value = "/outputs_insert.do", method = RequestMethod.POST)
    public String outputs_insert(MultipartFile[] uploadFile,NormalVO postVO/*, @RequestParam(value = "title") String title
            , @RequestParam(value = "contents") String contents, @RequestParam(value = "cus_num") String cus_num, @RequestParam(value = "prj_num") String prj_num*/) {
        System.out.println("//Title : " + postVO.getTitle() + "//Contents : " + postVO.getContents() + "//requestFile : " + uploadFile + postVO.getCus_num());
        //int prj_num = Integer.parseInt(request.getParameter("prj_num"));
        //게시글 저장
        NormalVO normal = new NormalVO(1, postVO.getPrj_num(), postVO.getTitle(), postVO.getContents(),postVO.getCus_num() );
        normalService.insertPost(normal);
        //첨부파일저장
        fileService.insertFile(uploadFile, postVO.getPost_num(), 1);
        return "redirect:/outputs.do";
    }


    @RequestMapping(value = "/notice.do", method = RequestMethod.GET)//공지사항 게시판 글목록 보기
    public String notice(Model model, HttpSession httpSession) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        ProjectVO object = (ProjectVO) httpSession.getAttribute("prj_list");
        List<NormalVO> allpostVoList = normalService.selectAll(12);
        List<NormalVO> normalVOList = new ArrayList<>();
        for(int i=0; i < allpostVoList.size();i++)
            if(allpostVoList.get(i).getPrj_num() == object.getPrj_num()){
                normalVOList.add(allpostVoList.get(i));
            }
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("NormalList", normalVOList);
        return "/notice/notice";
    }

    @RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
    public String notice_write(@RequestParam("post_num") int no,Model model) {
        if (no > 0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        }

        return "/notice/notice_write";
    }

    //작성한 공지사항 DB저장
    @RequestMapping(value = "/notice_insert.do", method = RequestMethod.POST)
    public String notice_insert(MultipartFile[] uploadFile, HttpSession httpSession, @RequestParam(value = "title") String title
            , @RequestParam(value = "contents") String contents, @RequestParam(value = "cus_num") String cus_num, @RequestParam(value = "prj_num") int prj_num) {

        System.out.println("//Title : " + title + "//Contents : " + contents + "//requestFile : " + uploadFile + cus_num);

        //게시글 저장
        NormalVO normal = new NormalVO(12, prj_num, title, contents, Integer.parseInt(cus_num));
        normalService.insertPost(normal);
        //첨부파일저장
        if (uploadFile != null) {
            fileService.insertFile(uploadFile, prj_num, 12);
        }
        return "redirect:/notice.do";
    }
    //공지사항 작성글 수정 기능
    @RequestMapping(value = "/notice_update.do", method = RequestMethod.POST)
    public String notice_update(MultipartFile[] uploadFile,NormalVO postVO) {
        System.out.println("수정 확인" );
        postVO.setNor_tit(postVO.getTitle());
        postVO.setNor_cnt(postVO.getContents());
        normalService.updatePost(postVO);
        //첨부파일저장
        if (uploadFile != null) {
            fileService.insertFile(uploadFile, postVO.getPrj_num(), 12);
        }
        return "redirect:/notice.do";
    }
    @RequestMapping(value = "/notice_content.do", method = RequestMethod.GET)
    public String notice_content(@RequestParam("post_num") int no, Model model, HttpServletRequest request, HttpServletResponse response) {
        NormalVO Result = normalService.viewPost(no);
        if (Result == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "존재하지 않는 게시글 입니다.", "/notice.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }

        model.addAttribute("PostList", Result);
        // comment 추가 위한 2줄
        AddCmt addcmt = new Addd();
        addcmt.comment(no, model, request);
        // comment 종료

        //첨부파일 불러오기
        List<FileVO> files = fileService.viewFiles(no);
        System.out.println(files);
        for (int i = 0; i < files.size(); i++) {
            files.get(i).setFile_link("/upload/" + files.get(i).getFile_name());
        }
        model.addAttribute("FileList", files);

        return "/notice/notice_content";
    }

    @RequestMapping(value = "/download.do", method = RequestMethod.GET)
    public void download(HttpServletResponse response, HttpServletRequest request, @RequestParam("file_name") String filename) {

        System.out.println("download..." + filename);

        String saveFileName = "C:\\upload\\" + filename;

        System.out.println(saveFileName);

        String contentType = filename.substring(filename.lastIndexOf(".") + 1);

        System.out.println(contentType);

        File file = new File(saveFileName);
        System.out.println(file.length());
        long fileLength = file.length();
        //파일의 크기와 같지 않을 경우 프로그램이 멈추지 않고 계속 실행되거나, 잘못된 정보가 다운로드 될 수 있다.

        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Length", "" + fileLength);
        response.setHeader("Content-Type", contentType); //hwp , ppt 얘네가 타입을 정해놓지 않았던가 무언가 먼제가 있따. 엑셀됨 이미지 됨 => do or zip파일로 나옴
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");


        try (
                FileInputStream fis = new FileInputStream(saveFileName);
                OutputStream out = response.getOutputStream();
        ) {
            System.out.println("Try!");
            int readCount = 0;
            byte[] buffer = new byte[1024];
            while ((readCount = fis.read(buffer)) != -1) {
                out.write(buffer, 0, readCount);
            }
            System.out.println(out);

            out.close();
            fis.close();

        } catch (Exception ex) {
            throw new RuntimeException("file Save Error");
        }
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
    public String request_content(@RequestParam("post_num") int no, Model model, HttpServletRequest request
            , HttpServletResponse response) {
        NormalVO Result = normalService.viewPost(no);
        if (Result == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "존재하지 않는 게시글 입니다.", "/outputs.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }

        model.addAttribute("PostList", Result);

        // comment 추가 위한 2줄
        AddCmt addcmt = new Addd();
        addcmt.comment(no, model, request);
        // comment 종료

        return "/request/request_content";
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
    public String issue(Model model, HttpSession httpSession) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        Object object = httpSession.getAttribute("prj_list");
        List<RiskVO> riskVOList = riskService.selectIssue(object);
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("RiskList", riskVOList);

        return "issue/issue";
    }

    //issue 글쓰기 페이지 이동
    @RequestMapping(value = "/issue_write.do", method = RequestMethod.GET)
    public String issue_write(@RequestParam("post_num") int post_num, Model model, HttpSession httpSession) {
        List<CustomerVO> customerVOList = customerService.selectCustomerManagement(httpSession.getAttribute("prj_list"));
        model.addAttribute("CustomerList", customerVOList);
        if (post_num > 0) {
            RiskVO Result = riskService.viewRisk(post_num);
            model.addAttribute("RiskList", Result);
        }
        return "issue/issue_write";
    }

    //issue 상세 페이지 이동
    @RequestMapping(value = "/issue_content.do", method = RequestMethod.GET)
    public String issue_content(@RequestParam("post_num") int post_num, Model model,
                                HttpServletRequest request, HttpServletResponse response) {
        RiskVO Result = riskService.viewRisk(post_num);
        if (Result == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "존재하지 않는 게시글 입니다.", "/issue.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }

        model.addAttribute("RiskList", Result);

        // comment 추가 위한 2줄
        AddCmt addcmt = new Addd();
        addcmt.comment(post_num, model, request);
        // comment 종료

        //첨부파일 불러오기
        List<FileVO> files = fileService.viewFiles(post_num);
        System.out.println(files);
        for (int i = 0; i < files.size(); i++) {
            files.get(i).setFile_link("/upload/" + files.get(i).getFile_name());
        }
        model.addAttribute("FileList", files);

        return "issue/issue_content";
    }

    //issue insert
    @RequestMapping(value = "/issue_insert.do", method = RequestMethod.POST)
    public String issue_insert(Model model, RiskVO riskVO, MultipartFile[] uploadFile) {
        System.out.println(riskVO.getRisk_imp());
        String Result = riskService.insertRisk(riskVO);

        //첨부파일저장
        if (uploadFile != null) {
            fileService.insertFile(uploadFile, 2, 10);
        }
        return "redirect:/issue.do";
    }

    //위험/이슈 작성글 삭제
    @RequestMapping(value = "/issue_delete.do", method = RequestMethod.DELETE)
    public String issue_delete(@RequestParam("post_num") int no, @RequestParam("cate") int cate) {
        List<CommentVO> commentallVO = commentService.selectCommentAll();
        for (int i = 0; i < commentallVO.size(); i++) {
            if (commentallVO.get(i).getCate() == cate) {
                if (commentallVO.get(i).getPost_num() == no) {
                    re_commentService.deleteRe_CommentAll(commentallVO.get(i).getCmt_num());
                    commentService.deleteComment(commentallVO.get(i).getCmt_num());
                }
            }
        }
        riskService.delete(no);
        switch (cate) {
            case 10:
                return "redirect:/issue.do";
            case 9:
                return "redirect:/danger.do";
        }
        return "redirect:/index.do";
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
        }


        return "/meetingrecord/meetingrecord_write";
    }

    //회의록 작성글 보기
    @RequestMapping(value = "/meetingrecord_content.do", method = RequestMethod.GET)
    public String meetingrecord_content(@RequestParam("post_num") int no, Model model, HttpServletRequest request, HttpServletResponse response) {
        NormalVO Result = normalService.viewPost(no);
        if (Result == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "존재하지 않는 게시글 입니다.", "/meetingrecord.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }


        model.addAttribute("PostList", Result);
        // comment 추가 위한 2줄
        AddCmt addcmt = new Addd();
        addcmt.comment(no, model, request);

        // comment 종료

        List<FileVO> files = fileService.viewFiles(no);
        System.out.println(files);
        for (int i = 0; i < files.size(); i++) {
            files.get(i).setFile_link("/upload/" + files.get(i).getFile_name());
        }
        model.addAttribute("FileList", files);

        return "/meetingrecord/meetingrecord_content";
    }


    //회의록 작성글 수정 기능
    @RequestMapping(value = "/meetingrecord_update.do", method = RequestMethod.POST)
    public String meetingrecord_update(MultipartFile[] uploadFile, NormalVO postVO) {

        postVO.setNor_tit(postVO.getTitle());
        postVO.setNor_cnt(postVO.getContents());
        normalService.updatePost(postVO);
        //첨부파일저장
        if (uploadFile != null) {
            fileService.insertFile(uploadFile, postVO.getPrj_num(), 2);
        }
        return "redirect:/meetingrecord.do";
    }

    // 회의록 게시글 작성 기능
    @RequestMapping(value = "/meetingrecord_insert.do", method = RequestMethod.POST)
    public String meetingrecord_insert(MultipartFile[] uploadFile, NormalVO postVO/*@RequestParam(value = "title") String title
            , @RequestParam(value = "contents") String contents, @RequestParam(value = "cus_num") String cus_num, @RequestParam(value = "prj_num") String prj_num*/) {

        System.out.println("//Title : " + postVO.getNor_tit() + "//Contents : " + postVO.getNor_cnt() + "//requestFile : " + uploadFile + postVO.getCus_num());

        //int prj_num = Integer.parseInt(request.getParameter("prj_num"));
        //게시글 저장
        NormalVO normal = new NormalVO(2, postVO.getPrj_num(), postVO.getTitle(), postVO.getContents(),postVO.getCus_num() );
        normalService.insertPost(normal);
        //첨부파일저장
        fileService.insertFile(uploadFile, postVO.getPrj_num(), 2);

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
        }
        return "/regularreport/regularreport_write";
    }

    //정기보고 작성글 보기
    @RequestMapping(value = "/regularreport_content.do", method = RequestMethod.GET)
    public String regularreport_content(@RequestParam("post_num") int no, Model model, HttpServletRequest request, HttpServletResponse response) {
        NormalVO Result = normalService.viewPost(no);
        if (Result == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "존재하지 않는 게시글 입니다.", "/regularreport.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }

        model.addAttribute("PostList", Result);
        // comment 추가 위한 2줄
        AddCmt addcmt = new Addd();
        addcmt.comment(no, model, request);
        // comment 종료

        List<FileVO> files = fileService.viewFiles(no);
        System.out.println(files);
        for (int i = 0; i < files.size(); i++) {
            files.get(i).setFile_link("/upload/" + files.get(i).getFile_name());
        }
        model.addAttribute("FileList", files);


        return "/regularreport/regularreport_content";
    }


    //정기보고 작성글 수정 기능
    @RequestMapping(value = "/regularreport_update.do", method = RequestMethod.POST)
    public String regularreport_update(MultipartFile[] uploadFile, NormalVO postVO) {

        System.out.println(postVO.getTitle());
        postVO.setNor_tit(postVO.getTitle());
        postVO.setNor_cnt(postVO.getContents());
        normalService.updatePost(postVO);
        //첨부파일저장
        if (uploadFile != null) {
            fileService.insertFile(uploadFile, postVO.getPrj_num(), 3);
        }
        return "redirect:/regularreport.do";
    }

    // 정기보고 게시글 작성 기능
    @RequestMapping(value = "/regularreport_insert.do", method = RequestMethod.POST)
    public String regularreport_insert(MultipartFile[] uploadFile, NormalVO postVO/*@RequestParam(value = "title") String title
            , @RequestParam(value = "contents") String contents, @RequestParam(value = "cus_num") String cus_num, @RequestParam(value = "prj_num") String prj_num*/) {

        //게시글 저장
        NormalVO normal = new NormalVO(3, postVO.getPrj_num(), postVO.getTitle(), postVO.getContents(),postVO.getCus_num() );
        normalService.insertPost(normal);
        //첨부파일저장
        if (uploadFile != null) {
            fileService.insertFile(uploadFile, postVO.getPrj_num(), 3);
        }

        return "redirect:/regularreport.do";
    }

    //danger page
    @RequestMapping(value = "/danger.do", method = RequestMethod.GET)
    public String danger(Model model, HttpSession httpSession) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        Object object = httpSession.getAttribute("prj_list");
        List<RiskVO> riskVOList = riskService.selectDanger(object);
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("RiskList", riskVOList);

        return "danger/danger";
    }

    //danger 글쓰기 페이지 이동
    @RequestMapping(value = "/danger_write.do", method = RequestMethod.GET)
    public String danger_write(@RequestParam("post_num") int post_num, Model model, HttpSession httpSession) {
        List<CustomerVO> customerVOList = customerService.selectCustomerManagement(httpSession.getAttribute("prj_list"));
        model.addAttribute("CustomerList", customerVOList);
        if (post_num > 0) {
            RiskVO Result = riskService.viewRisk(post_num);
            model.addAttribute("RiskList", Result);
        }
        return "danger/danger_write";
    }

    //danger 상세 페이지 이동
    @RequestMapping(value = "/danger_content.do", method = RequestMethod.GET)
    public String danger_content(@RequestParam("post_num") int post_num, Model model, HttpServletRequest request, HttpServletResponse response) {
        RiskVO Result = riskService.viewRisk(post_num);
        if (Result == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "존재하지 않는 게시글 입니다.", "/danger.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }

        model.addAttribute("RiskList", Result);

        // comment 추가 위한 2줄
        AddCmt addcmt = new Addd();
        addcmt.comment(post_num, model, request);
        // comment 종료

        //첨부파일 불러오기
        List<FileVO> files = fileService.viewFiles(post_num);
        System.out.println(files);
        for (int i = 0; i < files.size(); i++) {
            files.get(i).setFile_link("/upload/" + files.get(i).getFile_name());
        }
        model.addAttribute("FileList", files);

        return "danger/danger_content";
    }

    //danger insert
    @RequestMapping(value = "/danger_insert.do", method = RequestMethod.POST)
    public String danger_insert(Model model, RiskVO riskVO, MultipartFile[] uploadFile) {
        String Result = riskService.insertRisk(riskVO);
        model.addAttribute("RiskList", Result);
        //첨부파일저장
        if (uploadFile != null) {
            fileService.insertFile(uploadFile, 2, 9);
        }
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
    public String adminpermission(Model model, HttpSession httpSession) {
        CustomerVO cust = (CustomerVO) httpSession.getAttribute("login");
        ProjectVO prj = (ProjectVO) httpSession.getAttribute("prj_list");
        int cus_num = Integer.parseInt(cust.getCus_num());
        int cus_state = cust.getCus_state();
        int pl = prj.getCus_num();
        //관리자로 접속하는 경우
        if (cus_state == 3) {
            List<CustomerVO> customerVOList = customerService.select_nonPermissionCus();
            System.out.println(customerVOList);
            // .jsp 파일로 DB 결과값 전달하기
            model.addAttribute("CustomerList", customerVOList);
            return "/adminpermission/adminpermission";
            //PL계정으로 접속하는 경우
        } else if (cus_state == 2 && cus_num == pl) {
            List<CustomerVO> customerVOList = customerService.select_nonPermissionCusPL(Integer.parseInt(cust.getCom_num()));
            // .jsp 파일로 DB 결과값 전달하기
            model.addAttribute("CustomerList", customerVOList);
            return "/adminpermission/adminpermission";
        }
        model.addAttribute("msg", "접근권한이 없습니다.");
        model.addAttribute("url", "index.do");
        return "alert";
    }

    //event page
    @RequestMapping(value = "/event.do", method = RequestMethod.GET)
    public String event(Model model, HttpSession httpSession) {
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        Object object = httpSession.getAttribute("prj_list");
        List<EventVO> eventVOList = eventService.selectEvent(object);
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
    public String event_content(@RequestParam("post_num") int post_num, Model model, HttpServletRequest request, HttpServletResponse response) {
        EventVO Result = eventService.viewEvent(post_num);
        if (Result == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "존재하지 않는 게시글 입니다.", "/event.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }

        model.addAttribute("EventList", Result);

        // comment 추가 위한 2줄
        AddCmt addcmt = new Addd();
        addcmt.comment(post_num, model, request);
        // comment 종료

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
    @RequestMapping(value = "/event_delete.do", method = RequestMethod.DELETE)
    public String event_delete(@RequestParam("post_num") int no) {
        List<CommentVO> commentallVO = commentService.selectCommentAll();
        for (int i = 0; i < commentallVO.size(); i++) {
            if (commentallVO.get(i).getCate() == 5) {
                if (commentallVO.get(i).getPost_num() == no) {
                    re_commentService.deleteRe_CommentAll(commentallVO.get(i).getCmt_num());
                    commentService.deleteComment(commentallVO.get(i).getCmt_num());
                }
            }
        }
        eventService.delete(no);
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
    public String company_content(@RequestParam("com_num") int com_num, Model model, HttpServletResponse response) {
        CompanyVO Result = companyService.viewCompany(com_num);
        if (Result == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "존재하지 않는 게시글 입니다.", "/company.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }


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
    public String project(Model model, HttpSession httpSession) {
        //프로젝트 조회
        List<ProjectVO> projectVOList = projectService.selectProject();
        model.addAttribute("ProjectList1", projectVOList);

        Selcus selcus = new Selcus();
        List<ProjectVO> prj_list = selcus.selectcus(model, httpSession);
        httpSession.setAttribute("ProjectList", prj_list);

        if (httpSession.getAttribute("prj_list") != null) {
            System.out.println("selectone인데 두개잡히는지");
            Object object = httpSession.getAttribute("prj_list");
            ProjectVO selectproject_list = projectService.selectproject_list2(object);
            httpSession.setAttribute("prj_list", selectproject_list);
            System.out.println(selectproject_list + "선택되어있는경우");

        }
        //프로젝트 이름이 선택되지 않은 경우
        else {
            //프로젝트가 존재하는지 여부
            if (prj_list.size() != 0) {
                ProjectVO selectproject_list = projectService.selectproject_list(prj_list.get(0).getPrj_name());
                httpSession.setAttribute("prj_list", selectproject_list);
                System.out.println(selectproject_list + "선택되어있지않은경우");
            }
        }


        return "project/project";
    }

    //project 글쓰기 페이지 이동
    @RequestMapping(value = "/project_write.do", method = RequestMethod.GET)
    public String project_write(@RequestParam(value = "prj_num") int prj_num, Model model) {

        List<CustomerVO> customerVoList = customerService.selectAllCustomer();
        List<ProjectDetailVO> projectDetailVOList = projectService.selectProject_detail(prj_num);
        List<CustomerVO> cusmodalVoList = new ArrayList<>();

        for (CustomerVO customerVO : customerVoList) {
            int i = 0;
            for (ProjectDetailVO projectDetailVO : projectDetailVOList) {
                if (parseInt(customerVO.getCus_num()) == projectDetailVO.getCus_num()) {
                    i += 1;
                }
            }
            if (i == 0) {
                cusmodalVoList.add(customerVO);
            }
        }

        model.addAttribute("CusmodalList", cusmodalVoList);
        model.addAttribute("CustomerList", customerVoList);
        model.addAttribute("Project_detailList", projectDetailVOList);

        ProjectVO Result = projectService.viewProject(prj_num);
        model.addAttribute("ProjectList1", Result);
        return "project/project_write";
    }

    //project 상세 페이지 이동
    @RequestMapping(value = "/project_content.do", method = RequestMethod.GET)
    public String project_content(@RequestParam("prj_num") int prj_num, Model model, HttpServletResponse response) {
        List<ProjectDetailVO> projectDetailVOList = projectService.selectProject_detail(prj_num);
        if (projectDetailVOList == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "프로젝트 구성원이 존재하지 않습니다.", "/project.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }

        model.addAttribute("Project_detailList", projectDetailVOList);
        ProjectVO Result = projectService.viewProject(prj_num);
        model.addAttribute("ProjectList1", Result);
        return "project/project_content";
    }

    //project insert
    @RequestMapping(value = "/project_insert.do", method = RequestMethod.POST)
    public String project_insert(Model model, ProjectVO projectVO,HttpSession httpSession) {
        CustomerVO logininfo = (CustomerVO)httpSession.getAttribute("login");
        if (projectService.selectproject_list(projectVO.getPrj_name()) == null) {
            projectService.insertProject(projectVO);
            //프로젝트 PL을 detail 테이블에도 추가하는 코드
            ProjectDetailVO projectDetailVO = new ProjectDetailVO();
            projectDetailVO.setCus_num(projectVO.getCus_num());
            projectDetailVO.setAuth("1");
            projectDetailVO.setPrj_num(projectService.selectProjectNum(projectVO.getPrj_name()).getPrj_num());
            projectService.insertProject_detail(projectDetailVO);
            //PL 권한부여
            List<ProjectVO> pl_num = projectService.selectPL();
            customerService.resetPLState();
            for (int i = 0; i < pl_num.size(); i++) {
                customerService.updatePLState(pl_num.get(i).getCus_num());
            }
            CustomerVO customerview = customerService.viewCustomer(parseInt(logininfo.getCus_num()));
            httpSession.setAttribute("login", customerview);
            return "redirect:/project.do";
        }
        model.addAttribute("msg", "중복된 프로젝트명 입니다.");
        model.addAttribute("url", "project_write.do?prj_num=0&update=0");
        return "alert";
    }

    // 프로젝트 삭제 기능을 실행할 때 사용하는 함수
    void project_delete_etc(int prj_num) {
        //팀삭제
        List<TeamVO> team_list = teamService.selectTeamall();
        for (int i = 0; i < team_list.size(); i++) {
            if (team_list.get(i).getPrj_num() == prj_num) {
                teamService.deletemember((team_list.get(i).getTeam_num()));
                teamService.deleteTeam((team_list.get(i).getTeam_num()));
            }
        }
        //게시글과 댓글 삭제
        List<NormalVO> post_list = normalService.selectPost();
        for (int i = 0; i < post_list.size(); i++) {
            if (post_list.get(i).getPrj_num() == prj_num) {
                int no = post_list.get(i).getPost_num();
                List<CommentVO> comment_List = commentService.selectCommentbyPost(no);
                for (int j = 0; j < comment_List.size(); j++) {
                    re_commentService.deleteRe_CommentAll(comment_List.get(j).getCmt_num());
                }
                commentService.deleteCommentbyPost(no);
                normalService.deletePost(no);
            }
        }
        //위험이슈삭제
        List<RiskVO> risk_list = riskService.selectallrisk();
        for (int i = 0; i < risk_list.size(); i++) {
            if (risk_list.get(i).getPrj_num() == prj_num) {
                riskService.delete(risk_list.get(i).getPost_num());
            }
        }
        //행사삭제
        List<EventVO> event_list = eventService.selectallevent();
        for (int i = 0; i < event_list.size(); i++) {
            if (event_list.get(i).getPrj_num() == prj_num) {
                eventService.delete(event_list.get(i).getPost_num());
            }
        }
    }


    //project delete
    @RequestMapping(value = "/project_delete.do", method = RequestMethod.DELETE)
    public String project_delete(@RequestParam("prj_num") int prj_num, Model model, HttpSession httpSession) {
        CustomerVO cust = (CustomerVO) httpSession.getAttribute("login");
        ProjectVO prj = (ProjectVO) httpSession.getAttribute("prj_list");
        int cus_num = Integer.parseInt(cust.getCus_num());
        int cus_state = cust.getCus_state();
        int pl = prj.getCus_num();


        //관리자로 접속하는 경우
        if (cus_state == 3) {
            project_delete_etc(prj_num);
            projectService.deleteAllProject_detail(prj_num);
            projectService.delete(prj_num);
            //PL 권한부여
            List<ProjectVO> pl_num = projectService.selectPL();
            customerService.resetPLState();
            for (int i = 0; i < pl_num.size(); i++) {
                customerService.updatePLState(pl_num.get(i).getCus_num());
            }
            return "redirect:/project.do";
            //PL계정으로 접속하는 경우
        } else if (cus_state == 2 && cus_num == pl) {
            project_delete_etc(prj_num);
            projectService.deleteAllProject_detail(prj_num);
            projectService.delete(prj_num);
            //PL 권한부여
            List<ProjectVO> pl_num = projectService.selectPL();
            customerService.resetPLState();
            for (int i = 0; i < pl_num.size(); i++) {
                customerService.updatePLState(pl_num.get(i).getCus_num());
            }
            return "redirect:/project.do";
        }
        model.addAttribute("msg", "접근권한이 없습니다.");
        model.addAttribute("url", "project.do");
        return "alert";
    }

    //project update
    @RequestMapping(value = "/project_update.do", method = RequestMethod.POST)
    public String project_update(Model model, ProjectVO projectVO,HttpSession httpSession) {
        CustomerVO logininfo = (CustomerVO)httpSession.getAttribute("login");
        ProjectDetailVO projectDetailVO = new ProjectDetailVO();
        ProjectVO namechk = projectService.selectproject_list(projectVO.getPrj_name());
        if (namechk == null) {
            //프로젝트 업데이트
            projectService.updateProject(projectVO);
            //프로젝트 PL을 detail 테이블에도 추가하는 코드
            projectDetailVO.setCus_num(projectVO.getCus_num());
            projectDetailVO.setAuth("1");
            projectDetailVO.setPrj_num(projectService.selectProjectNum(projectVO.getPrj_name()).getPrj_num());
            projectService.insertProject_detail(projectDetailVO);

            //PL 권한부여
            List<ProjectVO> pl_num = projectService.selectPL();
            customerService.resetPLState();
            for (int i = 0; i < pl_num.size(); i++) {
                customerService.updatePLState(pl_num.get(i).getCus_num());
            }
            CustomerVO customerview = customerService.viewCustomer(parseInt(logininfo.getCus_num()));
            httpSession.setAttribute("login", customerview);
            return "redirect:/project.do";
        } else if (namechk.getPrj_num() == projectVO.getPrj_num() && namechk.getPrj_name().equals(projectVO.getPrj_name())) {
            //프로젝트 업데이트
            projectService.updateProject(projectVO);

            //프로젝트 PL을 detail 테이블에도 추가하는 코드
            projectDetailVO.setCus_num(projectVO.getCus_num());
            projectDetailVO.setAuth("1");
            projectDetailVO.setPrj_num(projectService.selectProjectNum(projectVO.getPrj_name()).getPrj_num());
            projectService.insertProject_detail(projectDetailVO);

            //PL 권한부여
            List<ProjectVO> pl_num = projectService.selectPL();
            customerService.resetPLState();
            for (int i = 0; i < pl_num.size(); i++) {
                customerService.updatePLState(pl_num.get(i).getCus_num());
            }
            CustomerVO customerview = customerService.viewCustomer(parseInt(logininfo.getCus_num()));
            httpSession.setAttribute("login", customerview);
            return "redirect:/project.do";
        }
        model.addAttribute("msg", "중복된 프로젝트명 입니다.");
        model.addAttribute("url", "project_write.do?prj_num=" + projectVO.getPrj_num() + "&update=1");
        return "alert";
    }

    // project 프로젝트원 삭제
    @RequestMapping(value = "/project_detail_delete.do", method = RequestMethod.DELETE)
    public String project_detail_delete(@RequestParam("prj_num") int prj_num, ProjectDetailVO projectDetailVO) {
        projectService.deleteProject_detail(projectDetailVO);
        return "redirect:/project_write.do?prj_num=" + prj_num + "&update=1";
    }

    // project 프로젝트원 등록 기능
    @RequestMapping(value = "/project_detail_insert.do", method = RequestMethod.POST)
    public String project_detail_insert(@RequestParam("prj_num") int prj_num, Model model, ProjectDetailVO projectDetailVO) {
        String Result = projectService.insertProject_detail(projectDetailVO);
        model.addAttribute("Project_detailList", Result);
        return "redirect:/project_write.do?prj_num=" + prj_num + "&update=1";
    }


    //팀관리 게시글 작성 페이지
    @RequestMapping(value = "/team_write.do", method = RequestMethod.GET)
    public String team_write(@RequestParam("team_num") int no, Model model) {
        List<CustomerVO> customerVoList = customerService.selectAllCustomer();
        List<TeammemberVO> teammemberVOList = teamService.viewTeammember(no);
        List<CustomerVO> cusmodalVoList = new ArrayList<>();
        TeamVO teamVoList = teamService.viewTeam(no);
        for (CustomerVO customerVO : customerVoList) {
            int i = 0;
            for (TeammemberVO teammemberVO : teammemberVOList) {
                if (parseInt(String.valueOf(customerVO.getCus_num())) == parseInt(String.valueOf(teammemberVO.getCus_num()))) {
                    i += 1;
                }
            }
            if (i == 0) {
                cusmodalVoList.add(customerVO);
            }
        }
        model.addAttribute("CusmodalList", cusmodalVoList);
        model.addAttribute("CustomerList", customerVoList);
        model.addAttribute("TeamList", teamVoList);
        model.addAttribute("TeammemberList", teammemberVOList);
        return "/team/team_write";
    }

    //팀관리 목록
    @RequestMapping(value = "/team.do", method = RequestMethod.GET)
    public String team(Model model, HttpSession httpSession) {
        Object object = httpSession.getAttribute("prj_list");
        List<TeamVO> teamVoList = teamService.selectTeam(object);
        model.addAttribute("TeamList", teamVoList);
        List<TeammemberVO> teammemberVoList = teamService.countmember();
        model.addAttribute("TeammemberList", teammemberVoList);
        return "team/team";
    }

    //팀관리 작성글 보기
    @RequestMapping(value = "/team_content.do", method = RequestMethod.GET)
    public String team_content(@RequestParam("team_num") int no, Model model, HttpServletResponse response) {
        TeamVO teamVoList = teamService.viewTeam(no);
        if (teamVoList == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "팀원이 존재하지 않습니다.", "/team.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }

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
    public String team_insert(Model model, TeamVO teamVO, HttpSession httpSession) {
        String Result = teamService.insertTeam(teamVO);
        Object object = httpSession.getAttribute("prj_list");
        TeammemberVO insertVO = new TeammemberVO();
        List<TeamVO> teamVoList = teamService.selectTeam(object);
        for (int i = 0; i < teamVoList.size(); i++) {
            System.out.println(teamVO.getTeam_name());
            System.out.println(teamVoList.get(i).getTeam_name());
            if (teamVoList.get(i).getTeam_name().equals(teamVO.getTeam_name())) {
                teamVoList.get(i).getTeam_num();
                insertVO.setTeam_num(teamVoList.get(i).getTeam_num());
                insertVO.setCus_num(teamVO.getCus_num());
                System.out.println("123");
            }
        }
        teamService.insertTeammember(insertVO);
        model.addAttribute("TeamList", Result);
        return "redirect:/team.do";
    }

    //팀관리 팀원 삭제
    @RequestMapping(value = "/teammember_delete.do", method = RequestMethod.DELETE)
    public String teammember_delete(@RequestParam("team_num") int team_num, Model model, TeammemberVO teammemberVO) {
        teamService.deleteTeammember(teammemberVO);
        return "redirect:/team_write.do?team_num=" + team_num + "&update=1";
    }

    // 팀관리 팀원 등록 기능
    @RequestMapping(value = "/teammember_insert.do", method = RequestMethod.POST)
    public String teammember_insert(@RequestParam("team_num") int team_num, Model model, TeammemberVO teammemberVO) {
        String Result = teamService.insertTeammember(teammemberVO);
        model.addAttribute("TeammemberList", Result);

        return "redirect:/team_write.do?team_num=" + team_num + "&update=1";
    }

    //투입인력관리 page
    @RequestMapping(value = "/usermanagement.do", method = RequestMethod.GET)
    public String usermanagement(HttpSession httpSession, Model model) {
        Object object = httpSession.getAttribute("prj_list");
        CustomerVO cust = (CustomerVO) httpSession.getAttribute("login");
        ProjectVO prj = (ProjectVO) object;
        int cus_num = Integer.parseInt(cust.getCus_num());
        int cus_state = cust.getCus_state();
        int pl = prj.getCus_num();
        //관리자로 접속하는 경우
        if (cus_state == 3) {
            List<CustomerVO> customerVOList = customerService.selectCustomerManagement(object);
            // .jsp 파일로 DB 결과값 전달하기
            model.addAttribute("CustomerList", customerVOList);
            return "/usermanagement/usermanagement";
            //PL계정으로 접속하는 경우
        } else if (cus_state == 2 && cus_num == pl) {
            List<CustomerVO> customerVOList = customerService.selectCustomerManagement(object);
            // .jsp 파일로 DB 결과값 전달하기
            model.addAttribute("CustomerList", customerVOList);
            return "usermanagement/usermanagement";
        }
        model.addAttribute("msg", "접근권한이 없습니다.");
        model.addAttribute("url", "index.do");
        return "alert";
    }

    //투입인력관리 상세 페이지 이동
    @RequestMapping(value = "/usermanagement_content.do", method = RequestMethod.GET)
    public String usermanagement_content(@RequestParam("cus_num") int cus_num, Model model, HttpServletResponse response) {
        CustomerVO customerVO = customerService.viewCustomer(cus_num);

        model.addAttribute("CustomerList", customerVO);
        return "usermanagement/usermanagement_content";
    }

    //투입인력관리 update
    @RequestMapping(value = "/usermanagement_update.do", method = RequestMethod.POST)
    public String usermanagement_update(Model model, CustomerVO customerVO) {
        String Result = customerService.updateCustomer(customerVO);
        model.addAttribute("CustomerList", Result);
        return "redirect:/usermanagement.do";
    }

    //comments 전체 목록 management
    @RequestMapping(value = "/comments.do", method = RequestMethod.GET)
    public String comments(Model model, CommentVO commentVO, Re_CommentVO re_commentVO) {

        //Comment
        //service 클래스에서 Dao 로 접근하여 쿼리 결과값 가져오기
        List<CommentVO> commentVoList = commentService.selectCommentAll();
        // .jsp 파일로 DB 결과값 전달하기
        model.addAttribute("CommentList", commentVoList);

        //Re_comment
        List<Re_CommentVO> Re_commentVOList = re_commentService.selectRe_CommentAll();
        model.addAttribute("Re_CommentList", Re_commentVOList);


        int post_num = 0;
        // 댓글수 count

        int countComment = commentService.countComment(post_num);
        model.addAttribute("countComment", countComment);


        return "comments";
    }

    @RequestMapping(value = "/comments_insert.do", method = RequestMethod.POST)
    public String comments_insert(Model model, CustomerVO customerVO,
                                  @RequestParam("cmt_cnt") String cmt_cnt,
                                  @RequestParam("post_num_cmt_insert") int post_num,
                                  @RequestParam("cate_cmt_insert") int cate,

                                  @RequestParam("com_name_insert") String com_name_insert,
                                  @RequestParam("cus_name_insert") String cus_name_insert,
                                  @RequestParam("cus_dep_insert") String cus_dep_insert,
                                  @RequestParam("cus_position_insert") String cus_position_insert,

                                  @RequestParam("uri_cmt_insert") String URI) {
        // @RequestParam으로 받아온 "" 값을 String cmt_cnt에 넣는다.
        //customer inform
        List<CustomerVO> customerVOList = customerService.selectAllCustomer();
        model.addAttribute("CustomerList", customerVOList);

        System.out.println(customerVOList.toString());

        String cnt = cmt_cnt;
        String com_name = com_name_insert;
        String cus_name = cus_name_insert;
        String cus_dep = cus_dep_insert;
        String cus_position = cus_position_insert;

        CommentVO commentVO = new CommentVO(0, post_num, cate, 0, cnt, com_name, cus_name, cus_dep, cus_position);

        commentService.insertComment(commentVO);
        System.out.println("Complete...");
        System.out.println(commentVO.toString());  //제대로 값 던져주는지 확인하기

        //return "redirect:/comments.do"; //요청 처리 후 comments.do 다시 연결

        return "redirect:" + URI;
    }


    //re_comments insert
    @RequestMapping(value = "/re_comments_insert.do", method = RequestMethod.POST)
    public String re_comments_insert(Model model, CustomerVO customerVO,
                                     @RequestParam("rcmt_cnt") String rcmt_cnt,
                                     @RequestParam("cmt_num_inform") int cmt_num_inform,

                                     @RequestParam("com_name_insert_r") String com_name_insert_r,
                                     @RequestParam("cus_name_insert_r") String cus_name_insert_r,
                                     @RequestParam("cus_dep_insert_r") String cus_dep_insert_r,
                                     @RequestParam("cus_position_insert_r") String cus_position_insert_r,

                                     @RequestParam("uri_rcmt_insert") String URI) {

        //customer inform
        List<CustomerVO> customerVOList = customerService.selectAllCustomer();
        model.addAttribute("CustomerList", customerVOList);

        System.out.println(customerVOList.toString());

        String rcnt = rcmt_cnt;
        String com_name_r = com_name_insert_r;
        String cus_name_r = cus_name_insert_r;
        String cus_dep_r = cus_dep_insert_r;
        String cus_position_r = cus_position_insert_r;

        int cmt_num_inf = cmt_num_inform;
        System.out.println(cmt_num_inf);
        //cmt_num_inform = 댓글 번호->대댓글을 댓글 밑에 달기 위해
        Re_CommentVO re_commentVO = new Re_CommentVO(0, cmt_num_inf, 0, rcnt, com_name_r, cus_name_r, cus_dep_r, cus_position_r);

        re_commentService.insertRe_Comment(re_commentVO);
        System.out.println("Complete...");
        System.out.println(re_commentVO.toString());  //제대로 값 던져주는지 확인하기
        return "redirect:" + URI; //요청 처리 후 comments.do 다시 연결
    }

    // comments delete
    @RequestMapping(value = "/comments_delete.do", method = RequestMethod.GET)
    public String comments_delete(@RequestParam("cmt_num_inform_delete") int cmt_num_inform_delete,
                                  @RequestParam("uri_cmt_delete") String URI) {
        int cmt_delete_num = cmt_num_inform_delete;
        re_commentService.deleteRe_CommentAll(cmt_delete_num);
        commentService.deleteComment(cmt_delete_num);
        return "redirect:" + URI;
    }

    // re_comments delete
    @RequestMapping(value = "/re_comments_delete.do", method = RequestMethod.GET)
    public String re_comments_delete(@RequestParam("rcmt_num_inform_delete") int rcmt_num_inform_delete,
                                     @RequestParam("uri_rcmt_delete") String URI) {
        int rcmt_delete_num = rcmt_num_inform_delete;
        re_commentService.deleteRe_Comment(rcmt_delete_num);
        return "redirect:" + URI;
    }

    //comment update
    @RequestMapping(value = "/comments_update.do", method = RequestMethod.POST)
    public String comments_update(Model model,
                                  @RequestParam("cmt_update") String cmt_update,
                                  @RequestParam("cmt_num_inform_update") int cmt_num_inform_update,
                                  @RequestParam("uri_cmt_update") String URI) {
        int cmt_num = cmt_num_inform_update;

        String cmt_cnt = cmt_update;
        CommentVO commentVO = new CommentVO(cmt_num, 0, 0, 0, cmt_cnt, "", "", "", "");

        commentService.updateComment(commentVO);
        System.out.println("Complete...");
        System.out.println(commentVO.toString());  //제대로 값 던져주는지 확인하기
        //return "redirect:/comments.do";
        return "redirect:" + URI;
    }

    //re_comment update
    @RequestMapping(value = "/re_comments_update.do", method = RequestMethod.POST)
    public String re_comments_update(Model model,
                                     @RequestParam("rcmt_update") String rcmt_update,
                                     @RequestParam("rcmt_num_inform_update") int rcmt_num_inform_update,
                                     @RequestParam("uri_rcmt_update") String URI) {
        int rcmt_num = rcmt_num_inform_update;

        String rcmt_cnt = rcmt_update;
        Re_CommentVO re_commentVO = new Re_CommentVO(rcmt_num, 0, 0, rcmt_cnt, "", "", "", "");

        re_commentService.updateRe_Comment(re_commentVO);
        System.out.println("Complete...");
        System.out.println(re_commentVO.toString());  //제대로 값 던져주는지 확인하기
        //return "redirect:/comments.do"; //요청 처리 후 comments.do 다시 연결
        return "redirect:" + URI;
    }


    //자료실
    @RequestMapping(value = "/datacenter_content.do", method = RequestMethod.GET)
    public String datacenter_content(@RequestParam("post_num") int no, Model model, HttpServletRequest request, HttpServletResponse response) {
        NormalVO Result = normalService.viewPost(no);
        if (Result == null) {
            try {
                ScriptUtil.alertAndMovePage(response, "존재하지 않는 게시글 입니다.", "/datacenter.do");
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }

        model.addAttribute("PostList", Result);

        // comment 추가 위한 2줄
        AddCmt addcmt = new Addd();
        addcmt.comment(no, model, request);
        // comment 종료

        //첨부파일
        List<FileVO> files = fileService.viewFiles(no);
        System.out.println(files);
        for (int i = 0; i < files.size(); i++) {
            files.get(i).setFile_link("/upload/" + files.get(i).getFile_name());
        }
        model.addAttribute("FileList", files);

        return "datacenter/datacenter_content";
    }

    @RequestMapping(value = "/datacenter.do", method = RequestMethod.GET)
    public String datacenter(Model model) {
        List<NormalVO> normalVOList = normalService.selectAll(13);
        model.addAttribute("PostList", normalVOList);

        return "/datacenter/datacenter";
    }

    @RequestMapping(value = "/datacenter_write.do", method = RequestMethod.GET)
    public String datacenter_writer(@RequestParam("post_num") int no, Model model) {
        if (no > 0) {
            NormalVO Result = normalService.viewPost(no);
            model.addAttribute("PostList", Result);
        }
        return "/datacenter/datacenter_write";
    }
    //자료실 파일 업로드
    @RequestMapping(value = "/datacenter_insert.do", method = RequestMethod.POST)
    public String uploadAjaxPost(MultipartFile[] uploadFile, @RequestParam(value = "title") String title
            , @RequestParam(value = "contents") String contents, @RequestParam(value = "cus_num") String cus_num, @RequestParam(value = "prj_num") String prj_num) {
        System.out.println("update ajax post.................");
        System.out.println(title + contents);
        NormalVO normalVO = new NormalVO(13, Integer.parseInt(prj_num), title, contents, Integer.parseInt(cus_num));

        normalService.insertPost(normalVO);
        if (uploadFile != null) {
            fileService.insertFile(uploadFile, Integer.parseInt(prj_num), 13);
        }
        return "redirect:/datacenter.do";
    }

    //자료실 작성글 수정 기능
    @RequestMapping(value = "/datacenter_update.do", method = RequestMethod.POST)
    public String datacenter_update(MultipartFile[] uploadFile,NormalVO postVO) {
        postVO.setNor_tit(postVO.getTitle());
        postVO.setNor_cnt(postVO.getContents());
        normalService.updatePost(postVO);
        //첨부파일저장
        if (uploadFile != null) {
            fileService.insertFile(uploadFile, postVO.getPrj_num(), 13);
        }
        return "redirect:/datacenter.do";
    }

    @RequestMapping(value = "/userreport.do", method = RequestMethod.GET)
    public String userreport() {
        return "/userreport/userreport";
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
        sheet.addMergedRegion(new CellRangeAddress(row.getRowNum(), row.getRowNum(), 0, 8));
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
    public String memberExcelUp(MultipartHttpServletRequest request, HttpServletResponse response) {
        System.out.println("컨트롤러 넘어옴");
        HttpHeaders header = new HttpHeaders();
        header.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        response.setCharacterEncoding("UTF-8");

        ExcelDTO excelDTO = new ExcelDTO();

        try {
            MultipartFile file = null;
            Iterator<String> iterator = request.getFileNames();
            if (iterator.hasNext()) {
                file = request.getFile(iterator.next());
                System.out.println(file);
            }
            System.out.println("서비스 실행전");
            excelDTO = excelService.memberExcelUp(file);
            System.out.println(excelDTO.toString());
            return excelDTO.toString();

        } catch (Exception e) {
            excelDTO.setResultCode(StatusEnum.BAD_REQUEST);
            System.out.println(excelDTO);
            return excelDTO.toString();
        }
    }

    @RequestMapping(value = "/ExcelDownload.do", method = RequestMethod.GET)
    public void ExcelGET(@ModelAttribute("customerVO") CustomerVO customerVO, HttpSession httpSession, HttpServletRequest
            request, HttpServletResponse response) throws Exception {
        System.out.println("인원관리 다운로드");
        excelService.getUserExcel(customerVO, httpSession, request, response);

    }

    //승인 요청 POST
    @ResponseBody
    @PostMapping("/permission.do")
    public String permissionPost(@RequestParam(value = "c_num") String[] c_num) {
        System.out.println("permission ajax post.................");
        int[] num = new int[c_num.length];
        for (int j = 0; j < c_num.length; j++) {
            num[j] = parseInt(c_num[j]);
        }

        List<CustomerVO> list = customerService.select_PermissionCustomer(num);

        System.out.println(list);

        customerService.PermissionCustomer(list);
        System.out.println("Permission complete!");
        return "index";
    }
}






