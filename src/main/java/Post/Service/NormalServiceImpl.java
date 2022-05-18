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
    public List<NormalVO> selectPost() {
        return dao.selectPost();
    }
    @Override
    public List<NormalVO> selectPrj_num() {
        return dao.selectPrj_num();
    }

    @Override
    public String insertPost(NormalVO postVO) {
        return dao.insertPost(postVO);
    }

    @Override
    public String updatePost(NormalVO postVO){
        return dao.updatePost(postVO);
    }

    @Override
    public NormalVO viewPost(int no){
        return dao.viewPost(no);
    }

    @Override
    public List<NormalVO> selectDCList() {
        return dao.selectDCList();
    }

    @Override
    public List<NormalVO> selectNotice(Object object) {
        return dao.selectNotice(object);
    }

    @Override
    public List<NormalVO> selectAll(int cate) {
        return dao.selectAll(cate);
    }

    @Override
    public String selectFirstProjectName() {
        return null;
    }

    @Override
    public int deletePost(int no) { return
            dao.deletePost(no);
    }


}
