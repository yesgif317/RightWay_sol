package Team.Dto;
import lombok.Data;

@Data
public class TeamVO {

    int team_num;
    String team_name;
    String team_desc;
    int cus_num;
    int prj_num;
    String cus_name;
    String prj_name;

    public int getTeam_num(){return team_num;}
    public void setTeam_num(int team_num){this.team_num = team_num;}

    public String getTeam_name(){return team_name;}
    public void setTeam_name(String team_name){this.team_name = team_name;}

    public String getTeam_desc(){return team_desc;}
    public void setTeam_desc(String team_desc){this.team_desc = team_desc;}

    public int getCus_num(){return cus_num;}
    public void setCus_num(int cus_num){this.cus_num = cus_num;}

    public int getPrj_num(){return prj_num;}
    public void setPrj_num(int prj_num){this.prj_num = prj_num;}

    public String getCus_name(){return cus_name;}
    public void setCus_name(String cus_name){this.cus_name = cus_name;}

    public String getPrj_name(){return prj_name;}
    public void setPrj_name(String prj_name){this.prj_name = prj_name;}

}
