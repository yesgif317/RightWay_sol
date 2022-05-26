package Commons.Excel.Service;

import Commons.Excel.Dto.ExcelDTO;
import Customer.Dto.CustomerVO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface ExcelService {


    void getUserExcel(CustomerVO customerVO, HttpSession httpSession, HttpServletRequest request,
                      HttpServletResponse response) throws Exception;

    ExcelDTO memberExcelUp (MultipartFile file) throws Exception;

}
