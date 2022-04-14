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
    public List<Re_CommentVO> selectAll() {
        return dao.selectAll();
    }

    @Override
    public String insertRe_Comment(Re_CommentVO re_commentVO) {
        return dao.insertRe_comment(re_commentVO);
    }
}
