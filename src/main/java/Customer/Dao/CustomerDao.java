package Customer.Dao;

import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;

import java.util.*;

public interface CustomerDao {
    List<CustomerVO> selectAll();




    //로그인
    CustomerVO login(LoginDTO loginDTO) throws Exception;

    //아이디 체크
    CustomerVO idCheck(String id) throws Exception;

    //회원가입 Insert
    void insertCustomer(CustomerVO customerVO) throws Exception;

    // 로그인 유지 처리
    void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;

    // 세션키 검증
    CustomerVO checkUserWithSessionKey(String value) throws Exception;

    //회원정보수정 Update
    //String updateCustomer(CustomerVO customerVO);

}
