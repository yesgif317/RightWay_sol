package Customer.Service;

import Customer.Dto.CustomerVO;
import Customer.Dao.CustomerDao;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CustomerServiceimpl implements CustomerService {
    
    @Inject
    private CustomerDao dao;

    //전체 회원
    @Override
    public List<CustomerVO> selectAll() {
        return dao.selectAll();
    }

    //회원가입
    @Override
    public String insertCustomer(CustomerVO customerVO) {
        return dao.insertCustomer(customerVO);
    }
}
