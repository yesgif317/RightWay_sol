<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회사 선택</title>

    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">

    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>
    <script type="text/javascript">
        function comok(com_name,com_num) {
            opener.document.joinform.com_name.value = com_name;
            opener.document.joinform.com_num.value = com_num;
            self.close();
        }
    </script>
</head>
<body>
<form method="post" class="form-signin mt-5" action="/comCheck.do" name="joinform" id="joinform">
    <div class="row form-label-group">
        <div class="col-3"></div>
        <div class="col-6">
        <input type="text" id="com_name" name="com_name" class="form-control" value="${com_name}"/>
        </div>
    </div>

    <div class="row form-label-group mt-3">
        <div class="col-3"></div>
        <div class="col-6">
        <input class="btn btn-lg btn-secondary btn-block text-lowercase"
               type="submit" value="회사 검색" id="comCheckbtn">
        </div>
    </div>


    <div class="row form-label-group mt-5">
        <div class="col-1"></div>
        <div class="col-10">

            <div class="card mb-4">

                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="dataTable1">
                            <thead>
                            <tr>
                                <th>회사명</th>
                                <th>주요사업</th>
                                <th>전화번호</th>
                                <th></th>
                            </tr>
                            </thead>

                            <tbody>
                           <c:forEach items="${companyList}" var="com">
                                        <tr>
                                            <td>${com.com_name}</td>
                                            <td>${com.com_business}</td>
                                            <td>${com.com_tel}</td>
                                            <td class="text-center">
                                                <a class="btn btn-info text-gray-100" onclick="comok('${com.com_name}','${com.com_num}')"> 선택</a>
                                            </td>
                                        </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

</body>

</html>