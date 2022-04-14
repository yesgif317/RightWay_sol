package Re_Comment.Service;

import Re_Comment.Dto.Re_CommentVO;

import java.util.List;

public interface Re_CommentService {
    List<Re_CommentVO> selectAll();
    String insertRe_Comment(Re_CommentVO re_commentVO);
}
