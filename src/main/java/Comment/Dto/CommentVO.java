package Comment.Dto;

import java.util.Date;

public class CommentVO {
    int comm_num;
    int c_num;
    int p_num;
    String comment;
    Date comm_date;

    public int getComm_num(){return comm_num;}
    public void setComm_num(int comm_num){this.comm_num = comm_num;}

    public int getC_num(){return c_num;}
    public void setC_num(int c_num){this.c_num = c_num;}

    public int getP_num(){return p_num;}
    public void setP_num(int p_num){this.p_num = p_num;}

    public String getComment(){return comment;}
    public void setComment(String comment){this.comment = comment;}

    public Date getComm_date(){return comm_date;}
    public void setComm_date(Date comm_date){this.comm_date = comm_date;}
}
