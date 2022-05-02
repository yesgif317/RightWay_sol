<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--
사용법 : 하단부의

</div>
<-- End of Main Content --/ 밑에 다음 jsp:include 넣어주면 됨

<
jsp:include page="../../include/footer.jsp" flush="true" />

-->




<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column" >

    <!-- Main Content -->
    <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">





            <!-- 댓글 펴기/접기 부분 -->
            <details>
                <summary>[...]</summary>


                <!-- 댓글 입력공간 -->
                <td>
                    <input type="text" id="id" name="id" class="form-control" style="width:93%;float:left" placeholder="댓글 입력">
                    <input type="button" id="id_check" class="btn btn-outline-primary" value="등록"  style="float:right">
                </td>

                <br>
                <br>

                <!-- section 시작 = 댓글영역 시작 -->
                <section id="bo_vc" class="comment-media">


                    <!-- 첫번째 댓글부분 -->
                    <div class="media" id="c_12584096">
                        <div class="photo pull-left">
                            <i class="fa-solid fa-user text-gray-700"></i>
                        </div>
                        <div class="media-body">
                            <div class="media-heading">
                                <b>
                                <span class="member">
                                    ${login.c_dep}/${login.c_position}/${login.c_name}
                                </span>
                                </b>
                                <span class="font-11 text-muted">
                                <span class="media-info">
                                    <i class="fa fa-clock-o">
                                    <fmt:formatDate value="${board.refdate}" pattern="yyyy-MM-dd" />
                                    </i>
                                </span>
                            </span>

                                "${login.c_dep} 이런식으로 이곳에 date 넣기${board.refdate}" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a class="text-muted media-btn" href="#" onclick="" style="text-align:right;">
                                    삭제
                                </a>
                            </div>  <!-- 상단영역=삭제 링크 까지 종료 -->


                            <!-- 댓글 본문 작성 부분 시작 -->
                            <div class="media-content">
                                "이곳에 db 데이터 불러오면 됨 = 댓글 내용 ${login.c_position}"
                                <div class="cmt-good-btn">
                                    <a href="#" class="add re-cmt" onclick="">
                                        <span>댓글 달기</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div><!-- 첫 댓글 종료 -->


                    <!-- 댓글 나누는 선 -->
                    <hr>


                    <!-- 대댓글 시작부부 -->
                    <div class="media" id="c2_12584096" style="margin-left:64px;">
                        <div class="photo pull-left">
                            <i class="fa-solid fa-user text-gray-700"></i>
                            <!--
                            <img src="이미지 주소" alt class="media-object">
                            -->
                        </div>
                        <div class="media-body">
                            <div class="media-heading">
                                <b>
                                <span class="member">
                                    ${login.c_dep}/${login.c_position}/${login.c_name}
                                </span>
                                </b>
                                <span class="font-11 text-muted">
                                <span class="media-info">
                                    <i class="fa fa-clock-o">
                                        ::before
                                    </i>
                                    <fmt:formatDate value="${board.refdate}" pattern="yyyy-MM-dd" />
                                </span>
                            </span>
                                "${board.refdate} &nbsp; " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a class="text-muted media-btn" href="#" onclick="">
                                    삭제
                                </a>
                            </div>  <!-- 상단영역=삭제 링크 까지 종료 -->


                            <!-- 댓글 본문 작성 부분 시작 -->
                            <div class="media-content">
                                "이곳에 db 데이터 불러오면 됨 = 댓글 내용 ${login.c_position}"
                                <div class="cmt-good-btn">
                                    <a href="#" class="add re-cmt" onclick="">
                                        <span>댓글 달기</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>  <!-- 대댓글 종료 -->


                </section>  <!-- section 종료 = 댓글영역 끝 -->


            </details>  <!-- end of, 댓글 펴기/접기 -->







        </div>

    </div>
    <!-- /.container-fluid -->


</div>
<!-- End of Main Content -->




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
<script src="https://kit.fontawesome.com/55082abfe9.js" crossorigin="anonymous"></script>
</body>

</html>
