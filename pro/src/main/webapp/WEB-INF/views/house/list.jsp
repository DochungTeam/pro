<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/script.jsp"%>
<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->


		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
			<button><a href='/house/insertHouse'>맛집 등록</a></button>
				<div class="box-header with-border">
					<h3 class="box-title">맛집 리스트</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 20px">no</th>
							<th style="width: 100px">맛집이름</th>
							<th style="width: 70px">맛집테마</th>
							<th style="width: 100px">등록 날짜</th>
							<th style="width: 100px">조회</th>
						</tr>

						<c:forEach items="${list}" var="houseDto">

							<tr>
								<td>${houseDto.hno}</td>
								<td><a
									href='/house/readHouse${pageMaker.makeSearch(pageMaker.cri.page) }&hno=${houseDto.hno}'>
										${houseDto.hnm} <strong>[ ${houseDto.hreplycnt }]</strong> 
										</a></td>
								<td>${houseDto.hkind}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${houseDto.hregdate}" /></td>
								<td><span class="badge bg-red">${houseDto.hviewcnt }</span></td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>

<%@include file="../include/footer.jsp"%>
