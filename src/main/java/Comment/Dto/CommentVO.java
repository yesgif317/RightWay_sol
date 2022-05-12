package Comment.Dto;

import lombok.Data;

import java.util.Date;

@Data
public class CommentVO {
    private int cmt_num;        //자동생성
    private int cus_num;
    private int post_num;
    private int cate;           //정해진 숫자 넣어서 보낼거
    private String cmt_cnt;
    private Date cmt_date;      //sysdate\


    public CommentVO(int cmt_num, int post_num, int cate, int cus_num, String cmt_cnt){
    //public CommentVO(String cmt_cnt){
        this.cmt_num = cmt_num;
        this.cus_num = cus_num;
        this.post_num = post_num;
        this.cate = cate;
        this.cmt_cnt = cmt_cnt;
        //this.cmt_date = cmt_date;
    }
    public CommentVO(){}        // default 있어야 에러 안나는거였다고 함


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

    public int getPost_num() {
        return post_num;
    }

    public void setPost_num(int post_num) {
        this.post_num = post_num;
    }

    public int getCate() {
        return cate;
    }

    public void setCate(int cate) {
        this.cate = cate;
    }

    public String getCmt_cnt() {
        return cmt_cnt;
    }

    public void setCmt_cnt(String cmt_cnt) {
        this.cmt_cnt = cmt_cnt;
    }

    public Date getCmt_date() {
        return cmt_date;
    }

    public void setCmt_date(Date cmt_date) {
        this.cmt_date = cmt_date;
    }
*/
}