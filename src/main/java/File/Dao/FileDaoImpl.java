package File.Dao;

import File.Dto.FileVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class FileDaoImpl implements FileDao{
    @Inject
    private SqlSession sqlSession;

    private static final String Namespace = "com.mark.mappers.FileMapper";

    public void insertFile(FileVO fileVO) {
        sqlSession.insert(Namespace+".insertFile",fileVO);
    }

    @Override
    public List<FileVO> viewFiles(int n) {
        return sqlSession.selectList(Namespace + ".viewFiles",n);
    }

    public int deleteFile(FileVO fileVO) {

        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".deleteFile",fileVO);
    }
    @Override
    public int selectSeq() {
        return sqlSession.selectOne(Namespace + ".selectSeq");
    }

    @Override
    public int selectRiskSeq() {
        return sqlSession.selectOne(Namespace + ".selectRiskSeq");
    }
}
