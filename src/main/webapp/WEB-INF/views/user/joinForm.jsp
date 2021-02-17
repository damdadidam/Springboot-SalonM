<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<main>
    
   <div class="join__title">처음이신가요? <br>계정을 만들고 나만의 글서랍을 가지세요.</div>

    <section>
        <div class="join__box">
            <form>
                <table>
                    <tr>
                    <td class="join__sub__title">이메일 주소 입력</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="join__input" type="text" placeholder='"@를 포함하여 작성"' id="username">
                        </td>
                    </tr>
                    <tr>
                        <td class="join__sub__title">사용자명 생성</td>
                    </tr>
                    <tr>
                        <td>
                            <input class="join__input" type="text" id="email" placeholder='"한/영 혼용 가능"'>
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
                </table>
            </form>

            <button id="btn-save" class="join__button">계정 만들기</button>
        </div>
    </section>
</main>

<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp" %>
