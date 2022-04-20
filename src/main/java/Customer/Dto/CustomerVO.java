package Customer.Dto;

import lombok.Data;

import java.util.*;

@Data
public class CustomerVO {

    private String c_id;
    private String c_pwd;
    private String c_name;
    private String c_email;
    private String c_phone;
    private String c_dep;
    private String c_position;
    private String session_key;
    private String session_limit;

    public CustomerVO(){

    }

    public CustomerVO(String c_id, String c_pwd, String c_name, String c_email, String c_phone, String c_dep, String c_position, String session_key , String session_limit){
        this.c_id = c_id;
        this.c_pwd = c_pwd;
        this.c_name = c_name;
        this.c_email = c_email;
        this.c_phone = c_phone;
        this.c_dep = c_dep;
        this.c_position = c_position;
        this.session_key = session_key;
        this.session_limit = session_limit;
    }


    @Override
    public String toString() {
        return "CustomerVO{" +
                "c_id='" + c_id + '\'' +
                ", c_pwd='" + c_pwd + '\'' +
                ", c_name='" + c_name + '\'' +
                '}';
    }

}
