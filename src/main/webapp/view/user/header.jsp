<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url value="/view/user" var="url"/>
<html>
<head>
    <meta charset="utf-8">
    <title>Shop Giày</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">54
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${url}/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${url}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<c:url value ="/view/user/css/style.css"/>" rel="stylesheet">
<%--    jquery--%>
    <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row bg-secondary py-1 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <!-- right topbar start only has login or logout -->
            <div class="d-inline-flex align-items-center">
                <c:choose>
                    <c:when test="${sessionScope.account == null}">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">My Account</button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a href="<c:url value="/login"/>">
                                    <button class="dropdown-item">Sign in</button>
                                </a>
                                <a href="<c:url value="/register"/>">
                                    <button class="dropdown-item">Sign up</button>
                                </a>
                            </div>
                        </div>
                    </c:when>
<%--                    session khac null--%>
                    <c:otherwise>
                        <div class="btn-group">
                            <a href="<c:url value="/view/user/profile"/>" class="nav-item nav-link" style="color:black;">Hello ${sessionScope.account.name}</a>
                            <a href="<c:url value="/view/user/profile"/>" class="nav-item nav-link" style="color:black;">My Account</a>
                            <a href="<c:url value="/signout"/>" class="nav-item nav-link" style="color:black;">Sign out</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="${url}/index" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">SHOP</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">GIAY</span>
            </a>
        </div>
        <!-- search product -->
        <div class="col-lg-4 col-6 text-left">
            <form action="<c:url value="/view/user/search"/>">
                <div class="input-group">
                    <input name="keyname" type="text" class="form-control" placeholder="Search for products">
                    <button class="btn-search" type="submit" style="border: none">
                        <span class="input-group-text bg-transparent text-primary">
                            <i class="fa fa-search"></i>
                        </span>
                    </button>
                </div>
            </form>
        </div>
        <div class="col-lg-4 col-6 text-right">
            <p class="m-0">Customer Service</p>
            <h5 class="m-0">+012 345 6789</h5>
        </div>
    </div>
</div>
<!-- Topbar End -->