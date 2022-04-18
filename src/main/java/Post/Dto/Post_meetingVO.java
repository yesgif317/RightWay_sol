package Post.Dto;

import java.util.Date;

public class Post_meetingVO {
    int p_num;
    Date m_date;
    String m_participant;
    String m_subject;
    String m_contents;
    String m_location;

    public int getP_num(){return p_num;}

    public Date getM_date(){return m_date;}
    public void setM_date(Date m_date){this.m_date = m_date;}


    public String getM_participant(){return m_participant;}
    public void setM_participant(String m_participant){this.m_participant = m_participant;}

    public String getM_subject(){return m_subject;}
    public void setM_subject(String m_subject){this.m_subject = m_subject;}

    public String getM_contents(){return m_contents;}
    public void setM_contents(String m_contents){this.m_contents = m_contents;}

    public String getM_location(){return m_location;}
    public void setM_location(String m_location){this.m_location = m_location;}
}
