package Customer.Service;

import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;

import java.util.*;

public interface CustomerService {
    //전체 유저 가져오기
    List<CustomerVO> selectAll();


    //로그인
    CustomerVO login(LoginDTO loginDTO) throws Exception;

    //아이디 체크
    CustomerVO idCheck(String cus_id) throws Exception;

    //자동 로그인 서비스 계층
    void keepLogin(String cus_id, String cus_sess_key, Date cus_sess_lim) throws Exception;

    CustomerVO checkLoginBefore(String value) throws Exception;


    //회원가입(Insert)
    void insertCustomer(CustomerVO customerVO) throws Exception;
}
