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
    public CustomerVO idCheck(String cus_id) throws Exception {
        System.out.println("--> sqlsellection idCheck() 기능처리 ");
        return sqlSession.selectOne(Namespace + ".idCheck", cus_id);
    }

    @Override
    public List<CustomerVO> selectAll() {
        return sqlSession.selectList(Namespace + ".selectCustomer");
    }

    // 로그인 처리
    @Override
    public List<CustomerVO> login(LoginDTO loginDTO) throws Exception {

        System.out.println(loginDTO.getCus_id()+"-------------------");
        System.out.println(loginDTO.getCus_pwd()+"-------------------");
        System.out.println(loginDTO);
        return sqlSession.selectList(Namespace + ".login", loginDTO);
    }

    // 로그인 유지 처리
    @Override
    public void keepLogin(String cus_id, String cus_sess_key, Date cus_sess_lim) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("cus_id", cus_id);
        paramMap.put("cus_sess_key", cus_sess_key);
        paramMap.put("cus_sess_lim", cus_sess_lim);

        sqlSession.update(Namespace + ".keepLogin", paramMap);
    }

    // 세션키 검증
    @Override
    public CustomerVO checkUserWithSessionKey(String value) throws Exception {
        return sqlSession.selectOne(Namespace + ".checkUserWithSessionKey", value);
    }

    @Override
    public List<CustomerVO> select_nonPermissionCus() {
        return sqlSession.selectList(Namespace + ".select_nonPermissionCus");
    }

    //사용자 State 변경
    @Override
    public void PermissionCustomer(CustomerVO customerVO) {
        System.out.println("PermissionCustomer....");

        sqlSession.update(Namespace + ".PermissionCustomer",customerVO);
    }

    //사용자 ID로 VO객체 반환
    @Override
    public CustomerVO selectCusToNum(int i) {
        return sqlSession.selectOne(Namespace + ".selectCusToNum", i);
    }

    @Override
    public String selectNumToName(int cus_num) {
        return sqlSession.selectOne(Namespace + ".selectNumToName",cus_num);
    }

    //회원가입 Insert
    @Override
    public void insertCustomer(CustomerVO customerVO) {
        sqlSession.insert(Namespace + ".insertCustomer", customerVO);
    }
}
