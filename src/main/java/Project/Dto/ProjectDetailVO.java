package Project.Dto;
import lombok.Data;

@Data
public class ProjectDetailVO {

    int cus_num;
    String cus_name;
    String cus_position;
    String cus_phone;
    String cus_email;
    int prj_num;
    String auth;

    public int getCus_num() {
        return cus_num;
    }

    public void setCus_num(int cus_num) {
        this.cus_num = cus_num;
    }

    public int getPrj_num() {
        return prj_num;
    }

    public void setPrj_num(int prj_num) {
        this.prj_num = prj_num;
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    public String getCus_name() {
        return cus_name;
    }

    public void setCus_name(String cus_name) {
        this.cus_name = cus_name;
    }

    public String getCus_position() {
        return cus_position;
    }

    public void setCus_position(String cus_position) {
        this.cus_position = cus_position;
    }

    public String getCus_phone() {
        return cus_phone;
    }

    public void setCus_phone(String cus_phone) {
        this.cus_phone = cus_phone;
    }

    public String getCus_email() {
        return cus_email;
    }

    public void setCus_email(String cus_email) {
        this.cus_email = cus_email;
    }
}
