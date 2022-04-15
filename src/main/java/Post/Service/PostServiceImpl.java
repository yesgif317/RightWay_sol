package Post.Service;

import Post.Dao.PostDao;
import Post.Dto.PostVO;

import javax.inject.Inject;
import java.util.List;

public class PostServiceImpl implements PostService{

    @Inject
    private PostDao dao;

    @Override
    public List<PostVO> selectAll() {
        return dao.selectAll();
    }

    @Override
    public String insertPost(PostVO postVO) {
        return dao.insertPost(postVO);
    }
}
