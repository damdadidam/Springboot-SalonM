<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<section>
<div class="container">
	<form>
		<div>
			<div>Title</div>
			<div><input class="write__input" type="text" placeholder="Enter title" id="title"></div>
		</div>
		
		<div>
			<div>Content</div>
			<div><textarea class="summernote" rows="5" id="content"></textarea></div>
		</div>
	</form>
	
</div>
<button id="btn-save" class="btn-write">글쓰기 완료</button>
</section>



<script>
      $('.summernote').summernote({
    	tabsize: 3,
        height: 300,
        width: 700,
        minHeight: null,
        maxHeight: null,
        lang: "ko-KR",
      });
    </script>

<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp" %>
