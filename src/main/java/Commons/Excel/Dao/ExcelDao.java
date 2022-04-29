package Commons.Excel.Dao;

import Customer.Dto.CustomerVO;
import org.apache.ibatis.session.SqlSession;

import javax.inject.Inject;
import java.util.List;

public interface ExcelDao {

    List<CustomerVO> getUserExcel(CustomerVO customerVO);

}
