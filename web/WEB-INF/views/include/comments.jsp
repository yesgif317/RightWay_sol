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

<script>
    function CheckInputNull1() {
        if (cmt_cnt.value == "") {
            alert("댓글에 값을 입력하여 주십시오.");
            return false;
        }
    }
</script>


<c:choose>
    <c:when test="${not empty RiskList.cate}">
        <c:set var="cate" value="${RiskList.cate}"/>
    </c:when>
    <c:when test="${not empty PostList.cate}">
        <c:set var="cate" value="${PostList.cate}"/>
    </c:when>
    <c:when test="${not empty EventList.cate}">
        <c:set var="cate" value="${EventList.cate}"/>
    </c:when>
    <c:otherwise>
        <c:set var="cate" value="0"/>
    </c:otherwise>
</c:choose>


<c:choose>
    <c:when test="${not empty RiskList.post_num}">
        <c:set var="post_num" value="${RiskList.post_num}"/>
    </c:when>
    <c:when test="${not empty PostList.post_num}">
        <c:set var="post_num" value="${PostList.post_num}"/>
    </c:when>
    <c:when test="${not empty EventList.post_num}">
        <c:set var="post_num" value="${EventList.post_num}"/>
    </c:when>
    <c:otherwise>
        <c:set var="post_num" value="0"/>
    </c:otherwise>
</c:choose>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

            <%! int count = 0; %>
            <%! int re_count = 0; %>

            <c:forEach items="${CommentList}" var="comment">
                <c:if test="${comment.post_num eq post_num && comment.cate eq cate}">

                    <% count++; %>

                    <c:forEach items="${Re_CommentList}" var="recomment">
                        <c:if test="${recomment.cmt_num == comment.cmt_num}">

                            <% re_count++; %>

                        </c:if>
                    </c:forEach>
                </c:if>
            </c:forEach>

            <%! int count_sum = 0; %>
            <% count_sum = count + re_count; %>
            <!--$
            {countComment}
             댓글갯수-->

            <!-- 댓글 펴기/접기 부분 -->
            <details>
                <summary><%=count_sum%> Comments [...]</summary>
                <% count = 0; %>
                <% re_count = 0; %>
                <form name="insert_cmt_cnt" method="post" action="/comments_insert.do"
                      onsubmit="return CheckInputNull1()">
                    <!-- 댓글 입력공간 -->
                    <td>
                        <!-- 링크용 uri, post_num, cate 정보 -->
                        <input type="hidden" id="uri_cmt_insert" name="uri_cmt_insert" value="${uri}"/>
                        <input type="hidden" id="post_num_cmt_insert" name="post_num_cmt_insert" value="${post_num}"/>
                        <input type="hidden" id="cate_cmt_insert" name="cate_cmt_insert" value="${cate}"/>
                        <!-- 댓글작성 -->
                        <input type="hidden" id="com_name_insert" name="com_name_insert" value="${login.com_name}"/>
                        <input type="hidden" id="cus_name_insert" name="cus_name_insert" value="${login.cus_name}"/>
                        <input type="hidden" id="cus_dep_insert" name="cus_dep_insert" value="${login.cus_dep}"/>
                        <input type="hidden" id="cus_position_insert" name="cus_position_insert" value="${login.cus_position}"/>

                        <input type="text" id="cmt_cnt" name="cmt_cnt" class="form-control" style="width:93%;float:left"
                               placeholder="댓글 입력"/>
                        <input type="submit" class="btn btn-add-comment" value="등록" style="float:right"/>
                    </td>
                </form>

                <br>
                <br>


                <%! int dis_id1 = 1; %>
                <%! int dis_id2 = 2; %>
                <%! int dis_id3 = 1; %>
                <%! int dis_id4 = 2; %>


                <c:forEach items="${CommentList}" var="comment">
                    <c:if test="${comment.post_num eq post_num && comment.cate eq cate}">


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
                                    ${comment.com_name}/${comment.cus_name}/${comment.cus_dep}/${comment.cus_position} / ${comment.cmt_num}/${comment.cus_num}

                                </span>
                                    </b>
                                    <span class="clock-info">
                                    <i class="fa fa-clock-o">
                                    </i>
                                            ${comment.cmt_date}
                            </span>

                                    <!-- 수정버튼 누르면 기존 text 사라지고, 입력할 수 있게 input 나옴 -->
                                    <script type="text/javascript">
                                        function b<%=dis_id2%>() {
                                            if ($('#b<%=dis_id2%>').css('display') == 'none') {
                                                $('#b<%=dis_id2%>').show();
                                            } else {
                                                $('#b<%=dis_id2%>').hide();
                                            }
                                        }

                                        function a<%=dis_id1%>() {
                                            if ($('#a<%=dis_id1%>').css('display') == 'none') {
                                                $('#a<%=dis_id1%>').show();
                                            } else {
                                                $('#a<%=dis_id1%>').hide();
                                            }
                                        }


                                        <!-- 댓글 입력창에 빈값을 입력하면, 알림창 뜨면서 입력 막음 -->
                                        function CheckInputNull2<%=dis_id2%>() {
                                            if (update_cmt_cnt<%=dis_id2%>.cmt_update.value == "") {
                                                alert("댓글에 값을 입력하여 주십시오.");
                                                return false;
                                            }
                                        }
                                    </script>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



                                    <div id="b<%=dis_id2%>" style="display: none;">
                                        <form name="update_cmt_cnt<%=dis_id2%>" method="post" action="/comments_update.do"
                                              onsubmit="return CheckInputNull2<%=dis_id2%>()">
                                            <!-- 링크용 uri 정보 -->
                                            <input type="hidden" id="uri_cmt_update" name="uri_cmt_update"
                                                   value="${uri}"/>
                                            <!-- 댓글수정 -->
                                            <input type="hidden" id="cmt_num_inform_update" name="cmt_num_inform_update"
                                                   value="${comment.cmt_num}"/>
                                            <input type="text" id="cmt_update" name="cmt_update" class="form-control"
                                                   style="width:93%;float:left" placeholder="${comment.cmt_cnt}"/>
                                            <input type="submit" class="btn btn-comment_update" value="수정"
                                                   style="float:right"/>
                                        </form>

                                        <form method="get" action="javascript:a<%=dis_id1%>();b<%=dis_id2%>();">
                                            <input type="submit" class="btn btn-comment_delete" value="취소"
                                                   style="float:right"/>
                                        </form>
                                    </div>


                                    <div id="a<%=dis_id1%>" style="display: contents;">


                                        <c:choose>
                                            <c:when test="${login.com_name eq comment.com_name && login.cus_name eq comment.cus_name && login.cus_dep eq comment.cus_dep && login.cus_position eq comment.cus_position}">
                                                <form method="get" action="javascript:a<%=dis_id1%>();b<%=dis_id2%>();">
                                                    <input type="submit" class="btn btn-comment_delete" value="수정"
                                                           style="float:right"/>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <br><br>
                                                <input type="submit" class="btn btn-comment_delete" value=""
                                                       style="float:right"/>
                                            </c:otherwise>
                                        </c:choose>

                                        <!-- 댓글 본문 부분 시작 -->

                                            ${comment.cmt_cnt}

                                        <c:choose>
                                        <c:when test="${login.com_name eq comment.com_name && login.cus_name eq comment.cus_name && login.cus_dep eq comment.cus_dep && login.cus_position eq comment.cus_position}">
                                        <form method="get" action="/comments_delete.do">
                                            <!-- 링크용 uri 정보 -->
                                            <input type="hidden" id="uri_cmt_delete" name="uri_cmt_delete"
                                                   value="${uri}"/>
                                            <!-- 댓글삭제 -->
                                            <input type="hidden" id="cmt_num_inform_delete" name="cmt_num_inform_delete"
                                                   value="${comment.cmt_num}"/>

                                            <input type="submit" class="btn btn-comment_delete" value="삭제"
                                                   style="float:right"/>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="submit" class="btn btn-comment_delete" value=""
                                                       style="float:right"/>
                                            </c:otherwise>
                                            </c:choose>
                                        </form>
                                    </div>



                                </div>  <!-- 상단영역=삭제 링크 까지 종료 -->
                            </div>
                        </div>
                        <!-- 첫 댓글 종료 -->


                        <!-- 댓글 입력창에 빈값을 입력하면, 알림창 뜨면서 입력 막음 -->
                        <script>
                            function CheckInputNull3<%=dis_id1%>() {
                                if (insert_rcmt_cnt<%=dis_id1%>.rcmt_cnt.value == "") {
                                    alert("댓글에 값을 입력하여 주십시오.");
                                    return false;
                                }
                            }
                        </script>


                        <!-- 대댓글 달기 열기/닫기-->
                        <details>
                            <summary>[대댓글 달기]</summary>
                            <div class="add_re_comment">
                                <form name="insert_rcmt_cnt<%=dis_id1%>" method="post" action="/re_comments_insert.do"
                                      onsubmit="return CheckInputNull3<%=dis_id1%>()">
                                    <!-- 대댓글 입력공간 -->
                                    <td>
                                        <!-- 링크용 uri 정보 -->
                                        <input type="hidden" id="uri_rcmt_insert" name="uri_rcmt_insert"
                                               value="${uri}"/>
                                        <!-- 대댓글작성 -->
                                        <input type="hidden" id="com_name_insert_r" name="com_name_insert_r" value="${login.com_name}"/>
                                        <input type="hidden" id="cus_name_insert_r" name="cus_name_insert_r" value="${login.cus_name}"/>
                                        <input type="hidden" id="cus_dep_insert_r" name="cus_dep_insert_r" value="${login.cus_dep}"/>
                                        <input type="hidden" id="cus_position_insert_r" name="cus_position_insert_r" value="${login.cus_position}"/>

                                        <input type="hidden" id="cmt_num_inform" name="cmt_num_inform"
                                               value="${comment.cmt_num}"/>
                                        <input type="text" id="rcmt_cnt" name="rcmt_cnt" class="form-control"
                                               style="width:93%;float:left" placeholder="댓글 입력"/>


                                        <input type="submit" class="btn btn-cmt-delete" value="등록" style="float:right"/>
                                    </td>
                                </form>
                            </div>
                        </details>


                        <br>
                        <!-- 댓글 나누는 선 -->
                        <hr>

                        <c:forEach items="${Re_CommentList}" var="recomment">
                            <c:if test="${recomment.cmt_num == comment.cmt_num}">

                                <script type="text/javascript">

                                    function d<%=dis_id4%>() {
                                        if ($('#d<%=dis_id4%>').css('display') == 'none') {
                                            $('#d<%=dis_id4%>').show();
                                        } else {
                                            $('#d<%=dis_id4%>').hide();
                                        }
                                    }

                                    function c<%=dis_id3%>() {
                                        if ($('#c<%=dis_id3%>').css('display') == 'none') {
                                            $('#c<%=dis_id3%>').show();
                                        } else {
                                            $('#c<%=dis_id3%>').hide();
                                        }
                                    }

                                    <!-- 댓글 입력창에 빈값을 입력하면, 알림창 뜨면서 입력 막음 -->
                                    function CheckInputNull4<%=dis_id4%>() {
                                        if (update_rcmt_cnt<%=dis_id4%>.rcmt_update.value == "") {
                                            alert("댓글에 값을 입력하여 주십시오.");
                                            return false;
                                        }
                                    }
                                </script>


                                <!-- 대댓글 시작부분 -->
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
                                    ${recomment.com_name}/${recomment.cus_name}/${recomment.cus_dep}/${recomment.cus_position} / ${recomment.cmt_num}/${recomment.cus_num}
                                </span>
                                            </b>
                                            <span class="font-11 text-muted">
                                <span class="clock-info">
                                    <i class="fa fa-clock-o">
                                    </i>
                                    ${recomment.rcmt_date}
                                </span>
                            </span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



                                            <div id="d<%=dis_id4%>" style="display: none;">
                                                <form name="update_rcmt_cnt<%=dis_id4%>" method="post"
                                                      action="/re_comments_update.do"
                                                      onsubmit="return CheckInputNull4<%=dis_id4%>()">
                                                    <!-- 링크용 uri 정보 -->
                                                    <input type="hidden" id="uri_rcmt_update" name="uri_rcmt_update"
                                                           value="${uri}"/>
                                                    <!-- 대댓글수정 -->
                                                    <input type="hidden" id="rcmt_num_inform_update"
                                                           name="rcmt_num_inform_update" value="${recomment.rcmt_num}"/>
                                                    <input type="text" id="rcmt_update" name="rcmt_update"
                                                           class="form-control" style="width:93%;float:left"
                                                           placeholder="${recomment.rcmt_cnt}"/>
                                                    <input type="submit" class="btn btn-comment_update" value="수정"
                                                           style="float:right"/>
                                                </form>

                                                <form method="get" action="javascript:c<%=dis_id3%>();d<%=dis_id4%>();">
                                                    <input type="submit" class="btn btn-comment_delete" value="취소"
                                                           style="float:right"/>
                                                </form>
                                            </div>



                                            <div id="c<%=dis_id3%>" style="display: contents;">

                                                <c:choose>
                                                    <c:when test="${login.com_name eq recomment.com_name && login.cus_name eq recomment.cus_name && login.cus_dep eq recomment.cus_dep && login.cus_position eq recomment.cus_position}">
                                                        <form method="get" action="javascript:c<%=dis_id3%>();d<%=dis_id4%>();">
                                                            <input type="submit" class="btn btn-comment_delete" value="수정"
                                                                   style="float:right"/>
                                                        </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <br><br>
                                                        <input type="submit" class="btn btn-comment_delete" value=""
                                                               style="float:right"/>
                                                    </c:otherwise>
                                                </c:choose>

                                                <!-- 댓글 본문 작성 부분 시작 -->
                                                <div class="media-content-r">
                                                        ${recomment.rcmt_cnt}
                                                </div>


                                                <c:choose>
                                                <c:when test="${login.com_name eq recomment.com_name && login.cus_name eq recomment.cus_name && login.cus_dep eq recomment.cus_dep && login.cus_position eq recomment.cus_position}">
                                                <form method="get" action="/re_comments_delete.do">
                                                    <!-- 링크용 uri 정보 -->
                                                    <input type="hidden" id="uri_rcmt_delete" name="uri_rcmt_delete"
                                                           value="${uri}"/>
                                                    <!-- 대댓글삭제 -->
                                                    <input type="hidden" id="rcmt_num_inform_delete"
                                                           name="rcmt_num_inform_delete" value="${recomment.rcmt_num}"/>


                                                    <input type="submit" class="btn btn-rcmt-delete" value="삭제"
                                                           style="float:right"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="submit" class="btn btn-rcmt-delete" value=""
                                                               style="float:right"/>
                                                    </c:otherwise>
                                                    </c:choose>
                                                </form>
                                            </div>
                                        </div>  <!-- 상단영역=삭제 링크 까지 종료 -->



                                    </div>
                                </div>
                                <!-- 대댓글 종료 -->


                                </section> <!-- section 종료 = 댓글영역 끝 -->

                                <br>
                                <hr>
                                <!-- 댓글 나누는 선 -->

                                <%dis_id3++;%>
                                <%dis_id4++;%>


                            </c:if>
                        </c:forEach>

                        <%dis_id1++;%>
                        <%dis_id2++;%>

                    </c:if>
                </c:forEach>

            </details>  <!-- end of, 댓글 펴기/접기 -->


        </div>

    </div>
    <!-- /.container-fluid -->


</div>
<!-- End of Main Content -->
