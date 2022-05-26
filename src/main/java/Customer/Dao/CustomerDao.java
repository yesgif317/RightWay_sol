package Customer.Dao;

import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;

import java.util.*;

public interface CustomerDao {
    List<CustomerVO> selectAll();
    List<CustomerVO> selectAllCustomer();
    List<CustomerVO> selectCustomerManagement(Object object);
    CustomerVO viewCustomer(int cus_num);
    String updateCustomer(CustomerVO customerVO);

    //로그인
    CustomerVO login(LoginDTO loginDTO) throws Exception;

    //아이디 체크
    CustomerVO idCheck(String cus_id) throws Exception;

    //회원가입 Insert
    void insertCustomer(CustomerVO customerVO) throws Exception;

    void updatePassword(CustomerVO customerVO) throws Exception;

    // 로그인 유지 처리
    void keepLogin(String cus_id, String cus_sess_key, Date cus_sess_lim) throws Exception;

    // 세션 체크
    CustomerVO checkLogin(LoginDTO loginDTO);

    // 세션키 검증
    CustomerVO checkUserWithSessionKey(String value) throws Exception;

    //회원정보수정 Update
    //String updateCustomer(CustomerVO customerVO);

    //승인 받지 않은 회원
    List<CustomerVO> select_nonPermissionCus();
    List<CustomerVO> select_nonPermissionCusPL(int com_num);
    void PermissionCustomer(CustomerVO customerVO);

    //한명 찾기
    CustomerVO selectCusToNum(int i);

    String selectNumToName(int cus_num);

    //입력받은 아이디,이메일로 데이터 조회
    CustomerVO readMember(CustomerVO customerVO);

    //비밀번호 변경
    public int updatePw(CustomerVO customerVO) throws Exception;
    void resetPLState();
    void updatePLState(int cus_num);

    int idnullCheck(LoginDTO loginDTO);
}
