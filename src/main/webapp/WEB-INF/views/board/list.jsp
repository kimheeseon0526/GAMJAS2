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
<div class="container p-0 my-4">
    <main>
        <!-- 정렬 및 검색 -->
        <div class="clearfix py-0 row mb-3">
            <div class="col-2">
                <select class="form-select form-select-sm border-success-subtle text-success">
                    <option>10개씩 보기</option>
                    <option>20개씩 보기</option>
                    <option>50개씩 보기</option>
                    <option>100개씩 보기</option>
                </select>
            </div>
            <form class="col input-group search-form">
                <select class="form-select form-select-sm border-success-subtle text-success" name="type">
                    <option value="T">제목</option>
                    <option value="C">내용</option>
                    <option value="I">작성자</option>
                    <option value="TC">제목+내용</option>
                    <option value="TI">제목+작성자</option>
                    <option value="CI">내용+작성자</option>
                    <option value="TCI">제목+내용+작성자</option>
                </select>
                <input type="text" class="form-control form-control-sm w-75 border-success-subtle" placeholder="Search" name="keyword">
                <input type="hidden" name="page" value="1">
                <input type="hidden" name="amount" value="${pageDto.cri.amount}">
                <input type="hidden" name="cno" value="${pageDto.cri.cno}">
                <button class="btn btn-success btn-sm">검색</button>
            </form>
        </div>

        <!-- 게시판 테이블 -->
        <div class="table-responsive">
            <table class="table table-bordered table-hover align-middle text-center border-success-subtle small">
                <thead class="table-success text-dark">
                    <tr>
                        <th>No</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td><a href="#" class="text-decoration-none text-success fw-bold">ㅇㅇㅇ</a></td>
                        <td class="text-success">김ㅇㅇ</td>
                        <td>2025-00-00</td>
                        <td>123</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="#" class="text-decoration-none text-success">미션후기</a></td>
                        <td class="text-success">Vic**ria</td>
                        <td>2025-00-00</td>
                        <td>56</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><a href="#" class="text-decoration-none text-success">good</a></td>
                        <td class="text-success">Gene**sis</td>
                        <td>2025-00-00</td>
                        <td>244</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 글작성 버튼 및 페이징 -->
        <div class="d-flex justify-content-between align-items-center mt-3">
            <a href="write.jsp" class="btn btn-outline-success btn-sm px-4"><i class="fa-solid fa-pen"></i> 글작성</a>
            <div class="pagination small">
                <a href="#" class="mx-1 text-success">1</a>
                <a href="#" class="mx-1">2</a>
                <a href="#" class="mx-1">3</a>
                <a href="#" class="mx-1">4</a>
                <a href="#" class="mx-1">5</a>
                <a href="#" class="mx-1 text-decoration-underline">다음 &gt;</a>
            </div>
        </div>
    </main>
</div>

	
<%@ include file="../common/footer.jsp" %>
</body>
</html>