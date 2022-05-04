package Post.Service;

import Post.Dto.NormalVO;

import java.util.List;


public interface NormalService {

    List<NormalVO> selectPost();
    List<NormalVO> selectPrj_num();

    String insertPost(NormalVO postVO);


    //글 수정(Update)
    String updatePost(NormalVO postVO);

    int deletePost(int no);

    //글 조회(View)
    NormalVO viewPost(int no);

    //자료실 LIST SELECT
    List<NormalVO> selectDCList();

    //공지사항
    List<NormalVO> selectNotice();

    List<NormalVO> selectAll(int cate);
}
