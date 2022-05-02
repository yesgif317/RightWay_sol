package Commons.Excel.Dao;

import Commons.Excel.Dto.ExcelVO;
import Customer.Dto.CustomerVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

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

    @Override
    public void postUserExcel(ExcelVO excelVO) {
        System.out.println("impl 실행");
        sqlSession.insert(Namespace+".postUserExcel",excelVO);
    }


}
