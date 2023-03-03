<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url value="/view/user" var="url"/>

<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse"
               href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Categories</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
                 id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div class="navbar-nav w-100">
                    <c:forEach items="${listC}" var="o">
                        <a href="${url}/shop?c=${o.id}" class="nav-item nav-link">${o.cname}</a>
                    </c:forEach>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="${url}/index" class="nav-item nav-link ${activenav=="home"?"active":""}">Home</a>
                        <a href="${url}/shop?c=0" class="nav-item nav-link ${activenav=="shop"?"active":""}">Shop</a>
                        <a href="${url}/detail?p=1" class="nav-item nav-link ${activenav=="detail"?"active":""}">Shop
                            Detail</a>
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle ${activenav=="cart"?"active":""} ${activenav=="checkout"?"active":""}"
                               data-toggle="dropdown">Pages<i class="fa fa-angle-down mt-1"></i></a>
                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                <a href="${url}/cart" class="dropdown-item ${activenav=="cart"?"active":""}">Shopping
                                    Cart</a>
                                <a href="${url}/checkout" class="dropdown-item ${activenav=="checkout"?"active":""}">Checkout</a>
                            </div>
                        </div>
                        <a href="${url}/contact" class="nav-item nav-link ${activenav=="contact"?"active":""}">Contact</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                        <a href="${url}/favorite" class="btn px-0">
                            <i class="fas fa-heart text-primary"></i>
                            <span class="badge text-secondary border border-secondary rounded-circle"
                                  style="padding-bottom: 2px;">${fn:length(sessionScope.listF)}</span>
                        </a>
                        <a href="${url}/cart" class="btn px-0 ml-3">
                            <i class="fas fa-shopping-cart text-primary"></i>
                            <span class="badge text-secondary border border-secondary rounded-circle"
                                  style="padding-bottom: 2px;">
                                <c:if test="${sessionScope.order == null}">
                                    0
                                </c:if>
                                <c:if test="${sessionScope.order != null}">
                                    ${sessionScope.size_order}
                                </c:if>
                            </span>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>