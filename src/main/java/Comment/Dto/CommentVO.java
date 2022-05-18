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
    //private Date cmt_date;      //sysdate\
    private String cmt_date;

    // join (Customer)
    //private String cus_num;
    private String cus_id;
    private String cus_pwd;
    private String cus_name;
    private String cus_email;
    private String cus_phone;
    private String cus_dep;
    private String cus_position;
    private String cus_state;
    private String cus_sess_key;
    private String cus_sess_lim;
    private String com_num;
    private String com_name;
    private String prj_name;
    private String prj_num;


    public CommentVO(int cmt_num, int post_num, int cate, int cus_num, String cmt_cnt,
                     String com_name, String cus_name, String cus_dep, String cus_position){
        //public CommentVO(String cmt_cnt){
        this.cmt_num = cmt_num;
        this.cus_num = cus_num;
        this.post_num = post_num;
        this.cate = cate;
        this.cmt_cnt = cmt_cnt;
        //this.cmt_date = cmt_date;

        this.com_name = com_name;
        this.cus_name = cus_name;
        this.cus_dep = cus_dep;
        this.cus_position = cus_position;
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