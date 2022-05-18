package Company.Dto;

import lombok.Data;

@Data
public class CompanyVO {
    public int com_num;
    public String com_name;
    public String com_tel;
    public String com_addr;
    public String com_scale;
    public String com_business;
    public String com_contract;
    public String com_count;

    public int getCom_num() {
        return com_num;
    }

    public void setCom_num(int com_num) {
        this.com_num = com_num;
    }

    public String getCom_name() {
        return com_name;
    }

    public void setCom_name(String com_name) {
        this.com_name = com_name;
    }

    public String getCom_tel() {
        return com_tel;
    }

    public void setCom_tel(String com_tel) {
        this.com_tel = com_tel;
    }

    public String getCom_addr() {
        return com_addr;
    }

    public void setCom_addr(String com_addr) {
        this.com_addr = com_addr;
    }

    public String getCom_scale() {
        return com_scale;
    }

    public void setCom_scale(String com_scale) {
        this.com_scale = com_scale;
    }

    public String getCom_business() {
        return com_business;
    }

    public void setCom_business(String com_business) {
        this.com_business = com_business;
    }

    public String getCom_contract() {
        return com_contract;
    }

    public void setCom_contract(String com_contract) {
        this.com_contract = com_contract;
    }

    public String getCom_count() {
        return com_count;
    }

    public void setCom_count(String com_count) {
        this.com_count = com_count;
    }
}
