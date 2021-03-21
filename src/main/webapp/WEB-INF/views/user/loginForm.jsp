<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<%
String error = request.getParameter("error");
request.setAttribute("error", error);
%>
<c:if test="${error==1}">
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
	</script>
</c:if>

<main>
    
   <div class="join__title">반갑습니다! <br>로그인 후 글서랍을 탐색하세요.</div>

    <section>
        <div class="join__box">
            <form action="/auth/loginProc" method="post">
                <table>
                    <tr>
                        <td class="join__sub__title">사용자명 입력</td>
                    </tr>
                    <tr>
                        <td>
                            <input name="username" class="join__input" type="text" id="username">
                        </td>
                    </tr>
                    <tr>
                        <td class="join__sub__title">비밀번호 입력</td>
                    </tr>
                    <tr>
                        <td>
                            <input name="password" class="join__input" type="password" id="password">
                        </td>
                    </tr>
                </table>
                <button id="btn-save" class="join__button">계정 로그인</button>
            </form>
        </div>
    </section>
</main>

<%@ include file="../layout/footer.jsp" %>
