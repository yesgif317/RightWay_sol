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

    public void setNor_cnt(String nor_cnt) {
        this.nor_cnt = nor_cnt;
    }
    public String getNor_cnt() { return nor_cnt;  }

    public void setNor_tit(String nor_tit) {
        this.nor_tit = nor_tit;
    }
    public String getNor_tit() { return nor_tit;  }

    public void setCate(int cate) {
        this.cate = cate;
    }
    public int getCate() { return cate;  }

    public void setPrj_num(int prj_num) {
        this.prj_num = prj_num;
    }
    public int getPrj_num() { return prj_num;  }

    public void setPost_num(int post_num) {
        this.post_num = post_num;
    }
    public int getPost_num() { return post_num;  }


    public int getCus_num() { return cus_num;  }
    public void setCus_num(int cus_num) {
        this.cus_num = cus_num;
    }

    public void setNor_reg(Date nor_reg) {
        this.nor_reg = nor_reg;
    }
    public Date getNor_reg() { return nor_reg;  }


    private int prevNum; //이전글의 글번호를 담을 필드
    private int nextNum; //다음글의 글번호를 담을 필드

}
