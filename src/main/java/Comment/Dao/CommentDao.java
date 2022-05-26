package Comment.Dao;

import Comment.Dto.CommentVO;

import java.util.List;

public interface CommentDao {
    List<CommentVO> selectCommentAll();
    List<CommentVO> selectCommentbyPost(int no);
    //댓글 추가
    void insertComment(CommentVO commentVO);
    //String insertComment(CommentVO commentVO);

    String updateComment(CommentVO commentVO);

    int deleteComment(int no);
    int deleteCommentbyPost(int no);
    int countComment(int post_num);
    //CommentVO countComment(int post_num);

    List<CommentVO> selectComment_fromNew(Object object);
    List<CommentVO> selectReComment_fromNew(Object object);
}
