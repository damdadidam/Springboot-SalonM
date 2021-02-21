<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<main>
    
   <div class="join__title">회원 수정이 필요하세요? <br>계정을 수정하고 글서랍을 계속 탐색하세요.</div>

    <section>
        <div class="join__box">
            <form>
            	<input type="hidden" id="id" value="${principal.user.id}">
                <table>
                	<tr>
                        <td class="join__sub__title">사용자명 생성</td>
                    </tr>
                    <tr>
                        <td>
                            <input value="${principal.user.username}" class="join__input" type="text" id="username" readonly>
                        </td>
                    </tr>
                    
                    <c:choose>
	                    <c:when test="${empty principal.user.oauth}">
		                    <tr>
		                    <td class="join__sub__title">이메일 주소 입력</td>
		                    </tr>
		                    <tr>
		                        <td>
		                            <input value="${principal.user.email}" class="join__input" type="text" placeholder='"@를 포함하여 작성"' id="email">
		                        </td>
		                    </tr>
		                    <tr>
		                        <td class="join__sub__title">비밀번호 생성</td>
		                    </tr>
		                    <tr>
		                        <td>
		                            <input class="join__input" type="password" placeholder='"영문자와 숫자만 허용"' id="password">
		                        </td>
		                    </tr>
	                    </c:when>
	                    <c:otherwise>
	                    	<tr>
		                   		<td class="join__sub__title">이메일 주소 입력</td>
		                    	</tr>
		                    <tr>
		                        <td>
		                            <input value="${principal.user.email}" class="join__input" type="text" id="email" readonly>
		                        </td>
		                    </tr>
	                    </c:otherwise>
	                </c:choose>
                </table>
            </form>

            <button id="btn-update" class="join__button">회원수정 완료</button>
        </div>
    </section>
</main>

<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>
