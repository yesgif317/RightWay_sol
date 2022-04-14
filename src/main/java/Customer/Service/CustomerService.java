package Customer.Service;

import Customer.Dto.CustomerVO;

import java.util.List;

public interface CustomerService {
    //전체 유저 가져오기
    List<CustomerVO> selectAll();

    //회원가입(Insert)
    String insertCustomer(CustomerVO customerVO);
}
