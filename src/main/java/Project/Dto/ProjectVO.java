package Project.Dto;

import lombok.Data;

@Data
public class ProjectVO {

    int prj_num;
    String prj_name;
    int cus_num;
    String prj_start;
    String prj_end;
    String prj_reg;
    String prj_upd;
    String cus_name;
    String cus_position;

    public int getPrj_num() {
        return prj_num;
    }

    public void setPrj_num(int prj_num) {
        this.prj_num = prj_num;
    }

    public String getPrj_name() {
        return prj_name;
    }

    public void setPrj_name(String prj_name) {
        this.prj_name = prj_name;
    }

    public int getCus_num() {
        return cus_num;
    }

    public void setCus_num(int cus_num) {
        this.cus_num = cus_num;
    }

    public String getPrj_start() {
        return prj_start;
    }

    public void setPrj_start(String prj_start) {
        this.prj_start = prj_start;
    }

    public String getPrj_end() {
        return prj_end;
    }

    public void setPrj_end(String prj_end) {
        this.prj_end = prj_end;
    }

    public String getPrj_reg() {
        return prj_reg;
    }

    public void setPrj_reg(String prj_reg) {
        this.prj_reg = prj_reg;
    }

    public String getPrj_upd() {
        return prj_upd;
    }

    public void setPrj_upd(String prj_upd) {
        this.prj_upd = prj_upd;
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

    public ProjectVO(){

    }

    @Override
    public String toString() {
        return "ProjectVO{" +
                "prj_num='" + prj_num + '\'' +
                ", prj_name='" + prj_name + '\'' +
                ", cus_num='" + cus_num + '\'' +
                ", prj_start='" + prj_start + '\'' +
                ", prj_end='" + prj_end + '\'' +
                ", prj_reg='" + prj_reg + '\'' +
                ", prj_upd='" + prj_upd + '\'' +
                ", cus_name='" + cus_name + '\'' +
                ", cus_position='" + cus_position + '\'' +
                '}';
    }

}
