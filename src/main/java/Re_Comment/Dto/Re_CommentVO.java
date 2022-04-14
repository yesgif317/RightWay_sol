package Re_Comment.Dto;

import java.util.Date;

public class Re_CommentVO {
    int comm_num;
    int c_num;
    String recomment;
    Date recomment_date;

    public int getC_num() {return c_num;}
    public void setC_num(int c_num) {this.c_num = c_num;}

    public int getComm_num() {return comm_num;}

    public void setComm_num(int comm_num) {this.comm_num = comm_num;}

    public Date getRecomm_date() {return recomment_date;}

    public void setRecomm_date(Date recomment_date) {this.recomment_date = recomment_date;}

    public String getRecomment() {return recomment;}

    public void setRecomment(String recomment) {this.recomment = recomment;}
}
