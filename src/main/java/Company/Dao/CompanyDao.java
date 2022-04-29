package Company.Dao;

import java.util.List;

import Company.Dto.CompanyVO;

public interface CompanyDao {
    List<CompanyVO> selectCompany();

    //글 작성 Insert
    String insertCompany(CompanyVO CompanyVO);

    //글 수정 Update
    String updateCompany(CompanyVO CompanyVO);

    //글 조회 Update
    CompanyVO viewCompany(int no);

    int delete(int no);
}
