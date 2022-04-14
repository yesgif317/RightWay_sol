package Comment.Service;
import Comment.Dao.CommentDao;
import Comment.Dto.CommentVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{

    @Inject
    private CommentDao dao;

    @Override
    public List<CommentVO> selectAll() {return dao.selectAll();}

    @Override
    public String insertComment(CommentVO commentVO) { return dao.insertComment(commentVO);    }
}
