package Customer.Dao;

import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import javax.naming.Name;
import java.sql.SQLOutput;
import java.util.*;

@Repository
public class CustomerDaoImpl implements CustomerDao {

    private final SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.CustomerMapper";

    @Inject
    public CustomerDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    //아이디 체크
    @Override
    public CustomerVO idCheck(String c_id) throws Exception {
        System.out.println("--> sqlsellection idCheck() 기능처리 ");
        return sqlSession.selectOne(Namespace + ".idCheck", c_id);
    }

    @Override
    public List<CustomerVO> selectAll() {
        return sqlSession.selectList(Namespace + ".selectCustomer");
    }

    // 로그인 처리
    @Override
    public CustomerVO login(LoginDTO loginDTO) throws Exception {

        System.out.println(loginDTO.getC_id()+"-------------------");
        System.out.println(loginDTO.getC_pwd()+"-------------------");
        System.out.println(loginDTO);
        return sqlSession.selectOne(Namespace + ".login", loginDTO);
    }

    // 로그인 유지 처리
    @Override
    public void keepLogin(String c_id, String sessionId, Date sessionLimit) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("c_id", c_id);
        paramMap.put("sessionId", sessionId);
        paramMap.put("sessionLimit", sessionLimit);

        sqlSession.update(Namespace + ".keepLogin", paramMap);
    }

    // 세션키 검증
    @Override
    public CustomerVO checkUserWithSessionKey(String value) throws Exception {
        return sqlSession.selectOne(Namespace + ".checkUserWithSessionKey", value);
    }

    //회원가입 Insert
    @Override
    public void insertCustomer(CustomerVO customerVO) {
        sqlSession.insert(Namespace + ".insertCustomer", customerVO);
    }
}
