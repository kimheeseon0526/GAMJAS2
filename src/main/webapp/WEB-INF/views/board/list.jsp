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
        <!-- 검색/정렬 폼 -->
        <div class="clearfix py-0 row mb-3">
            <div class="col-2">
                <select class="form-select form-select-sm border border-secondary-subtle text-dark">
                    <option>10개씩 보기</option>
                    <option>20개씩 보기</option>
                    <option>50개씩 보기</option>
                    <option>100개씩 보기</option>
                </select>
            </div>
            <form class="col input-group search-form">
                <select class="form-select form-select-sm border border-secondary-subtle text-dark" name="type">
                    <option value="T">제목</option>
                    <option value="C">내용</option>
                    <option value="I">작성자</option>
                    <option value="TC">제목+내용</option>
                    <option value="TI">제목+작성자</option>
                    <option value="CI">내용+작성자</option>
                    <option value="TCI">제목+내용+작성자</option>
                </select>
                <input type="text" class="form-control form-control-sm w-75 border-secondary-subtle" placeholder="Search" name="keyword">
                <input type="hidden" name="page" value="1">
                <input type="hidden" name="amount" value="${pageDto.cri.amount}">
                <input type="hidden" name="cno" value="${pageDto.cri.cno}">
                <button class="btn btn-dark btn-sm px-3">검색</button>
            </form>
        </div>

        <!-- 게시판 테이블 -->
        <div class="table-responsive">
            <table class="table table-bordered align-middle text-center small" style="border-color: #DADADA;">
                <thead style="background-color: #F2F4F3; color: #333;">
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
                        <td><a href="#" class="text-decoration-none fw-bold" style="color:#4C6B4C;">ㅇㅇㅇ</a></td>
                        <td style="color:#4C6B4C;">김ㅇㅇ</td>
                        <td>2025-00-00</td>
                        <td>123</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="#" class="text-decoration-none" style="color:#4C6B4C;">미션후기</a></td>
                        <td style="color:#4C6B4C;">Vic**ria</td>
                        <td>2025-00-00</td>
                        <td>56</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><a href="#" class="text-decoration-none" style="color:#4C6B4C;">good</a></td>
                        <td style="color:#4C6B4C;">Gene**sis</td>
                        <td>2025-00-00</td>
                        <td>244</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 글작성 버튼 + 페이지네이션 -->
        <div class="position-relative mt-3">
		    <!-- 페이지네이션: 가운데 정렬 -->
		    <div class="pagination small d-flex justify-content-center">
		        <a href="#" class="mx-1 text-dark">1</a>
		        <a href="#" class="mx-1">2</a>
		        <a href="#" class="mx-1">3</a>
		        <a href="#" class="mx-1">4</a>
		        <a href="#" class="mx-1">5</a>
		        <a href="#" class="mx-1 text-decoration-underline">다음 &gt;</a>
		    </div>
		
		    <!-- 글작성 버튼: 오른쪽 위에 고정 -->
		    <a href="${cp}/board/write"
		       class="btn btn-sm position-absolute end-0 top-0"
		       style="background-color:#6A8D73; color:#fff;">
		        <i class="fa-solid fa-pen"></i> 글작성
		    </a>
		</div>

    </main>
</div>

	
<%@ include file="../common/footer.jsp" %>
</body>
</html>