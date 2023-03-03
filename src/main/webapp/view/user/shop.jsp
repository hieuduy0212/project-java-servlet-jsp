<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/25/2022
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/view/user" var="url"/>
<jsp:include page="./header.jsp" />
<!-- Topbar End -->
<!-- Navbar Start -->
<!-- Navbar Start -->
<jsp:include page="./navbar.jsp"/>
<!-- Navbar End -->
<!-- Navbar End -->
<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="${url}/index">Home</a>
                <a class="breadcrumb-item text-dark" href="${url}/shop?c=0">Shop</a>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Shop Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-2 col-md-4"></div>
        <!-- Shop Sidebar End -->
        <!-- Shop Product Start -->
        <div class="col-lg-8 col-md-8">
            <div class="row pb-3">
                <c:forEach items="${listP}" var="o">
                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="<c:url value="/view/admin/img/product/${o.image}"/>" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href="${url}/add-to-cart?id=${o.id}"><i class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href="${url}/add-to-favorite?product_id=${o.id}"><i class="far fa-heart"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="${url}/detail?p=${o.id}">${o.name}</a>
                                <br/>
                                <small class="text-body">${o.title}</small>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5>$${o.price}</h5><h6 class="text-muted ml-2"></h6>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mb-1">
                                    <small class="fa fa-star text-primary mr-1"></small>
                                    <small class="fa fa-star text-primary mr-1"></small>
                                    <small class="fa fa-star text-primary mr-1"></small>
                                    <small class="fa fa-star text-primary mr-1"></small>
                                    <small class="fa fa-star text-primary mr-1"></small>
                                    <small>(99)</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-lg-2 col-md-4"></div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->
<!-- Footer Start -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer End -->
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="${url}/lib/easing/easing.min.js"></script>
<script src="${url}/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="${url}/mail/jqBootstrapValidation.min.js"></script>
<script src="${url}/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="${url}/js/main.js"></script>

</body>

</html>
