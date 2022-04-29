package Company.Dao;

import javax.inject.Inject;

import java.util.List;

import Company.Dto.CompanyVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDaoImpl implements CompanyDao {

    @Inject
    private SqlSession sqlSession;

    private  static final String Namespace = "com.mark.mappers.CompanyMapper";

    // 게시판 전체 글 조회
    @Override
    public List<CompanyVO> selectCompany() {
        //Ibatis Select 사용법
        return sqlSession.selectList(Namespace+".selectCompany");
    }

    // 게시판 글 작성
    @Override
    public String insertCompany(CompanyVO CompanyVO) {

        //Ibatis Insert 사용법
        return sqlSession.insert(Namespace+".insertCompany", CompanyVO)+"";
    }

    @Override
    public String updateCompany(CompanyVO CompanyVO) {

        //Ibatis Update 사용법
        return sqlSession.update(Namespace+".updateCompany", CompanyVO)+"";
    }

    @Override
    public CompanyVO viewCompany(int no) {

        //Ibatis Update 사용법
        return sqlSession.selectOne(Namespace+".viewCompany",no);
    }

    public int delete(int no) {

        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".delete",no);
    }


}
