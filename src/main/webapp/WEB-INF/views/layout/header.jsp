<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>이야기를 풀어놓다, SalonM</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/css/styles.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="/js/summernote/summernote-lite.js"></script>
	<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
	<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="/image/icon.png">

</head>
<body>
    <header>
        <section class="head">
            <nav>
                <div class="logo">
                    <a class="navbar-brand" href="/">SalonM</a>
                </div>

                <div class="menu">
                
                    <c:choose>
                    <c:when test="${empty principal}">
                    <ul id="navbar-two" class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/loginForm">Sing in</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/joinForm">Sign Up</a>
                    </li>
                    </ul>
                    </c:when>
                
                    <c:otherwise>
                    <ul>
                        <li class="nav__dropdown">
                            <a href="/board/shelf">bookshelves</a>
                            <ul>
                                <li><a href="#">예담의 글서랍</a></li>
                                <li><a href="#">지하의 글서랍</a></li>
                                <li><a href="#">정주의 글서랍</a></li>
                            </ul>
                        </li>
                        <li><a class="nav-link" href="/board/saveForm">write</a></li>
                        <li><a class="nav-link" href="/user/updateForm">member</a></li>
                        <li><a class="nav-link" href="/logout">logout</a></li>
                    </ul>
                    </c:otherwise>
                    </c:choose>
                </div>            
            </nav>
        </section>

    </header>
  
