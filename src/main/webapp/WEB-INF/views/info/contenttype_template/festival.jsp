<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<div class="container my-4">
		 <c:if test="${not empty api.firstImage}">
           <div style="max-width: 600px; margin: 0 auto;">
            <img src="${api.firstImage}" class="img-fluid mt-2" alt="축제 이미지">
           	<span class="fw-bold">대표 이미지</span><br>
           </div>
        </c:if>
	  <div class="row">
	    <!-- 왼쪽 컬럼 -->
	    <div class="col-md-6">
	      <ul class="list-group list-group-flush">
	
	        <c:if test="${not empty api.title}">
	          <li class="list-group-item"><span class="fw-bold">행사명</span> : ${api.title}</li>
	        </c:if>
	
	        <c:if test="${not empty api.tel}">
	          <li class="list-group-item"><span class="fw-bold">문의처</span> : ${api.tel}</li>
	        </c:if>
	
	        <c:if test="${not empty api.addr1}">
	          <li class="list-group-item"><span class="fw-bold">주소</span> : ${api.addr1}
	            <c:if test="${not empty api.addr2}"> ${api.addr2}</c:if>
	          </li>
	        </c:if>
	      </ul>
	    </div>
	
	    <!-- 오른쪽 컬럼 -->
	    <div class="col-md-6">
	      <ul class="list-group list-group-flush">
	
	        <c:if test="${not empty api.eventStartDate}">
	          <li class="list-group-item"><span class="fw-bold">시작일</span> : ${api.eventStartDate}</li>
	        </c:if>
	
	        <c:if test="${not empty api.eventEndDate}">
	          <li class="list-group-item"><span class="fw-bold">종료일</span> : ${api.eventEndDate}</li>
	        </c:if>
	        <c:if test="${not empty api.progressType}">
	          <li class="list-group-item"><span class="fw-bold">진행 형태</span> : ${api.progressType}</li>
	        </c:if>
	        
	        <c:if test="${not empty api.festivalType}">
	          <li class="list-group-item"><span class="fw-bold">축제 유형</span> : ${api.festivalType}</li>
	        </c:if>
	      </ul>
	    </div>
	  </div>
	</div>