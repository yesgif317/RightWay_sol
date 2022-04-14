package Comment.Service;

import Comment.Dto.CommentVO;

import java.util.List;

public interface CommentService {
    List<CommentVO> selectAll();
    String insertComment(CommentVO commentVO);
}
