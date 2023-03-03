<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="url" value="/view/admin"/>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login</title>
    <!-- Custom fonts for this template-->
    <link href="${url}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="${url}/css/sb-admin-2.min.css" rel="stylesheet">

<%--    jquery--%>
<%--    <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>--%>
</head>
<body class="bg-gradient-primary">
    <input type="hidden" id="status" value="${message}"/>
    <jsp:include page="/view/user/header.jsp"/>
    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block"><img style="max-width: 400px" src="https://images.unsplash.com/photo-1530281700549-e82e7bf110d6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8&w=1000&q=80"/></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" method="post" action="<c:url value="/login"/>">
                                        <div class="form-group">
                                            <input name="email" type="email" class="form-control form-control-user"
                                                   id="exampleInputEmail" aria-describedby="emailHelp" autofocus
                                                   placeholder="Enter Email Address..." title="Please enter your email"
                                                    value="${email}">
<%--                                            <i id="iemail" style="display: none;color: red" class="invalid-feedback">(*)Email </i>--%>
                                        </div>
                                        <div class="form-group">
                                            <input name="pass" type="password" class="form-control form-control-user"
                                                   id="exampleInputPassword" placeholder="Password">
<%--                                            <i id="ipass" style="display: none;color: red" class="invalid-feedback">(*)Password không được để trống</i>--%>
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-lg btn-block" id="btnLogin" disabled>Login</button>
                                        <hr>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="<c:url value="/register"/>">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%--alert sweet alert--%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
    var status = document.getElementById("status").value;
    if(status == "wrongAccount"){
        swal({title:"Username or password is wrong", icon:"error"});
    }
</script>


<script>
    $(document).ready(function (){
        $("#exampleInputEmail, #exampleInputPassword").keyup(function (){
            if($("#exampleInputEmail").val().length > 0 && $("#exampleInputPassword").val().length > 0){
                $("#btnLogin").attr("disabled", false);
            }else{
                $("#btnLogin").attr("disabled", true);
            }
        });
    });
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