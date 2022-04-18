package Post.Dto;

public class Post_normalVO {
    int p_num;
    String n_category;
    String n_contents;

    public int getP_num(){return p_num;}

    public String getN_category(){return n_category;}
    public void setN_category(String n_category){this.n_category = n_category;}

    public String getN_contents(){return n_contents;}
    public void setN_contents(String n_contents){this.n_contents = n_contents;}
}
