<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<html>
<head>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("euc-kr"); 
    %>
    <title>로그인 화면</title>
    
    <!-- css 파일 분리 -->
    <link href='../../css/login_style.css' rel='stylesheet' style='text/css'/>
    
    <script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.id.value)
            {
                alert("아이디를 입력하세요");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("비밀번호를 입력하세요");    
                inputForm.password.focus();
                return false;
            }
        }
    
        // 회원가입 버튼 클릭시 회원가입 화면으로 이동
        function goJoinForm() {
            location.href="JoinForm.jsp";
        }    
    </script>
 
</head>
<body>
    <div class="loginForm">
        <form name="loginInfo" method="post" action="../join/LoginPro.jsp" 
                onsubmit="return checkValue()">
            <div>
            <img id="login_img" src="../../img/dungreed_logo.png">
            </div>
        	<h2>Login</h2>
            <div class="idForm">
                    <input type="text" class="id" name="id" placeholder="ID" maxlength="50">
            </div>
            <div class="passForm">
                    <input type="password" class="pw" name="password" placeholder="PW" maxlength="50">
            </div>

            <button type="submit" class="btn">
       	 		LOG IN
      		</button>
            <div class="bottomText">
        		Don't you have ID? <a href="JoinForm.jsp">sign up</a>
      		</div>
        </form>
        
        <% 
            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
            // LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
            }
        %>    
    </div>    
</body>
</html>

