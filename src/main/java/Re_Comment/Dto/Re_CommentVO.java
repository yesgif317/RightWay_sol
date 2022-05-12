package Re_Comment.Dto;

import lombok.Data;

import java.util.Date;

@Data
public class Re_CommentVO {
    private int rcmt_num;
    private int cmt_num;
    private int cus_num;
    private String rcmt_cnt;
    private Date rcmt_date;

    //public Re_CommentVO(int cmt_num, int cus_num, String rcmt_cnt, Date rcmt_date){
    public Re_CommentVO(int rcmt_num, int cmt_num, int cus_num, String rcmt_cnt){
        this.rcmt_num = rcmt_num;
        this.cmt_num = cmt_num;
        this.cus_num = cus_num;
        this.rcmt_cnt = rcmt_cnt;
        //this.rcmt_date = rcmt_date;
    }
    public Re_CommentVO(){}

/*
    public int getCmt_num() {
        return cmt_num;
    }

    public void setCmt_num(int cmt_num) {
        this.cmt_num = cmt_num;
    }

    public int getCus_num() {
        return cus_num;
    }

    public void setCus_num(int cus_num) {
        this.cus_num = cus_num;
    }

    public String getRcmt_cnt() {
        return rcmt_cnt;
    }

    public void setRcmt_cnt(String rcmt_cnt) {
        this.rcmt_cnt = rcmt_cnt;
    }

    public Date getRcmt_date() {
        return rcmt_date;
    }

    public void setRcmt_date(Date rcmt_date) {
        this.rcmt_date = rcmt_date;
    }

*/

}
