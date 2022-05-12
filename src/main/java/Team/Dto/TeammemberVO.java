package Team.Dto;
import lombok.Data;
@Data
public class TeammemberVO {


    int cus_num;
    int team_num;

    public int getTeam_num(){return team_num;}
    public void setTeam_num(int team_num){this.team_num = team_num;}


    public int getCus_num(){return cus_num;}
    public void setCus_num(int cus_num){this.cus_num = cus_num;}


}
