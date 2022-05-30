package Customer.Service;

import Customer.Dto.CustomerVO;
import Customer.Dao.CustomerDao;
import Customer.Dto.LoginDTO;
import org.apache.commons.mail.HtmlEmail;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.*;

@Service
public class CustomerServiceimpl implements CustomerService {


    private final CustomerDao dao;

    @Inject
    public CustomerServiceimpl(CustomerDao customerDao) {
        this.dao = customerDao;
    }


    //전체 회원
    @Override
    public List<CustomerVO> selectAll() {
        return dao.selectAll();
    }

    @Override
    public CustomerVO viewCustomer(int cus_num) {
        return dao.viewCustomer(cus_num);
    }

    //전체 회원
    @Override
    public List<CustomerVO> selectAllCustomer() {
        return dao.selectAllCustomer();
    }

    //로그인
    @Override
    public CustomerVO login(LoginDTO loginDTO) throws Exception {
        return dao.login(loginDTO);
    }


    //아이디 체크
    @Override
    public CustomerVO idCheck(String cus_id) throws Exception {
        return dao.idCheck(cus_id);
    }


    //자동 로그인 서비스 계층
    @Override
    public void keepLogin(String cus_id, String cus_sess_key, Date cus_sess_lim) throws Exception {
        dao.keepLogin(cus_id, cus_sess_key, cus_sess_lim);
    }

    @Override
    public CustomerVO checkLogin(LoginDTO loginDTO) {
        return dao.checkLogin(loginDTO);
    }

    @Override
    public CustomerVO checkLoginBefore(String value) throws Exception {
        return dao.checkUserWithSessionKey(value);
    }

    //회원가입
    @Override
    public void insertCustomer(CustomerVO customerVO) throws Exception {
        System.out.println("service...insercustomer");
        String hashedPw = BCrypt.hashpw(customerVO.getCus_pwd(), BCrypt.gensalt());
        customerVO.setCus_pwd(hashedPw);
        dao.insertCustomer(customerVO);
    }

    @Override
    public void updatePassword(CustomerVO customerVO) throws Exception {
        String hashedPw = BCrypt.hashpw(customerVO.getCus_pwd(), BCrypt.gensalt());
        customerVO.setCus_pwd(hashedPw);
        dao.updatePassword(customerVO);
    }

    @Override
    public List<CustomerVO> select_nonPermissionCus() {
        return dao.select_nonPermissionCus();
    }

    @Override
    public List<CustomerVO> select_nonPermissionCusPL(int com_num) {
        return dao.select_nonPermissionCusPL(com_num);
    }

    @Override
    public List<CustomerVO> select_PermissionCustomer(int[] num) {
        List<CustomerVO> list = new ArrayList<>();
        for (int i = 0; i < num.length; i++) {
            list.add(dao.selectCusToNum(num[i]));
            System.out.println(list.get(i));
        }
        return list;
    }

    @Override
    public void PermissionCustomer(List<CustomerVO> customerVOList) {
        System.out.println("Service....");
        for (int i = 0; i < customerVOList.size(); i++) {
            System.out.println(customerVOList.get(i));
            dao.PermissionCustomer(customerVOList.get(i));
        }
    }

    @Override
    public void sendEmail(CustomerVO customerVO, String div) throws Exception {
        // Mail Server 설정 (사용시 해당계정 네이버메일에서 SMTP 설정해줘야 사용가능)
        String charSet = "utf-8";
        String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
        String hostSMTPid = "winnerchan98@gmail.com";
        String hostSMTPpwd = "winner98!@";

        // 보내는 사람 EMail, 제목, 내용
        String fromEmail = "solideosystems@naver.com";
        String fromName = "솔리데오시스템즈";
        String subject = "";
        String msg = "";

        if (div.equals("findpw")) {
            subject = "MY-SIM 임시 비밀번호 입니다.";
            msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
            msg += "<h3 style='color: blue;'>";
            msg += customerVO.getCus_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
            msg += "<p>임시 비밀번호 : ";
            msg += customerVO.getCus_pwd() + "</p></div>";
        }

        // 받는 사람 E-Mail 주소
        String mail = customerVO.getCus_email();
        try {
            HtmlEmail email = new HtmlEmail();
            email.setDebug(true);
            email.setCharset(charSet);
            email.setSSL(true);
            email.setHostName(hostSMTP);
            email.setSmtpPort(587); //465


            email.setAuthentication(hostSMTPid, hostSMTPpwd);
            email.setTLS(true);
            email.addTo(mail, charSet);
            email.setFrom(fromEmail, fromName, charSet);
            email.setSubject(subject);
            email.setHtmlMsg(msg);
            email.send();
        } catch (Exception e) {
            System.out.println("메일발송 실패 : " + e);
        }
    }


    @Override
    public void findPw(HttpServletResponse response, CustomerVO customerVO) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        System.out.println(customerVO);
        CustomerVO cvo = dao.readMember(customerVO);
        PrintWriter out = response.getWriter();
        // 가입된 아이디가 없으면
        if (cvo.getCus_id() == null) {
            out.print("등록되지 않은 아이디입니다.");
            out.close();
        }
        // 가입된 이메일이 아니면
        else if (!customerVO.getCus_email().equals(cvo.getCus_email())) {
            out.print("등록되지 않은 이메일입니다.");
            out.close();
        } else {
            // 임시 비밀번호 생성
            String pw = "";
            for (int i = 0; i < 12; i++) {
                pw += (char) ((Math.random() * 26) + 97);
            }

            customerVO.setCus_pwd(pw);

            // 비밀번호 변경 메일 발송
            sendEmail(customerVO, "findpw");

            //pw 암호화해서 setcuspwd
            String hashedPw = BCrypt.hashpw(pw, BCrypt.gensalt());
            customerVO.setCus_pwd(hashedPw);

            // 비밀번호 변경
            dao.updatePw(customerVO);

            out.print("이메일로 임시 비밀번호를 발송하였습니다.");
            out.close();
        }
    }

    @Override
    public String selectNumToName(int cus_num) {
        return dao.selectNumToName(cus_num);
    }

    @Override
    public String updateCustomer(CustomerVO customerVO) {
        return dao.updateCustomer(customerVO);
    }

    @Override
    public List<CustomerVO> selectCustomerManagement(Object object) {
        return dao.selectCustomerManagement(object);
    }

    @Override
    public List<CustomerVO> selectCustomerManagementAdmin() {
        return dao.selectCustomerManagementAdmin();
    }

    @Override
    public void resetPLState(){dao.resetPLState();}

    @Override
    public void updatePLState(int cus_num){dao.updatePLState(cus_num);}

    @Override
    public int idnullCheck(LoginDTO loginDTO) {
        return dao.idnullCheck(loginDTO);
    }

}
