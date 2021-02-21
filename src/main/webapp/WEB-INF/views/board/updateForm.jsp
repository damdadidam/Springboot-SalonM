<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<section>
<div class="container">
	<form>
		<input type="hidden" id="id" value="${board.id}">
		<div>
			<div>Title</div>
			<div><input value="${board.title}" class="write__input" type="text" placeholder="Enter title" id="title"></div>
		</div>
		
		<div>
			<div>Content</div>
			<div><textarea class="summernote" rows="5" id="content">${board.content}</textarea></div>
		</div>
	</form>
	
</div>
<button id="btn-update" class="btn-write">글수정 완료</button>
</section>



<script>
      $('.summernote').summernote({
    	tabsize: 3,
        height: 300,
        width: 700,
        minHeight: null,
        maxHeight: null,
        lang: "ko-KR",
        placeholder: '글서랍에 쌓일 글을 작성하세요.'
      });
    </script>

<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp" %>
