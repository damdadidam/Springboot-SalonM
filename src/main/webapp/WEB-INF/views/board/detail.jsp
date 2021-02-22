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
            
            <div class="reply__box">
            	<form>
            		<input type="hidden" id="userId" value="${principal.user.id}">
            		<input type="hidden" id="boardId" value="${board.id}">
            		<div class="reply__content">
            			<textarea id="reply-content" class="form-control" rows="1"></textarea>
            		</div>
            		<div class="reply__button">
            			<button class="detail__button" type="button" id="btn-reply-save">Comment</button>
            		</div>
            	</form>
            </div>
            
            <br>
            <div class="comment__box">
                <div>Comments</div>
                <ul id= "reply-box">
                    <c:forEach var="reply" items="${board.replies}">
                        <li id="reply-${reply.id}" class="d-flex justufy-content-between">
                            <div class="d-flex">
                                <div class="font-italic">작성자 : ${reply.user.username} &nbsp;</div>
                                <c:if test="${reply.user.id==principal.user.id}">
                                    <button onclick="index.replyDelete(${board.id},${reply.id})" class="badge">delete</button>
                                </c:if>
                            </div>
                            <div>${reply.content}</div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            
            
    </div>
    
   
    </section>

<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp" %>
