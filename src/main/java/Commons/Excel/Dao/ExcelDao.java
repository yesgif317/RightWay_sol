package Commons.Excel.Dao;

import Commons.Excel.Dto.ExcelVO;
import Customer.Dto.CustomerVO;

import java.util.List;

public interface ExcelDao {

    List<CustomerVO> getUserExcel(CustomerVO customerVO);

    void postUserExcel(ExcelVO excelVO) throws Exception;

    String checkcomname(int com_num) throws Exception;

    String checkcomnum(String com_name) throws Exception;

    int idcount(String cus_id) throws Exception;

}
