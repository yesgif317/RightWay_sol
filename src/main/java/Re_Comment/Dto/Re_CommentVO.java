package Re_Comment.Dto;

import lombok.Data;

import java.util.Date;

@Data
public class Re_CommentVO {
    private int rcmt_num;
    private int cmt_num;
    private int cus_num;
    private String rcmt_cnt;
    //private Date rcmt_date;
    private String rcmt_date;

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


    //public Re_CommentVO(int cmt_num, int cus_num, String rcmt_cnt, Date rcmt_date){
    public Re_CommentVO(int rcmt_num, int cmt_num, int cus_num, String rcmt_cnt,
                        String com_name, String cus_name, String cus_dep, String cus_position){
        this.rcmt_num = rcmt_num;
        this.cmt_num = cmt_num;
        this.cus_num = cus_num;
        this.rcmt_cnt = rcmt_cnt;
        //this.rcmt_date = rcmt_date;

        this.com_name = com_name;
        this.cus_name = cus_name;
        this.cus_dep = cus_dep;
        this.cus_position = cus_position;
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
