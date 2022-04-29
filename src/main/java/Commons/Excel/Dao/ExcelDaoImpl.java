package Commons.Excel.Dao;

import Customer.Dao.CustomerDao;
import Customer.Dto.CustomerVO;
import Customer.Dto.LoginDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ExcelDaoImpl implements ExcelDao {

    private final SqlSession sqlSession;
    private static final String Namespace = "com.mark.mappers.CustomerMapper";

    @Inject
    public ExcelDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<CustomerVO> getUserExcel(CustomerVO customerVO) {
        return sqlSession.selectList(Namespace+".getUserExcel");
    }


}
