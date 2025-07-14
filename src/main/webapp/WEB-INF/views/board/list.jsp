<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/head.jsp" %>
    <%-- <style>
       .search-container {
         position: relative;
         height: 38px;
       }
       .search-center {
         position: absolute;
         left: 50%;
         transform: translateX(-50%);
         display: flex;
         width: 376px;
         align-items: center;
       }
       .search-button {
         white-space: nowrap;
         padding: 0.25rem 0.6rem;
         line-height: 1.2;}
     </style>--%>
</head>
<body class="bg-light">
<%@ include file="../common/nav.jsp" %>
<div class="container my-3">
    <!-- 탭 메뉴 -->
    <form>
        <c:if test="${pageDto.cri.cno ==1 or pageDto.cri.cno ==2 or pageDto.cri.cno == 3}">
            <ul class="nav nav-tabs mb-2 justify-content-center gap-5" id="infoTabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <a href="${cp}/board/list?cno=1" class="nav-link px-4 ${c.CViewType == 'FREE' ? 'active' : ''}"
                       type="button" role="tab">자유게시판</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a href="${cp}/board/list?cno=2" class="nav-link px-4 ${c.CViewType == 'REVIEW'  ? 'active' : ''}"
                       type="button" role="tab">생생후기</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a href="${cp}/board/list?cno=3" class="nav-link px-4 ${c.CViewType == 'NOTICE'  ? 'active' : ''}"
                       type="button" role="tab">공지사항</a>
                </li>
            </ul>
        </c:if>
    </form>
    <form>
        <c:if test="${pageDto.cri.cno ==5}">
            <ul class="nav nav-tabs mb-2 justify-content-center gap-5" id="infoTabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <a href="${cp}/ticket/info" class="nav-link px-4 ${c.CViewType == 'QNA' ? 'active' : ''}"
                       type="button" role="tab">소개 & 이용안내</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a href="${cp}/board/list?cno=5" class="nav-link px-4 ${c.CViewType == 'NOTICE'  ? 'active' : ''}"
                       type="button" role="tab">당첨자 발표</a>
                </li>
            </ul>
        </c:if>
    </form>
</div>
<div class="container p-0 mt-3 pt-3">
    <main>
        <!-- 검색 영역 -->
        <div class="clearfix py-0 row align-items-center mb-3">
            <div class="col-2">
                <select class="form-select form-select-sm border-secondary-subtle">
                    <option>10개씩 보기</option>
                    <option>20개씩 보기</option>
                    <option>50개씩 보기</option>
                    <option>100개씩 보기</option>
                </select>
            </div>
            <form class="col input-group search-form">
                <select class="form-select form-select-sm border-secondary-subtle" name="type">
                    <option value="T">제목</option>
                    <option value="C">내용</option>
                    <option value="I">작성자</option>
                    <option value="TC">제목+내용</option>
                    <option value="TI">제목+작성자</option>
                    <option value="CI">내용+작성자</option>
                    <option value="TCI">제목+내용+작성자</option>
                </select>

                <input type="text" class="form-control form-control-sm w-75 border-secondary-subtle"
                       placeholder="Search" name="keyword">
                <input type="hidden" name="page" value="1">
                <input type="hidden" name="amount" value="${pageDto.cri.amount}">
                <input type="hidden" name="cno" value="${pageDto.cri.cno}">

                <button class="btn btn-outline-secondary btn-sm" type="submit">검색</button>
            </form>

            <%-- <p>cViewType: ${c.cViewType}</p> --%>
            <script>
                $(".search-form").submit(function () {
                    event.preventDefault();

                    /*const amount =
                    ${".form-select"}.val();
                $(this).find("input[name='amount']").val(amount);*/

                    this.keyword.value = encodeURIComponent(this.keyword.value)
                    this.submit();
                });
            </script>
            <div class="col-2">
              <%--  <c:if test="${not empty loginMember}">
                    <c:if test="${board.getCViewType() == 'REVIEW' or board.getCViewType() == 'FREE' or
                                    (board.getCViewType() == 'QNA' and loginMember.isAdmin == '1') or
                                    (board.getCViewType() == 'NOTICE' and loginMember.isAdmin == '1')}">--%>
                        <a href="write?${pageDto.cri.qs2}" class="btn btn-outline-success btn-sm float-end">
                            <i class="fa-solid fa-pen-fancy"></i> 글쓰기
                        </a>
                    <%--</c:if>
                </c:if>--%>
            </div>
        </div>

        <!-- 게시판 템플릿 (유지) -->
        <%-- <jsp:include page="list_template/free.jsp" /> --%>
        <%-- <jsp:include page="list_template/free.jsp" /> --%>

        <c:forEach items="${cate}" var="c">
            <c:if test="${c.cno == pageDto.cri.cno}">

                <c:choose>
                    <c:when test="${c.getCViewType() == 'FREE'}">
                        <jsp:include page="list_template/free.jsp"/>
                    </c:when>
                    <c:when test="${c.getCViewType() == 'REVIEW'}">
                        <jsp:include page="list_template/review.jsp"/>
                    </c:when>
                    <c:when test="${c.getCViewType() == 'NOTICE'}">
                        <c:choose>
                            <c:when test="${c.cno == 3}">
                                <jsp:include page="list_template/notice.jsp"/>
                            </c:when>
                            <c:when test="${c.cno == 5}">
                                <jsp:include page="list_template/winnotice.jsp"/>
                            </c:when>
                        </c:choose>
                    </c:when>
                    <c:when test="${c.getCViewType() == 'QNA'}">
                        <jsp:include page="list_template/qna.jsp"/>
                    </c:when>
                </c:choose>
            </c:if>
        </c:forEach>

        <!-- 페이지네이션 -->
        <ul class="pagination pagination-sm justify-content-center mt-4">
            <c:if test="${pageDto.doubleLeft}">
                <li class="page-item">
                    <a class="page-link border-0 text-success bg-transparent" href="list?page=1&${pageDto.cri.qs}"
                       title="맨앞으로">
                        <i class="fa-solid fa-angles-left"></i>
                    </a>
                </li>
            </c:if>

            <c:if test="${pageDto.left}">
                <li class="page-item">
                    <a class="page-link border-0 text-success bg-transparent"
                       href="list?page=${pageDto.start - 1}&${pageDto.cri.qs}" title="이전">
                        <i class="fa-solid fa-angle-left"></i>
                    </a>
                </li>
            </c:if>

            <c:forEach begin="${pageDto.start}" end="${pageDto.end}" var="i">
                <li class="page-item ${pageDto.cri.page == i ? 'active' : ''}">
                    <a class="page-link ${pageDto.cri.page == i ? 'bg-success border-success text-white' : 'text-dark border-0'}"
                       href="list?page=${i}&${pageDto.cri.qs}">
                            ${i}
                    </a>
                </li>
            </c:forEach>

            <c:if test="${pageDto.right}">
                <li class="page-item">
                    <a class="page-link border-0 text-success bg-transparent"
                       href="list?page=${pageDto.end + 1}&${pageDto.cri.qs}" title="다음">
                        <i class="fa-solid fa-angle-right"></i>
                    </a>
                </li>
            </c:if>

            <c:if test="${pageDto.doubleRight}">
                <li class="page-item">
                    <a class="page-link border-0 text-success bg-transparent"
                       href="list?page=${pageDto.realEnd}&${pageDto.cri.qs}" title="맨끝으로">
                        <i class="fa-solid fa-angles-right"></i>
                    </a>
                </li>
            </c:if>
        </ul>


    </main>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>