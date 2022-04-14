package Customer.Dao;

import Customer.Dto.CustomerVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class CustomerDaoImpl implements CustomerDao {

    @Inject
    private SqlSession sqlSession;

    private  static final String Namespace = "com.mark.mappers.CustomerMapper";
    @Override
    public List<CustomerVO> selectAll(){
        return sqlSession.selectList(Namespace+".selectCustomer");
    }

    //회원가입 Insert
    @Override
    public String insertCustomer(CustomerVO customerVO){
        return  sqlSession.insert(Namespace+".insertCustomer",customerVO)+"";
    }
}
