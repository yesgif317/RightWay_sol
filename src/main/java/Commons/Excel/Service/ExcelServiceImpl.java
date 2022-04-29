package Commons.Excel.Service;

import Commons.Excel.Dao.ExcelDao;
import Customer.Dto.CustomerVO;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class ExcelServiceImpl implements ExcelService {

    @Autowired
    public ExcelDao dao;

    @Override
    public void getUserExcel(CustomerVO customerVO, HttpServletRequest request, HttpServletResponse response) throws Exception {

        System.out.println("1.");

        List<CustomerVO> list = dao.getUserExcel(customerVO);

        System.out.println("2.");

        XSSFWorkbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet();
        sheet.setColumnWidth((short) 0, (short) 2000);
        sheet.setColumnWidth((short) 1, (short) 8000);
        sheet.setColumnWidth((short) 2, (short) 3000);
        sheet.setColumnWidth((short) 3, (short) 3000);
        sheet.setColumnWidth((short) 4, (short) 8000);
        sheet.setColumnWidth((short) 5, (short) 5000);
        sheet.setColumnWidth((short) 6, (short) 3000);
        sheet.setColumnWidth((short) 7, (short) 3000);
        sheet.setColumnWidth((short) 8, (short) 3000);
        sheet.setColumnWidth((short) 9, (short) 3000);

        System.out.println("3.");

        Row row = sheet.createRow(0);
        Cell cell = null;
        CellStyle cs = wb.createCellStyle();
        Font font = wb.createFont();
        cell = row.createCell(0);
        cell.setCellValue("투입인력 관리");
        sheet.addMergedRegion(new CellRangeAddress(row.getRowNum(), row.getRowNum(), 0, 9));

        System.out.println("4.");

        row = sheet.createRow(1);
        cell = null;
        cs = wb.createCellStyle();
        font = wb.createFont();

        cell = row.createCell(0);
        cell.setCellValue("번호");

        cell = row.createCell(1);
        cell.setCellValue("아이디");

        cell = row.createCell(2);
        cell.setCellValue("비밀번호");

        cell = row.createCell(3);
        cell.setCellValue("이름");

        cell = row.createCell(4);
        cell.setCellValue("이메일");

        cell = row.createCell(5);
        cell.setCellValue("전화번호");

        cell = row.createCell(6);
        cell.setCellValue("팀명");

        cell = row.createCell(7);
        cell.setCellValue("직급");

        cell = row.createCell(8);
        cell.setCellValue("회사번호");

        cell = row.createCell(9);
        cell.setCellValue("권한");

        System.out.println("5.");
        int i = 2;
        int ii = list.size();
        for (CustomerVO vo : list) {


            row = sheet.createRow(i);
            cell = null;
            cs = wb.createCellStyle();
            font = wb.createFont();

            cell = row.createCell(0);
            cell.setCellValue(vo.getCus_num());

            cell = row.createCell(1);
            cell.setCellValue(vo.getCus_id());

            cell = row.createCell(2);
            cell.setCellValue(vo.getCus_pwd());

            cell = row.createCell(3);
            cell.setCellValue(vo.getCus_name());

            cell = row.createCell(4);
            cell.setCellValue(vo.getCus_email());

            cell = row.createCell(5);
            cell.setCellValue(vo.getCus_phone());

            cell = row.createCell(6);
            cell.setCellValue(vo.getCus_dep());

            cell = row.createCell(7);
            cell.setCellValue(vo.getCus_position());

            cell = row.createCell(8);
            cell.setCellValue(vo.getCus_state());

            cell = row.createCell(9);
            cell.setCellValue(vo.getCom_num());



            i++;
            ii--;
        }
        System.out.println("6.");

        response.setHeader("Set-Cookie", "fileDownload=true; path=/");
        response.setHeader("Content-Disposition", String.format("attachment; filename=\"UserManagement.xlsx\""));
        wb.write(response.getOutputStream());

    }
}




