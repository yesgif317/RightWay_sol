package Post.Service;

import Post.Dao.PostDao;
import Post.Dto.PostVO;
import org.springframework.stereotype.Service;
import java.util.List;
import javax.inject.Inject;

@Service
public interface PostService {

    List<PostVO> selectAll();

    String insertPost(PostVO postVO);
}
