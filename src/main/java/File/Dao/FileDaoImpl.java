package File.Dao;

import File.Dto.FileVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class FileDaoImpl implements FileDao{
    @Inject
    private SqlSession sqlSession;

    private static final String Namespace = "com.mark.mappers.FileMapper";

    public void insertFile(FileVO fileVO) {
        sqlSession.insert(Namespace+".insertFile",fileVO);
    }
}
