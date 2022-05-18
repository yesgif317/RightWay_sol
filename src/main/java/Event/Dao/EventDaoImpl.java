package Event.Dao;

import Event.Dto.EventVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class EventDaoImpl implements EventDao {

    @Inject
    private SqlSession sqlSession;

    private  static final String Namespace = "com.mark.mappers.EventMapper";

    // 게시판 전체 글 조회
    @Override
    public List<EventVO> selectEvent(Object object) {
        //Ibatis Select 사용법
        return sqlSession.selectList(Namespace+".selectEvent",object);
    }

    // 게시판 글 작성
    @Override
    public String insertEvent(EventVO EventVO) {

        //Ibatis Insert 사용법
        return sqlSession.insert(Namespace+".insertEvent", EventVO)+"";
    }

    @Override
    public String updateEvent(EventVO EventVO) {

        //Ibatis Update 사용법
        return sqlSession.update(Namespace+".updateEvent", EventVO)+"";
    }

    @Override
    public EventVO viewEvent(int post_num) {

        //Ibatis Update 사용법
        return sqlSession.selectOne(Namespace+".viewEvent",post_num);
    }

    public int delete(int post_num) {

        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".delete",post_num);
    }


}
