package Comment.Dao;

import Comment.Dto.CommentVO;

import java.util.List;

public interface CommentDao {
    List<CommentVO> selectCommentAll();

    //댓글 추가
    void insertComment(CommentVO commentVO);
    //String insertComment(CommentVO commentVO);

    String updateComment(CommentVO commentVO);

    int deleteComment(int no);

    int countComment(int post_num);
    //CommentVO countComment(int post_num);

    List<CommentVO> selectComment_fromNew(Object object);
}
