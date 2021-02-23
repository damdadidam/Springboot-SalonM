<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<main>
    <section class="sec__shelf">
        <div class="shelf__boxes">
<%
String pageNum = request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}
request.setAttribute("pageNum", pageNum);
int i =0;
request.setAttribute("i", i);
int k = 0;
request.setAttribute("k", k);
%>        
        <c:forEach var="board" items="${boards}">
        <c:if test="${board.user.id == userId}">
<%
	++i;
	request.setAttribute("i", i);
%>
        <c:if test="${(((pageNum-1)*4)<i)&&(i<=(pageNum*4))}">
<%
request.setAttribute("k", ++k);
%>
        <div class="shelf__box">
            <div class="shelf">
                <div class="shelf__title">${board.title}</div>
                <div class="shelf__content">${board.content}</div>
                <div class="shelf__anchor"><a href="/board/${board.id}">Continue reading  <span>→</span></a></div>
                <div class="shelf__date">${board.createDate}</div>
            </div>
        </div>
        </c:if>
        </c:if>
        </c:forEach>
        
        </div>
    </section>
    <div class="prevnext">
        <ul id="prevnext">
        	<c:choose>
        		<c:when test="${pageNum=='1'}">
        		 <li class="previous">Prev</li>
        		</c:when>
        		<c:otherwise>
        		 <li><a class="previous" href="?pageNum=${pageNum-1}">Prev</a></li>
        		</c:otherwise>
        	</c:choose>
        		
        		<li>|</li>
        		
        	<c:choose>
        		<c:when test="${(k<4)||(i/pageNum==4)}">
        		 <li class="disabled">Next</li>
        		</c:when>
        		<c:otherwise>
        		 <li><a class="page-link" href="?pageNum=${pageNum+1}">Next</a></li>
        		</c:otherwise>
        	</c:choose>
        </ul>
        </div>
</main>

<%@ include file="../layout/footer.jsp" %>