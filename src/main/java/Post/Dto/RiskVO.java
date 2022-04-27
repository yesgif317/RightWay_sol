package Post.Dto;

import lombok.Data;

import java.util.Date;
@Data
public class RiskVO {
    //게시글 번호
    int post_num;
    //작성자 번호
    int cus_num;
    //프로젝트 번호
    int number;
    //제목
    String risk_tit;
    //등록일
    Date risk_reg;
    //수정일
    Date risk_upd;
    //내용(contents)
    String nor_cnt;
    //중요도
    String risk_imp;
    //진행상태
    String risk_pgs;
    //내용
    String risk_con;
    //시작일
    Date risk_start;
    //종료일
    Date risk_end;
    //프로젝트 번호
    int prj_num;

//    post_num number,
//    cate number,
//    risk_tit varchar(100),
//    cus_num number,
//    risk_reg date,
//    risk_upd date,
//    risk_imp varchar(20),
//    risk_pgs varchar(20),
//    risk_con varchar(600),
//    risk_start Date,
//    risk_end Date,
//    prj_num number,

}
