package Customer.Dao;

import Customer.Dto.CustomerVO;

import java.util.List;

public interface CustomerDao {
    List<CustomerVO> selectAll();

    //회원가입 Insert
    String insertCustomer(CustomerVO customerVO);

//    //회원정보수정 Update
//    String updateCustomer(CustomerVO customerVO);
}
