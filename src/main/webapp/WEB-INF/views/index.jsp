<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>

<main>
	<section class="head">
    	<div class="home">
        	<div class="home__img"></div>
        	<div class="home__title">Lights in the city 2019</div>
        	<div class="home__info">Artistic action by Yed Ammu</div>
        </div>
    </section>
    <section>
        <div class="sec__title">최근 글</div>
    </section>
    <section>
      <c:forEach var="board" items="${boards.content}">
        <div class="article__box">
            <div class="article">
                <div class="article__title">${board.title}</div>
                <div class="article__content">${board.content}</div>
                <div class="article__anchor"><a href="/board/${board.id}">Continue reading  <span>→</span></a></div>
                <div class="article__date">${board.createDate}</div>
            </div>
        </div>
      </c:forEach>
    </section>
</main>

<%@ include file="layout/footer.jsp" %>
