package Comment.Dao;

import Comment.Dto.CommentVO;

import java.util.List;

public interface CommentDao {
    List<CommentVO> selectAll();

    //댓글 추가
    String insertComment(CommentVO commentVO);
}
