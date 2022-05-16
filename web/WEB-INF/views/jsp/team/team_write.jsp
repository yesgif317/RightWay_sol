<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../../include/header.jsp" flush="true"/>
<jsp:include page="../../include/sidebar.jsp" flush="true"/>
<%
    int test = Integer.parseInt(request.getParameter("update"));
    pageContext.setAttribute("test", test);
%>


<script>
    function tlselect(num,name) {
        document.getElementById('cus_name').setAttribute("value", name );
        document.getElementById('cus_num').setAttribute("value", num);
    }
    function chk_form() {
        if (document.getElementById("team_desc").value == '' || document.getElementById("team_name").value == '') {
            $('#exampleModal').modal('show')
        } else {
            <c:choose>
            <c:when test="${test eq '1'}">
            document.getElementById('teamupdateform').submit();
            </c:when>
            <c:otherwise>
            document.getElementById('teamwriteform').submit();
            </c:otherwise>
            </c:choose>
        }
    }

    function update_form() {
        document.getElementById('teamupdateform').submit();
    }

    function memberselect(cell) {
        var location = document.getElementById('result');
        var select_cus = document.getElementById(cell).value
        /*location.textContent +=select_cus + ", ";*/
        /*const newinput = document.createElement('input');
        const newText = document.createTextNode(select_cus);*/

        var input1 = document.createElement('input');
        input1.setAttribute("type", "text");
        input1.setAttribute("value", select_cus);
        input1.setAttribute("readonly", "readonly");
        input1.setAttribute("style", "border:none");
        input1.setAttribute("id", "cus_num");
        input1.setAttribute("name", "cus_num");
        location.appendChild(document.createElement('br'));
        location.appendChild(input1);
        document.getElementById('teammemberwriteform').submit();
    }
    function delete_form(cus_num) {
        document.getElementById('delete_cus_num').setAttribute("value",cus_num);
        document.getElementById('teammemberdeleteform').submit();
    }




</script>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">
        <jsp:include page="../../include/topbar.jsp" flush="true"/>
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">

                    <!-- Collapsable Card Example -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Accordion -->
                        <a class="d-block card-header py-3">

                            <c:choose>
                                <c:when test="${test eq '1'}">
                                    <h5 class="m-0 font-weight-bold text-primary text-center">팀정보 수정</h5>
                                </c:when>
                                <c:otherwise>
                                    <h5 class="m-0 font-weight-bold text-primary text-center">팀 등록</h5>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <c:choose>
                                <c:when test="${test eq '1'}">
                                <form method="post" action="team_update.do?post_num=${TeamList.team_num}"
                                      id="teamupdateform" enctype="application/x-www-form-urlencoded"
                                      class="form-horizontal">
                                    </c:when>
                                    <c:otherwise>
                                    <form method="post" action="team_insert.do" id="teamwriteform"
                                          enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                        </c:otherwise>
                                        </c:choose>

                                        <!-- 프로젝트 넘버 임의지정 -->

                                            <input type="hidden" name="prj_num"
                                                   value=1 />
                                        <div class="row form-group">
                                            <div class="col-2"></div>
                                            <div class="col-4 ">
                                                <small class="help-block form-text">팀명</small>
                                                <input style="solid: whitesmoke" value="${TeamList.team_name}"
                                                       placeholder="입력해주세요" type="text" id="team_name"
                                                       name="team_name" class="form-control"/>
                                            </div>
                                            <div class="col-4" >
                                                <small class="help-block form-text">프로젝트</small>
                                                <input style="background-color:white;border:none" value="${TeamList.prj_name}" type="text"  id="team_company" name="team_company" class="form-control" readonly="readonly" disabled/>
                                                <input style="background-color:white;border:none" value="${TeamList.prj_num}" type="hidden"  id="team_prj_num" name="team_prj_num" class="form-control" readonly="readonly"/>
                                            </div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col-2"></div>
                                            <div class="col-4 ">
                                                <small class="help-block form-text">팀장</small>
                                                <a  class="btn btn-secondary" data-toggle="modal" data-target="#PLModal">
                                                    <span class="text" style="color:white">PL선택</span>
                                                </a>
                                                <!-- Modal -->
                                                <div class="modal fade" id="PLModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true" >
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel1">PL선택</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span>
                                                                </button>
                                                            </div>

                                                            <div class="modal-body">
                                                                <div class="card-body">
                                                                    <div class="table-responsive">
                                                                        <table class="table table-sm table-bordered table-hover" id="dataTable_pl">
                                                                            <thead>
                                                                            <tr>
                                                                                <th width="30%">이름</th>
                                                                                <th width="20%">직책</th>
                                                                                <th>이메일</th>
                                                                                <th></th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            <c:forEach items="${CustomerList}" var="customer"  >
                                                                                <tr >
                                                                                    <td>${customer.cus_name}</td>
                                                                                    <td>${customer.cus_position}</td>
                                                                                    <td>${customer.cus_email}</td>
                                                                                    <td onclick="return tlselect('${customer.cus_num}','${customer.cus_name}')">
                                                                                        <a class="btn btn-secondary text-gray-100" data-dismiss="modal">선택</a>
                                                                                    </td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="modal-footer">
                                                                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--<c:choose>
                                                    <c:when test="${test eq '1'}">
                                                        <input style="background-color:white;border:none" value="${TeamList.cus_name}"
                                                                readonly="readonly" class="form-control"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input style="background-color:white;border:none" value="${login.cus_name}" type="text"
                                                               id="cus_name" name="cus_name" readonly="readonly" class="form-control"/>
                                                        <input style="background-color:white;border:none" value="${login.cus_num}" type="hidden"
                                                               id="cus_num" name="cus_num" readonly="readonly" class="form-control"/>
                                                    </c:otherwise>
                                                </c:choose>--%>
                                                <input id="cus_name" class="ml-2"
                                                       style="border:0 solid whitesmoke;" value="${TeamList.cus_position} / ${TeamList.cus_name}" placeholder="선택해주세요."
                                                       readonly>
                                                <input type="hidden" id="cus_num" name="cus_num" placeholder="선택해주세요." class="form-control" value="${TeamList.cus_num}">
                                            </div>

                                            <div class="col-4" >
                                                <small class="help-block form-text">팀장 이메일 </small>
                                                <input style="background-color:white;border:none" value="${TeamList.cus_email}" type="text"   name="team_company" class="form-control" readonly="readonly" disabled/>
                                            </div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col-2"></div>
                                            <div class="col-5">
                                                <small class="help-block form-text">팀설명</small>
                                                <textarea style=" solid: whitesmoke; width: 100%;  resize: both"
                                                          placeholder="입력해주세요" id="team_desc"
                                                          name="team_desc" class="form-control">${TeamList.team_desc}</textarea>
                                            </div>
                                        </div>
                                    </form>
                                        <c:if test="${test eq 1}">
                                    <div class="row form-group">
                                        <div class="col-2"></div>

                                        <div class="col col-md-3 text-left">

                                            <a class="btn btn-sm ml-3 btn-info" data-toggle="modal"
                                               data-target="#exampleModal1">
                                                <span class="text " style="color:white">팀원추가</span>
                                            </a>
                                                <!-- Modal -->
                                            <div class="modal fade" id="exampleModal1"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">


                                                        <div class="modal-header">
                                                            팀원선택
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>

                                                        <div class="modal-body">
                                                            <div class="card-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-sm table-bordered table-hover" id="dataTable">
                                                                    <thead>
                                                                    <tr>
                                                                        <th width="30%">이름</th>
                                                                        <th width="20%">직책</th>
                                                                        <th>이메일</th>

                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:forEach items="${CusmodalList}" var="cusmodal">
                                                                        <c:set var="i" value="${i+1}"/>

                                                                            <td>${cusmodal.cus_name}</td>
                                                                            <td>${cusmodal.cus_position}</td>
                                                                            <td>${cusmodal.cus_email}</td>
                                                                        <td><input type="hidden" id='${i}'
                                                                                   value='${cusmodal.cus_num}'>
                                                                            <a class="btn btn-secondary text-gray-100" data-dismiss="modal"
                                                                               onclick="return memberselect('${i}')">선택</a>
                                                                        </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    </div>
                                        </div>
                                    </div>





                                        </div>

                                    </div>


                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">팀원목록</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <input type="hidden" id="team_num" name="team_num"
                                               value='${TeamList.team_num}'/>
                                        <div class="col-2"></div>
                                        <div class="col-8"
                                             style="border-top:  2px solid #ff7f00;border-bottom: 2px solid #ff7f00;">
                                            <div class="card mb-4">

                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered" id="dataTable1">
                                                            <thead>
                                                            <tr>
                                                                <th>이름</th>
                                                                <th>직책</th>
                                                                <th>연락처</th>
                                                                <th>이메일</th>
                                                                <th >부서</th>
                                                                <th >상태</th>
                                                                <th width="5%"></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                            <c:forEach items="${TeammemberList}" var="teammember">

                                                                <c:forEach items="${CustomerList}" var="customer">
                                                                    <c:if test="${teammember.cus_num eq customer.cus_num}">
                                                                        <tr>
                                                                            <td>${customer.cus_name}</td>
                                                                            <td>${customer.cus_position}</td>
                                                                            <td>${customer.cus_phone}</td>
                                                                            <td>${customer.cus_email}</td>
                                                                            <td>${cusmodal.cus_dep}</td>
                                                                            <td>${cusmodal.cus_state}</td>
                                                                            <td onclick="return delete_form(${teammember.cus_num})">
                                                                                <a class="btn ml-2 btn-warning "> <i
                                                                                        class="fa-regular fa-circle-xmark "></i></a>

                                                                            </td>
                                                                        </tr>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <form method="post" action="/teammember_delete.do" id="teammemberdeleteform"
                                                  enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                                <input type="hidden" name="_method" value="delete">
                                                <input type="hidden"  name="team_num"
                                                       value='${TeamList.team_num}'/>
                                                <input type="hidden" id="delete_cus_num" name="cus_num"/>
                                            </form>
                                            <form method="post"
                                                  action="teammember_insert.do?team_num=${TeamList.team_num}&update=1"
                                                  id="teammemberwriteform" enctype="application/x-www-form-urlencoded"
                                                  class="form-horizontal">
                                                <div class="col-12 col-md-7 text-gray-900 fa-solid m-2" id='result'>
                                                    <%--<input type="text" id="cus_num" name="cus_num"  value=4 />--%>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                        </c:if>
                            </div>
                            <div class="text-center d-block card-header py-3">
                                <a onclick="return chk_form()" class="btn btn-info">
                                                <span class="icon text-white-50">
                                                       <i class="fas fa-pen"></i>
                                                </span>
                                    <span class="text" style="color:white">
                                        <c:choose>
                                            <c:when test="${test eq '1'}">
                                                <span class="text" style="color:white">수정</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text" style="color:white">등록</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </a>

                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">작성글 확인</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                팀명 또는 팀장이 작성되지 않았습니다.
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-secondary" type="button" data-dismiss="modal">
                                                    확인
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <a href="team.do" class="btn btn-secondary">
                                                <span class="icon text-white-50">
                                                       <i class="fas fa-pen"></i>
                                                </span>
                                    <span class="text">취소</span>

                                </a>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->


    <jsp:include page="../../include/footer.jsp" flush="true"/>

    <jsp:include page="../../include/logoutModal.jsp" flush="true"/>

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