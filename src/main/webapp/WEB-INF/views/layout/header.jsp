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
                    <ul class="navbar-nav">
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
                            <a href="#">bookshelf</a>
                            <ul>
                                <li><a href="#">예담의 글서랍</a></li>
                                <li><a href="#">지하의 글서랍</a></li>
                                <li><a href="#">정주의 글서랍</a></li>
                            </ul>
                        </li>
                        <li><a class="nav-link" href="#">write</a></li>
                        <li><a class="nav-link" href="#">info</a></li>
                        <li><a class="nav-link" href="#">logout</a></li>
                    </ul>
                    </c:otherwise>
                    </c:choose>
                </div>            
            </nav>
        </section>

    </header>
  
