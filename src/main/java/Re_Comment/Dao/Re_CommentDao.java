package Re_Comment.Dao;

import Re_Comment.Dto.Re_CommentVO;

import java.util.List;

public interface Re_CommentDao {
    List<Re_CommentVO> selectRe_CommentAll();
    
    //댓글 추가
    String insertRe_Comment(Re_CommentVO re_commentVO);

    String updateRe_Comment(Re_CommentVO re_commentVO);

    int deleteRe_Comment(int no);

//    int re_countComment(int post_num);
}
