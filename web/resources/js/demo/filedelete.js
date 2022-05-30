function delete_form(cate,post_num,file_name) {
    var delete_div = document.getElementById('filedelete');

    var input_cate = document.createElement('input');
    input_cate.setAttribute("type", "hidden");
    input_cate.setAttribute("name", "cate");
    input_cate.setAttribute("value", cate);
    var input_post_num = document.createElement('input');
    input_post_num.setAttribute("type", "hidden");
    input_post_num.setAttribute("name", "post_num");
    input_post_num.setAttribute("value", post_num);
    var input_file_name = document.createElement('input');
    input_file_name.setAttribute("type", "hidden");
    input_file_name.setAttribute("name", "file_name");
    input_file_name.setAttribute("value", file_name);
    delete_div.appendChild(input_cate);
    delete_div.appendChild(input_post_num);
    delete_div.appendChild(input_file_name);
    document.getElementById(file_name).style.color = "orange"
    document.getElementById("x_" + file_name).remove()
}