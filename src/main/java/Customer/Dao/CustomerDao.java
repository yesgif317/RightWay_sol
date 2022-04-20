package Customer.Dao;

import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;

import java.util.List;

public interface CustomerDao {
    List<CustomerVO> selectAll();


//    CustomerVO idCheck(String c_id);

    //로그인
    CustomerVO login(LoginDTO loginDTO) throws Exception;

    //회원가입 Insert
    void insertCustomer(CustomerVO customerVO) throws Exception;

    //회원정보수정 Update
    //String updateCustomer(CustomerVO customerVO);
}
