package Commons.Excel.Service;

import Commons.Excel.Dto.ExcelVO;
import Customer.Dto.CustomerVO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ExcelService {


    void getUserExcel(CustomerVO customerVO, HttpServletRequest request,
                         HttpServletResponse response) throws Exception;

    void memberExcelUp (MultipartFile file) throws Exception;

}
