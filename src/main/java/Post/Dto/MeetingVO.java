package Post.Dto;

import lombok.Data;

import java.util.Date;
@Data
public class MeetingVO {

    //게시글번호
    int post_num;
    //분류번호
    int cate;
    //제목
    String meet_tit;
    //작성자
    int cus_num;
    //작성일
    Date meet_reg;
    //수정일
    Date meet_upd;
    //회의주제
    String meet_sbj;
    //회의 당일 날짜
    Date meet_date;
    //회의 참가자
    String meet_mbr;
    //회의 내용
    String meet_cnt;
    //미팅장소
    String meet_loc;

}
