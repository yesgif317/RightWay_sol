package Post.Dto;

import java.util.Date;

public class Post_eventVO {
    int p_num;
    String e_category;
    String e_purpose;
    String e_host;
    String e_supervise;
    String e_location;
    String e_url;
    String e_contents;
    int e_price;
    int e_limit;
    Date e_startdate;
    Date e_enddate;
    Date e_acceptstart;
    Date e_acceptend;

    public int getP_num() {return p_num;}

    public Date getE_acceptend() {return e_acceptend;}

    public Date getE_acceptstart() {return e_acceptstart;}

    public Date getE_enddate() {return e_enddate;}

    public Date getE_startdate() {return e_startdate;}

    public int getE_limit() {return e_limit;}

    public int getE_price() {return e_price;}

    public String getE_category() {return e_category;}

    public String getE_contents() {return e_contents;}

    public String getE_host() {return e_host;}

    public String getE_location() {return e_location;}

    public String getE_purpose() {return e_purpose;}

    public String getE_supervise() {return e_supervise;}
}
