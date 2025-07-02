<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container p-0">
	    <main>
	        <div class="clearfix py-0 row">
	        <div class="col-2">
	        	<select class="form-select form-select-sm">
		       		 	<option>10개씩 보기</option>
		       		 	<option>20개씩 보기</option>
		       		 	<option>50개씩 보기</option>
		       		 	<option>100개씩 보기</option>
	       		 	</select>
	        	</div>
	         	<form class="col input-group search-form">
		       		 <select class="form-select form-select-sm" name="type">
		       		 	<option value="T">제목</option>
		       		 	<option value="C">내용</option>
		       		 	<option value="I">작성자</option>
		       		 	<option value="TC">제목+내용</option>
		       		 	<option value="TI">제목+작성자</option>
		       		 	<option value="CI">내용+작성자</option>
		       		 	<option value="TCI">제목+내용+작성자</option>
	       		 	</select>
	       		 	<input type="text" class="form-control form-control-sm w-75" placeholder="Search" name="keyword">
	       		 	<input type="hidden" name="page" value="1">
	       		 	<input type="hidden" name="amount" value="${pageDto.cri.amount}">
	       		 	<input type="hidden" name="cno" value="${pageDto.cri.cno}">
 					<button class="btn btn-success btn-sm" type="submit">Go</button>
     		 	</form>
     		 	<script>
     		 	$(".search-form").submit(function() {
     		 		event.preventDefault();
     		 		const keyword = this.keyword.value;
     		 		console.log(keyword);
     		 		console.log(encodeURIComponent(keyword));
     		 		
     		 		this.keyword.value = encodeURIComponent(this.keyword.value)
     		 		this.submit();
     		 	});
     		 	</script>
     		 	
     		 	<div class="col-2">
	            	<a href="write?${pageDto.cri.qs2}" class="btn btn-primary btn-sm float-end"><i class="fa-solid fa-pen-fancy"></i> 글쓰기</a>
           		</div>
	        </div>
	
<%@ include file="../common/footer.jsp" %>
</body>
</html>