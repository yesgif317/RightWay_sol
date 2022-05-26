package Commons.Excel.Service;

import Commons.Excel.Dao.ExcelDao;
import Commons.Excel.Dto.ExcelDTO;
import Commons.Excel.Dto.ExcelVO;
import Commons.Excel.Dto.StatusEnum;
import Customer.Dto.CustomerVO;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ExcelServiceImpl implements ExcelService {

    @Autowired
    public ExcelDao dao;

    private static final String Namespace = "com.mark.mappers.CustomerMapper";

    @Override
    public void getUserExcel(CustomerVO customerVO, HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) throws Exception {

        //해당 선택되어있는 프로젝트에 대한 인원만 뽑아오기위해 선택되어있는 프로젝트 세션값 가져옴.
        Object object = httpSession.getAttribute("prj_list");
        System.out.println("엑셀 다운로드 세션 " + object);

        List<CustomerVO> list = dao.getUserExcel(object);


        XSSFWorkbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet();
        sheet.setColumnWidth((short) 0, (short) 6000);
        sheet.setColumnWidth((short) 1, (short) 8000);
        sheet.setColumnWidth((short) 2, (short) 3000);
        sheet.setColumnWidth((short) 3, (short) 8000);
        sheet.setColumnWidth((short) 4, (short) 5000);
        sheet.setColumnWidth((short) 5, (short) 3000);
        sheet.setColumnWidth((short) 6, (short) 3000);
        sheet.setColumnWidth((short) 7, (short) 3000);
        sheet.setColumnWidth((short) 8, (short) 6000);

        Row row = sheet.createRow(0);
        Cell cell = null;
        CellStyle cs = wb.createCellStyle();
        Font font = wb.createFont();
        cell = row.createCell(0);
        cell.setCellValue("투입인력 관리");
        sheet.addMergedRegion(new CellRangeAddress(row.getRowNum(), row.getRowNum(), 0, 8));


        row = sheet.createRow(1);
        cell = null;
        cs = wb.createCellStyle();
        font = wb.createFont();

        cell = row.createCell(0);
        cell.setCellValue("아이디");

        cell = row.createCell(1);
        cell.setCellValue("비밀번호");

        cell = row.createCell(2);
        cell.setCellValue("이름");

        cell = row.createCell(3);
        cell.setCellValue("이메일");

        cell = row.createCell(4);
        cell.setCellValue("전화번호");

        cell = row.createCell(5);
        cell.setCellValue("팀명");

        cell = row.createCell(6);
        cell.setCellValue("직급");

        cell = row.createCell(7);
        cell.setCellValue("계정상태");

        cell = row.createCell(8);
        cell.setCellValue("회사명");

        int i = 2;
        int ii = list.size();
        for (CustomerVO vo : list) {


            row = sheet.createRow(i);
            cell = null;
            cs = wb.createCellStyle();
            font = wb.createFont();

            cell = row.createCell(0);
            cell.setCellValue(vo.getCus_id());

            cell = row.createCell(1);
            cell.setCellValue(vo.getCus_pwd());

            cell = row.createCell(2);
            cell.setCellValue(vo.getCus_name());

            cell = row.createCell(3);
            cell.setCellValue(vo.getCus_email());

            cell = row.createCell(4);
            cell.setCellValue(vo.getCus_phone());
            ;

            cell = row.createCell(5);
            cell.setCellValue(vo.getCus_dep());

            cell = row.createCell(6);
            cell.setCellValue(vo.getCus_position());

            cell = row.createCell(7);
            cell.setCellValue(vo.getCus_state());

            cell = row.createCell(8);
            int com_num = Integer.parseInt(vo.getCom_num());
            String com_name = dao.checkcomname(com_num);
            cell.setCellValue(com_name);

            i++;
            ii--;
        }
        // ISO-8859_1 로 인한 파일이름 한글깨짐 예외설정
        String docName = "프로젝트_인원현황.xlsx";
        String outputExcelName = new String(docName.getBytes("KSC5601"), "8859_1");

        response.setHeader("Set-Cookie", "fileDownload=true; path=/");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + outputExcelName + "\"");
        wb.write(response.getOutputStream());
    }


    public ExcelDTO memberExcelUp(MultipartFile file) throws Exception {
        ExcelDTO excelDTO = new ExcelDTO();
        System.out.println("서비스단 실행");
        try {
            OPCPackage opcPackage = OPCPackage.open(file.getInputStream()); // 파일 읽어옴
            XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
            XSSFSheet sheet = workbook.getSheetAt(0);
            int last_rownum = sheet.getLastRowNum();
            int resultCnt = 0;
            String mas = "";
            // 입력된 행의 수만큼 반복
            for (int i = 2; i <= last_rownum; i++) {
                System.out.println(last_rownum);

                XSSFRow row = sheet.getRow(i); // i번째 행 가져옴
                XSSFCell cell = null;

                ExcelVO excelVO = new ExcelVO();

                if (row == null) continue;
                System.out.println(row.getCell(0));

                // 0번째 열
                // Cell 값이 null 일 수도 있으므로 체크
                cell = row.getCell(0);

                // 아이디 중복체크하기
                if (cell != null) {
                    cell.setCellType(CellType.STRING); // 숫자만 입력받는 경우를 대비해 STRING 처리
                    String cus_id = String.valueOf(row.getCell(0));
                    int idcount = dao.idcount(cus_id);

                    if (idcount == 1) {
                        System.out.println(row.getCell(0) + "는(은) 중복되는 아이디입니다.");
                        String message = (row.getCell(0) + ",");

                        mas = mas + message;
                        excelDTO.setMessage(mas);
                        continue;
                    }
                    excelVO.setCus_id(cell.getStringCellValue().replace(" ", ""));
                }

                // 열의 수만큼 반복
                // 1번째 열
                cell = row.getCell(1);
                if (cell != null) {
                    cell.setCellType(CellType.STRING); // 숫자만 입력받는 경우를 대비해 STRING 처리
                    String hashedPw = BCrypt.hashpw(String.valueOf(cell), BCrypt.gensalt());
                    excelVO.setCus_pwd(hashedPw);
                }


                cell = row.getCell(2);
                if (cell != null) {
                    cell.setCellType(CellType.STRING); // 숫자만 입력받는 경우를 대비해 STRING 처리
                    excelVO.setCus_name(cell.getStringCellValue().replace(" ", ""));
                }

                cell = row.getCell(3);
                if (cell != null) {
                    cell.setCellType(CellType.STRING); // 숫자만 입력받는 경우를 대비해 STRING 처리
                    excelVO.setCus_email(cell.getStringCellValue().replace(" ", ""));
                }

                cell = row.getCell(4);
                if (cell != null) {
                    cell.setCellType(CellType.STRING); // 숫자만 입력받는 경우를 대비해 STRING 처리
                    excelVO.setCus_phone(cell.getStringCellValue().replace(" ", ""));
                }

                cell = row.getCell(5);
                if (cell != null) {
                    cell.setCellType(CellType.STRING); // 숫자만 입력받는 경우를 대비해 STRING 처리
                    excelVO.setCus_dep(cell.getStringCellValue().replace(" ", ""));
                }

                cell = row.getCell(6);
                if (cell != null) {
                    cell.setCellType(CellType.STRING); // 숫자만 입력받는 경우를 대비해 STRING 처리
                    excelVO.setCus_position(cell.getStringCellValue().replace(" ", ""));
                }

                cell = row.getCell(7);
                if (cell != null) {
                    cell.setCellType(CellType.STRING);  // 숫자만 입력받는 경우를 대비해 STRING 처리
                    excelVO.setCus_state(cell.getStringCellValue().replace(" ", ""));
                }

                cell = row.getCell(8);
                if (cell != null) {
                    cell.setCellType(CellType.STRING);// 숫자만 입력받는 경우를 대비해 STRING 처리
                    String com_name = String.valueOf(row.getCell(8));
                    excelVO.setCom_num(dao.checkcomnum(com_name));
                }
                System.out.println(excelVO);
                int result = dao.postUserExcel(excelVO);
                System.out.println(result + "개의 계정이 삽입되었습니다.");

                if (result > 0) {
                    resultCnt++;
                } else {
                    throw new Exception();
                }
            }
            if (resultCnt == last_rownum - 1) {
                excelDTO.setResultCode(StatusEnum.OK);
                excelDTO.setMessage("인원이 정상적으로 입력되었습니다.");
            }

        } catch (Exception e) {
            System.out.println("에러메시지 : " + e.getMessage());
            throw new Exception();
        }
        return excelDTO;

    }
}




