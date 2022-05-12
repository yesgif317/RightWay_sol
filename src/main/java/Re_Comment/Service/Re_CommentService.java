package Re_Comment.Service;

import Re_Comment.Dto.Re_CommentVO;

import java.util.List;

public interface Re_CommentService {
    List<Re_CommentVO> selectRe_CommentAll();
    String insertRe_Comment(Re_CommentVO re_commentVO);
    //대댓글 수정
    String updateRe_Comment(Re_CommentVO re_commentVO);
    // 대댓글 삭제
    int deleteRe_Comment(int no);
//    int re_countComment(int post_num);
}
