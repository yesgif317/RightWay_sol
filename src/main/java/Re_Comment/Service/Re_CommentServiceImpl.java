package Re_Comment.Service;

import Re_Comment.Dao.Re_CommentDao;
import Re_Comment.Dto.Re_CommentVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class Re_CommentServiceImpl implements Re_CommentService{

    @Inject
    private Re_CommentDao dao;

    @Override
    public List<Re_CommentVO> selectRe_CommentAll() {
        return dao.selectRe_CommentAll();
    }

    @Override
    public String insertRe_Comment(Re_CommentVO re_commentVO) {
        return dao.insertRe_Comment(re_commentVO);
    }

    @Override
    public String updateRe_Comment(Re_CommentVO re_commentVO) { return dao.updateRe_Comment(re_commentVO); }

    @Override
    public int deleteRe_Comment(int no) {
        return dao.deleteRe_Comment(no);
    }
/*
    @Override
    public int re_countComment(int post_num) { return dao.re_countComment(post_num); }
 */
}
