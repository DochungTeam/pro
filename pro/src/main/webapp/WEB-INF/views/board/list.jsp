<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>


<jsp:include page="../include/script.jsp" />
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font: 14px/1.4 Georgia, Serif;
}

#page-wrap {
	margin: 50px;
}

p {
	margin: 20px 0;
}

/* 
      Generic Styling, for Desktops/Laptops 
      */
table {
	width: 100%;
	border-collapse: collapse;
}
/* Zebra striping */
tr:nth-of-type(odd) {
	background: #eee;
}

th {
	background: #333;
	color: white;
	font-weight: bold;
}

td, th {
	padding: 6px;
	border: 1px solid #ccc;
	text-align: center;
}

@media only screen and (max-width: 760px) , ( min-device-width : 768px)
	and (max-device-width: 1024px) {
	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr {
		display: block;
	}

	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr {
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	tr {
		border: 1px solid #ccc;
	}
	td {
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee;
		position: relative;
		padding-left: 50%;
	}
	td:before {
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%;
		padding-right: 10px;
		white-space: nowrap;
	}

	/*
      Label the data
      */
	td:nth-of-type(1):before {
		content: "First Name";
	}
	td:nth-of-type(2):before {
		content: "Last Name";
	}
	td:nth-of-type(3):before {
		content: "Job Title";
	}
	td:nth-of-type(4):before {
		content: "Favorite Color";
	}
	td:nth-of-type(5):before {
		content: "Wars of Trek?";
	}
	td:nth-of-type(6):before {
		content: "Porn Name";
	}
	td:nth-of-type(7):before {
		content: "Date of Birth";
	}
	td:nth-of-type(8):before {
		content: "Dream Vacation City";
	}
	td:nth-of-type(9):before {
		content: "GPA";
	}
	td:nth-of-type(10):before {
		content: "Arbitrary Data";
	}
}

/* Smartphones (portrait and landscape) ----------- */
@media only screen and (min-device-width : 320px) and (max-device-width
	: 480px) {
	body {
		padding: 0;
		margin: 0;
		width: 320px;
	}
}

/* iPads (portrait and landscape) ----------- */
@media only screen and (min-device-width: 768px) and (max-device-width:
	1024px) {
	body {
		width: 495px;
	}
}
</style>


<body>
	<div id="page">
		<jsp:include page="../include/header.jsp" />
		<div id="main">
		<br>
			<div id="start" class="wrapper cf">

				<table>

					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${notice }" var="boardDto">
							<tr class="noticeTr">
								<td class="noticeTd">${boardDto.bno }</td>
								<td class="noticeTd"><a
									href="/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardDto.bno}">${boardDto.btitle }
										<strong>[ ${boardDto.rcount } ]</strong>
								</a></td>
								<td class="noticeTd">${boardDto.bwriter }</td>
								<td class="noticeTd"><fmt:formatDate pattern="yyyy-MM-dd"
										value="${boardDto.bwritedt }" /></td>
								<td class="noticeTd"><span>${boardDto.bcount }</span></td>
							</tr>
						</c:forEach>
					</tbody>

					<tr>
						<td colspan="5"><hr></td>
					</tr>
					<c:forEach items="${list }" var="boardDto">

						<tr>
							<td>${boardDto.bno }</td>
							<td><a
								href="/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardDto.bno}">${boardDto.btitle }
									<strong>[ ${boardDto.rcount } ]</strong>
							</a></td>
							<td>${boardDto.bwriter }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${boardDto.bwritedt }" /></td>
							<td><span>${boardDto.bcount }</span></td>
						</tr>

					</c:forEach>

				</table>
				<br>
				<div>
					<button type="submit" id="newBtn" class="small button"
						style="float: right;">글쓰기</button>
				</div>
				<br>
				<div class="text-center" style="text-align: center;">

					<c:if test="${pageMaker.prev }">
						<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<a href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a>
					</c:if>

				</div>

				<form id="jobForm">
					<input type="hidden" name="page"
						value="${pageMaker.cri.perPageNum }"> <input type="hidden"
						name="perPageNum" value="${pageMaker.cri.perPageNum }">
				</form>
				<br>
				<div style="text-align: center;">

					<select id="selectSearch" name="searchType" class="d1SearchType">
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':'' }"/>>제목
						</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>내용
						</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':'' }"/>>작성자
						</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':'' }"/>>제목
							또는 내용</option>
					</select> <input type="text" name="keyword" id="keywordInput"
						value="${cri.keyword }" class="d1">

					<button id="searchBtn" class="small button">검색</button>
				</div>
				<br>
				<br>
				<script>
					$(document)
							.ready(
									function() {
										var result = '${msg}';

										if (result == 'SUCCESS') {
											alert("처리가 완료되었습니다.");
										}

										$('#searchBtn')
												.on(
														"click",
														function(event) {
															self.location = "list"
																	+ '${pageMaker.makeQuery(1)}'
																	+ "&searchType="
																	+ $(
																			"#selectSearch option:selected")
																			.val()
																	+ "&keyword="
																	+ $(
																			'#keywordInput')
																			.val();
														});

										$('#newBtn')
												.on(
														"click",
														function(event) {
															self.location = "/board/register ";
														});
									});
				</script>

			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>