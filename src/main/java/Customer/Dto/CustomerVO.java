package Customer.Dto;

import lombok.Data;

import java.util.*;

@Data
public class CustomerVO {

    private String cus_num;
    private String cus_id;
    private String cus_pwd;
    private String cus_name;
    private String cus_email;
    private String cus_phone;
    private String cus_dep;
    private String cus_position;
    /* cus_state
    0 - 미승인
    1 - 승인회원
    2 - PL
    3 - ADMIN
    * */
    private int cus_state;
    private String cus_sess_key;
    private String cus_sess_lim;
    private String com_num;
    private String com_name;
    private String prj_name;
    private int prj_num;

    public CustomerVO() {

    }

    public CustomerVO(String cus_num, String cus_id, String cus_pwd, String cus_name, String cus_email, String cus_phone, String cus_dep, String cus_position, int cus_state, String cus_sess_key, String cus_sess_lim, String com_num, String com_name, String prj_name, int prj_num) {
        this.cus_num = cus_num;
        this.cus_id = cus_id;
        this.cus_pwd = cus_pwd;
        this.cus_name = cus_name;
        this.cus_email = cus_email;
        this.cus_phone = cus_phone;
        this.cus_dep = cus_dep;
        this.cus_position = cus_position;
        this.cus_state = cus_state;
        this.cus_sess_key = cus_sess_key;
        this.cus_sess_lim = cus_sess_lim;
        this.com_num = com_num;
        this.com_name = com_name;
        this.prj_num = prj_num;
        this.prj_name = prj_name;
    }


    @Override
    public String toString() {
        return "CustomerVO{" +
                "cus_num='" + cus_num + '\'' +
                ", cus_id='" + cus_id + '\'' +
                ", cus_pwd='" + cus_pwd + '\'' +
                ", cus_name='" + cus_name + '\'' +
                ", cus_email='" + cus_email + '\'' +
                ", cus_phone='" + cus_phone + '\'' +
                ", cus_dep='" + cus_dep + '\'' +
                ", cus_position='" + cus_position + '\'' +
                ", com_num='" + com_num + '\'' +
                ", com_name='" + com_name + '\'' +
                '}';
    }

}
