package Comment.Service;

import Comment.Dto.CommentVO;

import java.util.List;

public interface CommentService {
    //댓글 전체 글 가져오기
    List<CommentVO> selectCommentAll();
    List<CommentVO> selectCommentbyPost(int no);

    // 댓글 작성
    void insertComment(CommentVO commentVO);
    //String insertComment(CommentVO commentVO);

    //댓글 수정
    String updateComment(CommentVO commentVO);

    // 댓글 삭제
    int deleteComment(int no);
    int deleteCommentbyPost(int no);
    int countComment(int post_num);
    //CommentVO countComment(int post_num);

    List<CommentVO> selectComment_fromNew(Object object);
    List<CommentVO> selectReComment_fromNew(Object object);
}
