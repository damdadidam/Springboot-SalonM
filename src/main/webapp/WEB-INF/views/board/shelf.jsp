<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<main>
    <section class="sec__shelf">
        <div class="shelf__boxes">
      
        <c:forEach var="board" items="${boards.content}">
        <div class="shelf__box">
            <div class="shelf">
                <div class="shelf__title">${board.title}</div>
                <div class="shelf__content">${board.content}</div>
                <div class="shelf__anchor"><a href="/board/${board.id}">Continue reading  <span>→</span></a></div>
                <div class="shelf__date">${board.createDate}</div>
            </div>
        </div>
        </c:forEach>
        
        </div>
    </section>
    <div class="prevnext">
        <ul id="prevnext">
        	<c:choose>
        		<c:when test="${boards.first}">
        		 <li class="previous">Prev</li>
        		</c:when>
        		<c:otherwise>
        		 <li><a class="previous" href="?page=${board.number-1}">Prev</a></li>
        		</c:otherwise>
        	</c:choose>
        		
        		<li>|</li>
        		
        	<c:choose>
        		<c:when test="${boards.last}">
        		 <li class="disabled">Next</li>
        		</c:when>
        		<c:otherwise>
        		 <li><a class="page-link" href="?page=${board.number+1}">Next</a></li>
        		</c:otherwise>
        	</c:choose>
        </ul>
        </div>
</main>

<%@ include file="../layout/footer.jsp" %>