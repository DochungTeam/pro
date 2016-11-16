<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>

<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				var obj = [];
				var ctx = getContextPath();

				nhn.husky.EZCreator.createInIFrame({
					oAppRef : obj,
					elPlaceHolder : "bcontent",
					sSkinURI : "/resources/editor/SmartEditor2Skin.html",
					htParams : {
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseToolbar : true,
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true,
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true,
					}
				});
				$("#savebutton").click(function() {
					obj.getById["bcontent"].exec("UPDATE_CONTENTS_FIELD", []);
					$("#frm").submit();
				})

				function getContextPath() {
					return window.location.pathname.substring(0,
							window.location.pathname.indexOf("/", 2));
				}
			});
</script>

<jsp:include page="../include/script.jsp" />

<c:if test="${empty loginMember.mid }">
	<script>
		alert("바르지 않은 접근입니다.");
		location.replace("/member/login");
	</script>
</c:if>

</head>

<body>
	<div id="page">
		<jsp:include page="../include/header.jsp" />
		<div id="main">
			<div class="wrapper cf">



				<form role="form" method="post" id="frm">
					<div class="box-body">
						<div class="form-group">
							<input type="text" name="btitle" class="form-control"
								placeholder="제목을 입력하세요..."> <input type="hidden"
								name="bwriter" value="${loginMember.mid }" readonly="readonly">
							<c:if test="${loginMember.mmanyn == 0}">
								<input type="checkbox" name="bboard" id="bboard" value="1" />
								<label for="bboard">공지사항</label>
							</c:if>
						</div>
						<div>
							<div>
								<textarea id="bcontent" rows="3" name="bcontent"
									placeholder="내용을 입력하세요..."></textarea>
							</div>
						</div>
					</div>

					<div class="box-footer">
						<button type="submit" id="savebutton">등록</button>
						<input type="button" class="cancel" value="취소" />
					</div>
				</form>

			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />

</body>