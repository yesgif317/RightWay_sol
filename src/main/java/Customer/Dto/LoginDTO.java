package Customer.Dto;

import lombok.Data;

@Data
public class LoginDTO {
    private String c_id;
    private String c_pwd;
    private boolean useCookie;

    @Override
    public String toString() {
        return "LoginDTO{" +
                "c_id='" + c_id + '\'' +
                ", c_pwd='" + c_pwd + '\'' +
                ", useCookie=" + useCookie +
                '}';
    }

}
