<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="list-group">
    <div class="list-group-item small">
        <div class="row text-center align-items-center small text-muted">
            <div class="col-1 small ">글번호</div>
            <div class="col-1 small ">카테고리</div>
            <div class="col text-start">제목</div>
            <div class="col-1 small ">작성일</div>
            <div class="col-1 small">조회수</div>
        </div>
    </div>

    <!-- 게시글 목록 글번호 순서대로 -->
    <!-- 전체 글수 - 현재 페이지 시작 인덱스 빼서 계산한 첫 글번호를 startcno변수에 저장.  -->
    <c:set var="startcno" value="${pageDto.total - pageDto.cri.offset}"/>
    <c:forEach items="${boards}" var="board" varStatus="status">
        <a href="view?bno=${board.bno}&${pageDto.cri.qs2}" class="list-group-item list-group-item-action">
            <div class="row text-center align-items-center small text-muted">
                <div class="col-1 small ">${startcno - status.index}</div>
                <div class="col-1">${board.cno}</div>
                <div class="col text-start fw-bold text-black ">
                        <%-- <c:if test="${board.bno != board.grp}"> --%>
                        <%-- <i class="fa-solid fa-reply text-secondary" style="transform:rotate(180deg); margin-left: ${(board.depth-2) *14}px"></i> --%>
                        <%-- </c:if> --%>
                        ${board.title}
                    <span class="small text-danger fw--bold"> ${board.replyCnt}</span>
                    <c:if test="${board.attachCnt > 0}">
                        <i class="fa-solid fa-paperclip text-muted"></i>
                    </c:if>
                </div>
                <div class="col-1 small">
		     				<span class="small">
				                <fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
				                <fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd"/>
			            	</span>
                </div>
                <div class="col-1 small"><span class="small">${board.cnt}</span></div>
            </div>
        </a>
    </c:forEach>
</div>

 