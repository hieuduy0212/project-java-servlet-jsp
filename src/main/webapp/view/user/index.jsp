<%@ page import="java.util.HashMap" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url value="/view/user" var="url"/>
<jsp:include page="./header.jsp" flush="true"/>
<!-- Topbar End -->
<!-- Navbar Start -->
<jsp:include page="./navbar.jsp"/>
<!-- Navbar End -->
<!-- Carousel Start -->
<jsp:include page="carousel.jsp"/>
<!-- Carousel End -->
<!-- Featured Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
            </div>
        </div>
    </div>
</div>
<!-- Featured End -->
<!-- Categories Start -->
<div class="container-fluid pt-5">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Categories</span></h2>
    <div class="row px-xl-5 pb-3">
        <c:forEach items="${listC}" var="o">
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a href="${url}/shop?c=${o.id}" class="text-decoration-none" >
                    <div class="cat-item d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;display: flex;justify-content: center;align-items:center">
                            <img class="img-fluid"  src="<c:url value="/view/admin/img/category/${o.cimage}"/>" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>${o.cname}</h6>
                            <c:if test="${listQ.containsKey(o.id) == true}"><small class="text-body">${listQ.get(o.id)} Products</small></c:if>
                            <c:if test="${listQ.containsKey(o.id) == false}"><small class="text-body">0 Products</small></c:if>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
<!-- Categories End -->

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
