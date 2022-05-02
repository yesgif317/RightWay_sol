package Company.Service;
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
    public String insertCompany(CompanyVO companyVO) { return dao.insertCompany(companyVO);    }

    @Override
    public String updateCompany(CompanyVO companyVO){
        return dao.updateCompany(companyVO);
    }

    @Override
    public CompanyVO viewCompany(int com_num){
        return dao.viewCompany(com_num);
    }

    @Override
    public int delete(int com_num) { return
            dao.delete(com_num);
    }
}
