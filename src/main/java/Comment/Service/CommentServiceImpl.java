package Comment.Service;
import Comment.Dao.CommentDao;
import Comment.Dto.CommentVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Inject
    private CommentDao dao;

    @Override
    public List<CommentVO> selectCommentAll() { return dao.selectCommentAll(); }
    @Override
    public List<CommentVO> selectCommentbyPost(int no) { return dao.selectCommentbyPost(no); }
    @Override
    public void insertComment(CommentVO commentVO) { dao.insertComment(commentVO); }
    //public String insertComment(CommentVO commentVO) { return dao.insertComment(commentVO); }

    @Override
    public String updateComment(CommentVO commentVO) { return dao.updateComment(commentVO); }

    @Override
    public int deleteComment(int no) { return
            dao.deleteComment(no);
    }
    @Override
    public int deleteCommentbyPost(int no) { return
            dao.deleteCommentbyPost(no);
    }
    @Override
    public int countComment(int post_num) { return dao.countComment(post_num); }

    /*
    @Override
    public CommentVO countComment(int post_num) { return dao.countComment(post_num); }
    */

    @Override
    public List<CommentVO> selectComment_fromNew(Object object) { return dao.selectComment_fromNew(object); }
    @Override
    public List<CommentVO> selectComment_fromNew_count(Object object) { return dao.selectComment_fromNew_count(object); }
}

