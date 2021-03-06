package Commons.Excel.Dto;

import lombok.Data;

import java.util.*;

@Data
public class ExcelVO {

    private int cus_num;
    private String cus_id;
    private String cus_pwd;
    private String cus_name;
    private String cus_email;
    private String cus_phone;
    private String cus_dep;
    private String cus_position;
    private String cus_state;
    private String com_num;

    private String com_name;

    public ExcelVO(){

    }


    public ExcelVO(int cus_num, String cus_id, String cus_pwd, String cus_name, String cus_email, String cus_phone, String cus_dep, String cus_position, String cus_state, String com_num) {
        this.cus_num = cus_num;
        this.cus_id = cus_id;
        this.cus_pwd = cus_pwd;
        this.cus_name = cus_name;
        this.cus_email = cus_email;
        this.cus_phone = cus_phone;
        this.cus_dep = cus_dep;
        this.cus_position = cus_position;
        this.cus_state = cus_state;
        this.com_num = com_num;
    }


    @Override
    public String toString() {
        return "ExcelVO{" +
                "cus_num='" + cus_num + '\'' +
                ", cus_id='" + cus_id + '\'' +
                ", cus_pwd='" + cus_pwd + '\'' +
                ", cus_name='" + cus_name + '\'' +
                ", cus_email='" + cus_email + '\'' +
                ", cus_phone='" + cus_phone + '\'' +
                ", cus_dep='" + cus_dep + '\'' +
                ", cus_position='" + cus_position + '\'' +
                ", cus_state='" + cus_state + '\'' +
                ", com_num='" + com_num + '\'' +
                '}';
    }

}
