package Customer.Dto;

import lombok.Data;

@Data
public class LoginDTO {
    private String cus_id;
    private String cus_pwd;
    private boolean useCookie;

    @Override
    public String toString() {
        return "LoginDTO{" +
                "c_id='" + cus_id + '\'' +
                ", c_pwd='" + cus_pwd + '\'' +
                ", useCookie=" + useCookie +
                '}';
    }

}
