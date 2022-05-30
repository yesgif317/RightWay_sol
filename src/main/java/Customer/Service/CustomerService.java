package Customer.Service;

import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;
import jdk.internal.org.objectweb.asm.tree.LookupSwitchInsnNode;

import javax.servlet.http.HttpServletResponse;
import java.util.*;

public interface CustomerService {
    //전체 유저 가져오기
    List<CustomerVO> selectAll();
    List<CustomerVO> selectAllCustomer();
    List<CustomerVO> selectCustomerManagement(Object object);
    List<CustomerVO> selectCustomerManagementAdmin();
    CustomerVO viewCustomer(int cus_num);
    String updateCustomer(CustomerVO customerVO);


    //로그인
    CustomerVO login(LoginDTO loginDTO) throws Exception;

    //아이디 체크
    CustomerVO idCheck(String cus_id) throws Exception;

    //자동 로그인 서비스 계층
    void keepLogin(String cus_id, String cus_sess_key, Date cus_sess_lim) throws Exception;

    CustomerVO checkLogin(LoginDTO loginDTO);

    CustomerVO checkLoginBefore(String value) throws Exception;


    //회원가입(Insert)
    void insertCustomer(CustomerVO customerVO) throws Exception;

    void updatePassword(CustomerVO customerVO) throws Exception;

    //승인 받지 않은 회원
    List<CustomerVO> select_nonPermissionCus();
    List<CustomerVO> select_nonPermissionCusPL(int num);

    List<CustomerVO> select_PermissionCustomer(int[] num);
    void PermissionCustomer(List<CustomerVO> customerVOList);

    //이메일 발송
    void sendEmail(CustomerVO customerVO, String div) throws Exception;

    //비밀번호 찾기
    void findPw(HttpServletResponse response, CustomerVO customerVO) throws Exception;

    //select one
    String selectNumToName(int cus_num);

    void resetPLState();
    void updatePLState(int cus_num);

    int idnullCheck(LoginDTO loginDTO);
}
