package Commons.Excel.Dao;

import Commons.Excel.Dto.ExcelVO;
import Customer.Dto.CustomerVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import javax.naming.Name;
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

    @Override
    public String checkcomname(int com_num){
        return sqlSession.selectOne(Namespace +".comnamecheck", com_num);
    }

    @Override
    public String checkcomnum(String com_name){
        return sqlSession.selectOne(Namespace +".comnumcheck", com_name);
    }

    @Override
    public int idcount(String cus_id) throws Exception {
        return sqlSession.selectOne(Namespace +".idcount", cus_id);
    }


}
