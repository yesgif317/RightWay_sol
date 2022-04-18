package Post.Dto;

import java.util.Date;

public class Post_issueVO {
    int p_num;
    int c_num;
    String i_importance;
    String i_progress;
    String i_contents;
    Date i_startdate;
    Date i_enddate;

    public int getP_num(){return p_num;}
    public void setP_num(int p_num){this.p_num = p_num;}

    public int getC_num(){return c_num;}
    public void setC_num(int c_num){this.c_num = c_num;}

    public String getI_importance(){return i_importance;}
    public void setI_importance(String i_importance){this.i_importance = i_importance;}

    public String getI_progress(){return i_progress;}
    public void setI_progress(String i_progress){this.i_progress = i_progress;}

    public String getI_contents(){return i_contents;}
    public void setI_contents(String i_contents){this.i_contents=i_contents;}

    public Date getI_startdate(){return i_startdate;}
    public void setI_startdate(Date i_startdate){this.i_startdate = i_startdate;}

    public Date getI_enddate(){return i_enddate;}
    public void setI_enddate(Date i_enddate){this.i_enddate = i_enddate;}
}
