<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/view/admin" var="url"/>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Profile</title>
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
                    <img src="<c:url value="/view/admin/img/"/>${sessionScope.account.avatar}" style="max-width: 460px"/>
                </div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Change your password</h1>
                        </div>
                        <form class="user" method="post" action="<c:url value="/view/user/password"/>"
                              onsubmit="return checkForm()">
                            <div class="form-group row">
                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <input name="curpass" id="curpass" type="password" class="form-control form-control-user"
                                    placeholder="Current Password">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <input name="newpass"  id="newpass" type="password" class="form-control form-control-user"
                                           placeholder="New Password">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12 mb-3 mb-sm-0">
                                    <input name="renewpass"  id="renewpass" type="password" class="form-control form-control-user"
                                           placeholder="Confirm Password">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg btn-block">Confirm</button>
                        </form>
                        <hr>
                        <a href="<c:url value="/view/user/profile"/>"  style="color:black;">Change profile</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--  sweet alert--%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    function checkForm() {
        var curPass = document.getElementById("curpass").value;
        if(!curPass){
            swal({title:"Current password is empty", text: "Enter your current password", icon:"error"});
            return false;
        }else{
            var newpass=document.getElementById("newpass").value;
            var renewpass = document.getElementById("renewpass").value;
            if(!newpass){
                swal({title:"New password is empty", text: "Enter your new password", icon:"error"});
                return false;
            }else if(renewpass != newpass){
                swal({title:"Password entered is different", text: "Enter your confirm password", icon:"error"});
                return false;
            }
        }
        return true;
    }
</script>
<script type="text/javascript">
    var status = document.getElementById("status").value;
    if(status == "errorCurrentPass"){
        swal({title:"Password is incorrect", icon:"error"});
    }
    if(status == "successChangePass"){
        swal({title:"Your password has been changed", icon:"success"});
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