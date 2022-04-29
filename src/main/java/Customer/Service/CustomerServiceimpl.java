package Customer.Service;

import Customer.Dto.CustomerVO;
import Customer.Dao.CustomerDao;
import Customer.Dto.LoginDTO;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.*;

@Service
public class CustomerServiceimpl implements CustomerService {


    private final CustomerDao dao;

    @Inject
    public CustomerServiceimpl(CustomerDao customerDao) {
        this.dao = customerDao;
    }


    //전체 회원
    @Override
    public List<CustomerVO> selectAll() {
        return dao.selectAll();
    }


    //로그인
    @Override
    public CustomerVO login(LoginDTO loginDTO) throws Exception {
        return dao.login(loginDTO);
    }

    //아이디 체크
    @Override
    public CustomerVO idCheck(String cus_id) throws Exception{
        return dao.idCheck(cus_id);
    }


    //자동 로그인 서비스 계층
    @Override
    public void keepLogin(String cus_id, String cus_sess_key, Date cus_sess_lim) throws Exception {
        dao.keepLogin(cus_id, cus_sess_key, cus_sess_lim);
    }

    @Override
    public CustomerVO checkLoginBefore(String value) throws Exception {
        return dao.checkUserWithSessionKey(value);
    }

    //회원가입
    @Override
    public void insertCustomer(CustomerVO customerVO) throws Exception {
        String hashedPw = BCrypt.hashpw(customerVO.getCus_pwd(), BCrypt.gensalt());
        customerVO.setCus_pwd(hashedPw);
        dao.insertCustomer(customerVO);
    }
}
