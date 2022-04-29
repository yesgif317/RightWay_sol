package Company.Service.Service;
import Company.Dao.CompanyDao;
import Company.Dto.CompanyVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Inject
    private CompanyDao dao;

    @Override
    public List<CompanyVO> selectCompany() {return dao.selectCompany();}

    @Override
    public String insertCompany(CompanyVO CompanyVO) { return dao.insertCompany(CompanyVO);    }
}
