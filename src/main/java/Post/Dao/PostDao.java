package Post.Dao;

import Post.Dto.PostVO;
import java.util.List;

public interface PostDao {
    List<PostVO> selectAll();

    String insertPost(PostVO postVO);
}
