<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>엑셀 업로드</title>
</head>

<body>
<div class="uploaddiv">
    <input type="file" name="uploadFile" multiple>
</div>
<button id="uploadBtn">Upload</button>


<script
        src="http://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        $("#uploadBtn").on("click", function (e) {
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            var files = inputFile[0].files;
            console.log(files);

            for(var i=0; i<files.length; i++){
                formData.append("uploadFile", files[i]);
            }
            $.ajax({
                url : "file-upload.do",
                processData: false,
                contentType: false,
                data : formData,
                type : "POST",
                success : function(result){
                    alert("Uploaded");
                }
            });
        });
    });
</script>

</body>


</html>