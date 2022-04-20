package Customer.Dao;

import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import javax.naming.Name;
import java.sql.SQLOutput;
import java.util.List;

@Repository
public class CustomerDaoImpl implements CustomerDao {

    private final SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.CustomerMapper";

    @Inject
    public CustomerDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }


//    @Override
//    public CustomerVO idCheck(String c_id) {
//        System.out.println("--> idCheck() 기능 처리");
//        CustomerVO vo = sqlSession.selectOne(Namespace + ".idCheck", c_id);
//        return vo;
//    }

    @Override
    public CustomerVO login(LoginDTO loginDTO) throws Exception {

        System.out.println(loginDTO.getC_id()+"-------------------");
        System.out.println(loginDTO.getC_pwd()+"-------------------");
        System.out.println(loginDTO);
        return sqlSession.selectOne(Namespace + ".login", loginDTO);
    }

    @Override
    public List<CustomerVO> selectAll() {
        return sqlSession.selectList(Namespace + ".selectCustomer");
    }

    //회원가입 Insert
    @Override
    public void insertCustomer(CustomerVO customerVO) {
        sqlSession.insert(Namespace + ".insertCustomer", customerVO);
    }
}
