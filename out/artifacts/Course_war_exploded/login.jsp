<%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 12/18/2018
  Time: 6:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login V1</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="resourcrs/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resourcrs/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resourcrs/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resourcrs/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resourcrs/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resourcrs/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resourcrs/css/util.css">
    <link rel="stylesheet" type="text/css" href="resourcrs/css/main.css">
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
                <img src="resourcrs/images/img-03.png" alt="IMG">
            </div>

            <form action="login?action=doLogin" method="post" class="login100-form validate-form">
					<span class="login100-form-title">
						Member Login
					</span>

                <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                    <input class="input100" type="text" name="username" placeholder="Username">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-user-circle-o" aria-hidden="true"></i>
						</span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Password is required">
                    <input class="input100" type="password" name="password" placeholder="Password">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
                </div>
                <c:if test="${not empty requestScope.get('errorMessage')}">
                    <span style="color: red";> ${requestScope.get('errorMessage')}</span>
                </c:if>
                <div class="container-login100-form-btn">
                    <input type="submit" value="Login" class="login100-form-btn"/>
                </div>

                <div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
                    <a class="txt2" href="#">
                        Username / Password?
                    </a>
                </div>

                <div class="text-center p-t-136">
                    <a id="creatUser" class="txt2" href="#">
                        Create your Account
                        <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<!--===============================================================================================-->
<script src="resourcrs/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="resourcrs/vendor/bootstrap/js/popper.js"></script>
<script src="resourcrs/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="resourcrs/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="resourcrs/vendor/tilt/tilt.jquery.min.js"></script>
<script>
    $(function () {
        history.pushState(null,null,"login.jsp");
        window.addEventListener("popstate",function (ev) {
            history.pushState(null,null,"login.jsp");
        });
    });
    $('.js-tilt').tilt({
        scale: 1.1
    });
    $('#creatUser').click(function () {
        $('#addTeacherDialog').load('views/add-inputs.jsp', function () {
            addTeacherDialog();
            getTypeUser();
        });
    });

</script>
<!--===============================================================================================-->
<%--<script src="resourcrs/js/main.js"></script>--%>

</body>
</html>
