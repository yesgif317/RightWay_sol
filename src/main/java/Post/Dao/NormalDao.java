package Post.Dao;

import Post.Dto.NormalVO;
import java.util.List;

public interface NormalDao {
    List<NormalVO> selectAll();

    String insertPost(NormalVO postVO);
}
