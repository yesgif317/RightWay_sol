package Post.Service;

import Post.Dto.NormalVO;
import org.springframework.stereotype.Service;
import java.util.List;


public interface NormalService {

    List<NormalVO> selectAll();

    String insertPost(NormalVO postVO);
}
