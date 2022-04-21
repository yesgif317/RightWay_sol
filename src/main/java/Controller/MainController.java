package Controller;

import Board.Dto.BoardVO;
import Board.Service.BoardService;
import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;
import Customer.Service.CustomerService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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
        return "login";
    }

    @RequestMapping(value = "/loginPost.do", method = RequestMethod.POST)
    public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {

        System.out.println(loginDTO.getC_id()); //웹상에 입력한 아이디값
        String id = loginDTO.getC_id();
        CustomerVO customerVO = customerService.login(loginDTO);
        System.out.println(customerVO + "--------------------------");

        System.out.println("객체 확인");
        if (customerVO == null || !BCrypt.checkpw(loginDTO.getC_pwd(), customerVO.getC_pwd()) ){
            return;
        }
        model.addAttribute("customerVO", customerVO);
    }

//    //아이디 중복체크
//    @RequestMapping(value = "/idCheck.do")
//    public String idCheckFormView(@RequestParam(value = "id", defaultValue = "", required = false) String c_id,
//                                  Model model) {
//        model.addAttribute("id", c_id);
//        return "idCheck";
//    }
//
//    @RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
//    public String idCheckAction(HttpServletRequest request, Model model, CustomerVO customerVO) {
//        String c_id = request.getParameter("id");
//        CustomerVO vo = customerService.idCheck(c_id);
//
//        if (vo == null) {
//            model.addAttribute("check", 0);
//        } else {
//            model.addAttribute("check", 1);
//        }
//
//        model.addAttribute("id", c_id);
//        return "idCheck";
//    }

    //회원가입 GET, POST
    @RequestMapping(value = "/register.do", method = RequestMethod.GET)
    public String registerGET() throws Exception {
        return "register";
    }

    @RequestMapping(value = "/register.do", method = RequestMethod.POST)
    public String registerPOST(CustomerVO customerVO, RedirectAttributes redirectAttributes) throws Exception {

        String hashedPw = BCrypt.hashpw(customerVO.getC_pwd(), BCrypt.gensalt());
        customerVO.setC_pwd(hashedPw);
        customerService.insertCustomer(customerVO);
        redirectAttributes.addFlashAttribute("msg", "REGISTERED");

        return "redirect:/login.do";
    }





    @RequestMapping(value = "/forgot_password.do", method = RequestMethod.GET)
    public String forgot_password() {
        return "forgot_password";
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
    public String outputs_content(@RequestParam("no") int no, Model model)  {
        BoardVO Result = service.viewBoard(no);

        model.addAttribute("BoardList", Result);
        return "/outputs/outputs_content"; }

    @RequestMapping(value = "/outputs_delete.do", method = RequestMethod.GET)//산출물 작성글 삭제
    public String outputs_delete(@RequestParam("no") int no) {

        service.delete(no);

        return "redirect:/outputs.do";
    }
    @RequestMapping(value = "/outputs_update.do", method = RequestMethod.GET)  //산출물 게시글 수정 페이지
    public String outputs_update(@RequestParam("no") int no, Model model) {
        BoardVO Result = service.viewBoard(no);
        model.addAttribute("BoardList", Result);
        return "outputs_update";
    }
    @RequestMapping(value = "/outputs_move_update.do", method = RequestMethod.POST)//산출물 작성글 수정 기능
    public String outputs_move_update(Model model,BoardVO boardVO) {

        String Result =service.updateBoard(boardVO);
        model.addAttribute("BoardList", Result);
        return "redirect:/outputs.do";
    }
    @RequestMapping(value = "/outputs_move_write.do", method = RequestMethod.POST)// 산출물 게시글 작성 기능
    public String outputs_move_write(Model model, BoardVO boardVO){
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
        return "issue";
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
    public String event_write(){
        return "event/event_write";
    }

    //행사관리 상세 페이지 이동
    @RequestMapping(value = "/event_content.do", method = RequestMethod.GET)
    public String event_content(){
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
    public String company_write(){
        return "company/company_write";
    }

    //company 상세 페이지 이동
    @RequestMapping(value = "/company_content.do", method = RequestMethod.GET)
    public String company_content(){
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

}
