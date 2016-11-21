<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../include/script.jsp"%>

<script>
$(function(){
	
	var myImage = "/resources/img/dummies/slides/";
	var imageArray = ["01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg", "06.jpg", "07.jpg", "08.jpg"];
	var leftIndex = 7;
	var centerIndex = 0;
	var rightIndex = 1;
	
	$(".arrow_left").on("click",function(){
		
		$("#leftHeadImg").hide("slide",200);		
		leftIndex++;
		if(leftIndex>=imageArray.length){
			leftIndex=0;
		}
		$("#leftHeadImg").attr("src",myImage+imageArray[leftIndex]);
		$("#leftHeadImg").show("slide",200);		
		
		centerIndex++;
		if(centerIndex>=imageArray.length){
			centerIndex=0;
		}
		$("#centerHeadImg").attr("src",myImage+imageArray[centerIndex]);
		
		rightIndex++;
		if(rightIndex>=imageArray.length){
			rightIndex=0;
		}
		$("#rightHeadImg").attr("src",myImage+imageArray[rightIndex]);
	});
	
	
});
</script>


<div id="start" class="slider">
	<div class="leftDiv">
		<img id="leftHeadImg" src="/resources/img/dummies/slides/08.jpg" title="" alt="alt"/>
	</div>
	<div class="centerDiv">
		<img id="centerHeadImg" src="/resources/img/dummies/slides/01.jpg" title="" alt="alt"/>
	</div>
	<div class="rightDiv">
		<img id="rightHeadImg" src="/resources/img/dummies/slides/02.jpg" title="" alt="alt"/>
	</div>
</div>
<div class="arrow">
	<div class="arrow_right">
		<img src="/resources/img/dummies/slides/arrow_left.png" title="" alt="alt"/>
	</div>
	<div class="arrow_left">
		<img src="/resources/img/dummies/slides/arrow_right.png" title="" alt="alt"/>
	</div>
</div>

	<!-- slider content -->
	<!-- 
	<div class="main-slider-content" style="margin: auto;">
		<div class="sliders-wrapper" style="width: 940px;">
			<ul class="sliders-wrap-inner" style="left: 0px; width: 6580px;">
				<li style="width: 940px;"><img
					src="/resources/img/dummies/slides/01.jpg" title="" alt="alt"
					class="piece" /></li>

				<li style="width: 940px;"><img
					src="/resources/img/dummies/slides/02.jpg" title="" alt="alt"
					class="piece" /></li>

				<li style="width: 940px;"><img
					src="/resources/img/dummies/slides/03.jpg" title="" alt="alt"
					class="piece" /></li>

				<li style="width: 940px;"><img
					src="/resources/img/dummies/slides/04.jpg" title="" alt="alt"
					class="piece" /></li>

				<li style="width: 940px;"><img
					src="/resources/img/dummies/slides/05.jpg" title="" alt="alt"
					class="piece" /></li>

				<li style="width: 940px;"><img
					src="/resources/img/dummies/slides/06.jpg" title="" alt="alt"
					class="piece" /></li>

				<li style="width: 940px;"><img
					src="/resources/img/dummies/slides/07.jpg" title="" alt="alt"
					class="piece" /></li>
			</ul>
		</div>
	</div>
	-->
	<!-- ENDS SLIDER -->
