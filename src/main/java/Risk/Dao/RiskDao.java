package Risk.Dao;

import Risk.Dto.RiskVO;

import java.util.List;

public interface RiskDao {
    List<RiskVO> selectIssue();
    List<RiskVO> selectDanger();

    //글 작성 Insert
    String insertRisk(RiskVO RiskVO);

    //글 수정 Update
    String updateRisk(RiskVO RiskVO);

    //글 조회 Update
    RiskVO viewRisk(int post_num);

    int delete(int post_num);
}
