
package Risk.Dto;


import lombok.Data;

@Data
public class RiskVO {
    public int post_num;
    public int cate;
    public String risk_tit;
    public int cus_num;
    public String risk_reg;
    public String risk_upd;
    public String risk_imp;
    public String risk_pgs;
    public String risk_start;
    public String risk_end;
    public String risk_con;
    public int prj_num;
    public String cus_name;
    public String cus_position;
    public String mng_name;
    public int risk_mng;
    public String mng_position;

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

    public String getRisk_tit() {
        return risk_tit;
    }

    public void setRisk_tit(String risk_tit) {
        this.risk_tit = risk_tit;
    }

    public int getCus_num() {
        return cus_num;
    }

    public void setCus_num(int cus_num) {
        this.cus_num = cus_num;
    }

    public String getRisk_reg() {
        return risk_reg;
    }

    public void setRisk_reg(String risk_reg) {
        this.risk_reg = risk_reg;
    }

    public String getRisk_upd() {
        return risk_upd;
    }

    public void setRisk_upd(String risk_upd) {
        this.risk_upd = risk_upd;
    }

    public String getRisk_imp() {
        return risk_imp;
    }

    public void setRisk_imp(String risk_imp) {
        this.risk_imp = risk_imp;
    }

    public String getRisk_pgs() {
        return risk_pgs;
    }

    public void setRisk_pgs(String risk_pgs) {
        this.risk_pgs = risk_pgs;
    }

    public String getRisk_start() {
        return risk_start;
    }

    public void setRisk_start(String risk_start) {
        this.risk_start = risk_start;
    }

    public String getRisk_end() {
        return risk_end;
    }

    public void setRisk_end(String risk_end) {
        this.risk_end = risk_end;
    }

    public String getRisk_con() {
        return risk_con;
    }

    public void setRisk_con(String risk_con) {
        this.risk_con = risk_con;
    }

    public int getPrj_num() {
        return prj_num;
    }

    public void setPrj_num(int prj_num) {
        this.prj_num = prj_num;
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

    public int getRisk_mng() {
        return risk_mng;
    }

    public void setRisk_mng(int risk_mng) {
        this.risk_mng = risk_mng;
    }

    public String getMng_name() {
        return mng_name;
    }

    public void setMng_name(String mng_name) {
        this.mng_name = mng_name;
    }

    public String getMng_position() {
        return mng_position;
    }

    public void setMng_position(String mng_position) {
        this.mng_position = mng_position;
    }

}
