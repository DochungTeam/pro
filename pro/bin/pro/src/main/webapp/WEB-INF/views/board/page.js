	$(".pagination li a").on("click", function(event){
		
		event.preventDefault();
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "/board/list").attr("method", "get");
		jobForm.submit();
	});
	