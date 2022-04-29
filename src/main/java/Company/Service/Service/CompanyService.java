package Company.Service.Service;

import Company.Dto.CompanyVO;

import java.util.List;

public interface CompanyService {
    List<CompanyVO> selectCompany();
    String insertCompany(CompanyVO CompanyVO);
}
