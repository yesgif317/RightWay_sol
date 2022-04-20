package Customer.Service;

import Customer.Dto.CustomerVO;
import Customer.Dao.CustomerDao;
import Customer.Dto.LoginDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CustomerServiceimpl implements CustomerService {


    private final CustomerDao dao;

    @Inject
    public CustomerServiceimpl(CustomerDao customerDao){
        this.dao = customerDao;
    }


    //전체 회원
    @Override
    public List<CustomerVO> selectAll() {
        return dao.selectAll();
    }

//    @Override
//    public CustomerVO idCheck(String c_id) {
//        return dao.idCheck(c_id);
//    }


    //로그인
    @Override
    public CustomerVO login(LoginDTO loginDTO) throws Exception {
        return dao.login(loginDTO);
    }

    //회원가입
    @Override
    public void insertCustomer(CustomerVO customerVO) throws Exception {
        dao.insertCustomer(customerVO);
    }
}
