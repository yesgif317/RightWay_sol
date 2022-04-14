package Re_Comment.Dao;

import Re_Comment.Dto.Re_CommentVO;

import java.util.List;

public interface Re_CommentDao {
    List<Re_CommentVO> selectAll();
    String insertRe_comment(Re_CommentVO re_commentVO);
}
