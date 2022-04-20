package Customer.Service;

import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;

import java.util.List;

public interface CustomerService {
    //전체 유저 가져오기
    List<CustomerVO> selectAll();

//    CustomerVO idCheck(String c_id);

    //로그인
    CustomerVO login(LoginDTO loginDTO) throws Exception;
    //회원가입(Insert)
    void insertCustomer(CustomerVO customerVO) throws Exception;
}
