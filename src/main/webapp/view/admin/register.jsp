<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/26/2022
  Time: 9:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/view/admin" var="url"/>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Register</title>
    <!-- Custom fonts for this template-->
    <link href="${url}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="${url}/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
<input type="hidden" id="status" value="${message}">
<jsp:include page="/view/user/header.jsp"/>
<div class="container">
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block">
                    <img src="https://www.whoa.in/download/dogs-funny-hd-wallpaper-for-mobile" style="max-width: 460px"/>
                </div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                        </div>
                        <form class="user" method="post" action="<c:url value="/register"/>"
                              onsubmit="return checkRegister()">
                            <div class="form-group row">
                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <input name="name" type="text" class="form-control form-control-user"
                                           id="exampleYourName"
                                           placeholder="Your Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <input name="email" type="email" class="form-control form-control-user"
                                       id="exampleInputEmail"
                                       placeholder="Email Address">
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input name="pass" type="password" class="form-control form-control-user"
                                           id="exampleInputPassword" placeholder="Password">
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user"
                                           id="exampleRepeatPassword" placeholder="Repeat Password">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg btn-block">Register Account</button>
                            <hr>
                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="forgot-password.html">Forgot Password?</a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="<c:url value="/login"/>">Already have an account? Login!</a>
                        </div>
                    </div>
                </div
            </div>
        </div>
    </div>
</div>
<%--  sweet alert--%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    function checkRegister() {
        var name = document.getElementById("exampleYourName").value;
        var email = document.getElementById("exampleInputEmail").value;
        var pass = document.getElementById("exampleInputPassword").value;
        var repass = document.getElementById("exampleRepeatPassword").value;
        if (name == null || name == "") {
            swal({title: "Tên trống", text: "Nhập tên của bạn", icon: "error"});
            return false;
        }
        if (email == null || email == "") {
            swal({title: "Email trống", text: "Nhập email của bạn", icon: "error"});
            return false;
        }
        if (pass == null || pass == "") {
            swal({title: "Mật khẩu trống", text: "Nhập mật khẩu của bạn", icon: "error"});
            return false;
        }
        if (repass != pass) {
            swal({title: "Mật khẩu không khớp", text: "Nhập lại mật khẩu", icon: "error"});
            return false;
        }
    }
</script>
<script type="text/javascript">
    var status = document.getElementById("status").value;
    if(status == "emailExists"){
        swal({title:"Email đã tồn tại", text:"Vui lòng nhập một email khác", icon:"error"});
    }
</script>
<!-- Bootstrap core JavaScript-->
<script src="${url}/vendor/jquery/jquery.min.js"></script>
<script src="${url}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${url}/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${url}/js/sb-admin-2.min.js"></script>

</body>

</html>