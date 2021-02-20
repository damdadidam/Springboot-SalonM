<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<section>
    
    <div class="container">
            <div class="detail__info">
                글 번호: <span id="id"><i>${board.id}</i></span><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>작성자: <span><i>${board.user.username}</i></span>
            </div>
            
            <br>
            <div>
                <div>Title</div>
                <h3>${board.title}</h3>
            </div>
            <hr>
            <div>
                <div>Content</div><br>
                <div>${board.content}</div>
            </div>
            <hr>
            <br>

            <div>
                <button class="detail__button" onclick="history.back()">backwards</button>
                <c:if test="${board.user.id==principal.user.id}">
	                <button class="detail__button" type="button" onclick="location.href='/board/${board.id}/updateForm'">update</button>
	                <button class="detail__button" id="btn-delete">delete</button>
                </c:if>
            </div>
    </div>
    
   
    </section>

<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp" %>
