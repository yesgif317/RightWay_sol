package File.Dto;

import lombok.Data;

@Data
public class FileVO {
    //게시글 번호
    int post_num;
    //분류 번호
    int cate;
    String file_name;
    String file_link;

    public FileVO(int post_num, int cate, String file_name){
        this.post_num = post_num;
        this.cate = cate;
        this.file_name = file_name;
    }

}
