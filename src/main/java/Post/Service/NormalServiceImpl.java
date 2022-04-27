package Post.Service;

import Post.Dao.NormalDao;
import Post.Dto.NormalVO;
import org.springframework.stereotype.Service;


import javax.inject.Inject;
import java.util.List;
@Service
public class NormalServiceImpl implements NormalService {

    @Inject
    private NormalDao dao;

    @Override
    public List<NormalVO> selectAll() {
        return dao.selectAll();
    }

    @Override
    public String insertPost(NormalVO normalVO) {
        return dao.insertPost(normalVO);
    }
}
