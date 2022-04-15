package Post.Dto;

import java.util.Date;

public class PostVO {
    int p_num;
    String p_caption;
    String p_title;
    Date p_date;
    Date p_update_date;
    int c_num;
    int b_no;

    public int getP_num(){return p_num;}
    public void setP_num(int p_num){this.p_num=p_num;}

    public String getP_caption(){return p_caption;}
    public void setP_caption(String p_caption){this.p_caption=p_caption;}

    public String getP_title(){return p_title;}
    public void setP_title(String p_title){this.p_title=p_title;}

    public Date getP_date(){return p_date;}
    public void setP_date(Date p_date){this.p_date=p_date;}

    public Date getP_update_date(){return p_update_date;}
    public void setP_update_date(Date p_update_date){this.p_update_date=p_update_date;}

    public int getC_num(){return c_num;}
    public void setC_num(int c_num){this.p_num=c_num;}

    public int getB_no(){return b_no;}
    public void setB_no(int b_no){this.b_no=b_no;}

}
