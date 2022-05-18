package Event.Service;
import Event.Dao.EventDao;
import Event.Dto.EventVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
@Service
public class EventServiceImpl implements EventService {

    @Inject
    private EventDao dao;

    @Override
    public List<EventVO> selectEvent(Object object) {return dao.selectEvent(object);}

    @Override
    public String insertEvent(EventVO eventVO) { return dao.insertEvent(eventVO);}

    @Override
    public String updateEvent(EventVO eventVO){
        return dao.updateEvent(eventVO);
    }

    @Override
    public EventVO viewEvent(int post_num){
        return dao.viewEvent(post_num);
    }

    @Override
    public int delete(int post_num) { return
            dao.delete(post_num);
    }
}
