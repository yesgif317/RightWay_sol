package Commons.Excel.Service;

import Customer.Dto.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface ExcelService {


    void getUserExcel(CustomerVO customerVO, HttpServletRequest request,
                         HttpServletResponse response) throws Exception;


}
