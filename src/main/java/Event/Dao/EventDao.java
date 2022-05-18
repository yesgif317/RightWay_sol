package Event.Dao;

import Event.Dto.EventVO;

import java.util.List;

public interface EventDao {
    List<EventVO> selectEvent(Object object);

    //글 작성 Insert
    String insertEvent(EventVO EventVO);

    //글 수정 Update
    String updateEvent(EventVO EventVO);

    //글 조회 Update
    EventVO viewEvent(int post_num);

    int delete(int post_num);
}
