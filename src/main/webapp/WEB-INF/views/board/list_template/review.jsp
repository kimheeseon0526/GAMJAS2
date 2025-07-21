<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="list-group">
    <!-- 헤더 -->
    <div class="list-group-item small bg-light fw-bold">
        <div class="row text-center align-items-center small text-muted">
            <div class="col-1">글번호</div>
            <div class="col-1">카테고리</div>
            <div class="col text-start">제목</div>
            <div class="col-1">작성일</div>
            <div class="col-1">조회수</div>
        </div>
    </div>

    <!-- 게시글 목록 -->
    <c:set var="startcno" value="${pageDto.total - pageDto.cri.offset}"/>
    <c:forEach items="${boards}" var="board" varStatus="status">
        <a href="view?bno=${board.bno}&${pageDto.cri.qs2}" class="list-group-item list-group-item-action">
            <div class="row text-center align-items-center small text-muted">
                <div class="col-1 small ">${startcno - status.index}</div>
                <div class="col-1">${board.cno}</div>
                <div class="col text-start text-black fw-semibold">
                        ${board.title}
                    <span class="small text-danger">${board.replyCnt}</span>
                    <c:if test="${board.attachCnt > 0}">
                        <i class="fa-solid fa-paperclip text-muted"></i>
                    </c:if>
                </div>
                <div class="col-1">
                    <fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
                    <fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd"/>
                </div>
                <div class="col-1">${board.cnt}</div>
            </div>
        </a>
    </c:forEach>
</div>
