package Company.Service;

import Company.Dto.CompanyVO;

import java.util.List;

public interface CompanyService {
    //목록 조회
    List<CompanyVO> selectCompany();

    //회사 조회
    List<CompanyVO> checkCompany(String com_name) throws Exception;
    //등록
    String insertCompany(CompanyVO companyVO);
    //글 수정(Update)
    String updateCompany(CompanyVO companyVO);
    //삭제
    int delete(int com_num);
    //글 조회(View)
    CompanyVO viewCompany(int com_num);
}
