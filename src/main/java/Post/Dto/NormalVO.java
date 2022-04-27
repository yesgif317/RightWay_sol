package Post.Dto;

import lombok.Data;

import java.util.Date;
@Data
public class NormalVO {
    //게시글 번호
    int post_num;
    //분류번호
    int cate;
    //프로젝트 번호
    int prj_num;
    //제목
    String nor_tit;
    //등록일
    Date nor_reg;
    //수정일
    Date nor_upd;
    //작성자 번호
    int cus_num;
    //내용(contents)
    String nor_cnt;

}
