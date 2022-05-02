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
}
