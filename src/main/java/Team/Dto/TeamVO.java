package Team.Dto;

import lombok.Data;

@Data
public class TeamVO {
    //팀 번호
    int team_num;
    //팀 이름
    String team_name;
    //팀 설명
    String team_desc;
    //팀장
    int cus_num;
    //프로젝트 번호
    int prj_num;
}
