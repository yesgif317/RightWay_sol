package Post.Dao;

import Post.Dto.NormalVO;
import java.util.List;

public interface NormalDao {
    List<NormalVO> selectPost();

    List<NormalVO> selectPrj_num();

    String insertPost(NormalVO postVO);

    //글 수정 Update
    String updatePost(NormalVO postVO);

    //글 조회 Update
    NormalVO viewPost(int no);

    int deletePost(int no);
    //자료실 리스트 Select
    List<NormalVO> selectDCList();

    //공지사항
    List<NormalVO> selectNotice(Object object);

    //구분번호 별 전체 리스트
    List<NormalVO> selectAll(int cate);

}
