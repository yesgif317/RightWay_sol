package Post.Dto;

import lombok.Data;

import java.util.Date;
@Data
public class EventVO {
    //게시글 번호
    int post_num;
    //분류번호
    int cate;
    //행사 제목
    String evt_tit;
    //작성자(주최자)
    int cus_num;
    //작성일
    Date evt_reg;
    //수정
    Date evt_upd;
    //행사목적
    String evt_sbj;
    //행사주최
    String evt_host;
    //주관
    String evt_supervise;
    //장소
    String evt_loc;
    //참조URL
    String evt_url;
    //본문
    String evt_cnt;
    //참가비용
    int evt_pri;
    //정원
    int evt_limit;
    //행사 시작 날짜
    Date evt_start;
    //종료일
    Date evt_end;
    //접수 시작일
    Date evt_acptstart;
    //접수종료일
    Date evt_acpend;
    //프로젝트 번호
    int prj_num;
}
