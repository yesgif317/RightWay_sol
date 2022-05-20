<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<jsp:include page="../../include/header.jsp" flush="true" />
<jsp:include page="../../include/sidebar.jsp" flush="true" />

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >

    <!-- Main Content -->
    <div id="content">
        <jsp:include page="../../include/topbar.jsp" flush="true" />
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h4 mb-2 text-gray-800">관리자승인</h1>
            <p class="mb-4">승인대기중인 회원을 승인처리 해주는 페이지 입니다.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="col-sm-12">
                        <div>
                            <a href="" class="btn btn-info btn-user" >일괄승인</a>
                            <a href="" class="btn btn-danger btn-user" >일괄반려</a>
                            <button class="btn btn-info btn-user" style="float: right;" id="select_permission" onclick="permission()" >선택승인</button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="dataTable">
                            <thead>
                            <tr>
                                <th>
                                    <label>
                                        <input type="checkbox" name="selectall" onclick="selectAll(this)">
                                    </label>
                                </th>
                                <th>Index</th>
                                <th>회원번호</th>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>이메일</th>
                                <th>전화번호</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${CustomerList}" var="customer" varStatus="status">
                                <tr onmouseover="this.style.fontSize='18 ';this.style.color='black'"  onmouseout="this.style.fontSize='16';this.style.color='#858796'">
                                    <td>
                                        <input type="checkbox" name="checkbox" id="checkbox${status.count}">
                                    </td>
                                    <td>${status.count}</td>
                                    <td id="${status.count}">${customer.cus_num}</td>
                                    <td>${customer.cus_id}</td>
                                    <td>${customer.cus_name}</td>
                                    <td>${customer.cus_email}</td>
                                    <td>${customer.cus_phone}</td>
                                </tr>

                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->


    </div>
    <script>

        function permission(){
            let checked = [];
            let formdata = new FormData();
            let arr_Checkbox = document.getElementsByName("checkbox");
            for(let i=0;i<arr_Checkbox.length;i++){
                if(arr_Checkbox[i].checked == true) {
                    checked[i] = true;
                }else{
                    checked[i] = false;
                }
            }


            let c_num = [];
            for(let i=0;i<checked.length;i++){
                if(checked[i] == true) {
                    c_num[i] = document.getElementById((i+1).toString()).innerHTML;
                    formdata.append("c_num",c_num[i]);
                }
            }

            console.log(c_num[1]);
            $.ajax({
                url: "permission.do",
                processData: false,
                contentType: false,
                data: formdata,
                type: "POST",
                success: function (result) {
                    alert("승인되었습니다.");
                    window.location.reload();
                },
                error: function (request,error){
                    window.location.reload();
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });

        }
    </script>
    <!-- End of Main Content -->

    <jsp:include page="../../include/footer.jsp" flush="true" />

    <jsp:include page="../../include/logoutModal.jsp" flush="true" />

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

    <!-- Page level plugins -->
    <script src="<c:url value="/resources/vendor/datatables/jquery.dataTables.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.min.js"/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value="/resources/js/demo/datatables-demo.js"/>"></script>






