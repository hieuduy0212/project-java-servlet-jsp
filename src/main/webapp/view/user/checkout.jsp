<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/25/2022
  Time: 9:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url value="/view/user" var="url"/>
<jsp:include page="./header.jsp" flush="true"/>
<!-- Topbar End -->

<!-- Navbar Start -->
<jsp:include page="./navbar.jsp"/>
<!-- Navbar End -->

<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="<c:url value="/view/user/index"/>">Home</a>
                <a class="breadcrumb-item text-dark" href="<c:url value="/view/user/shop?c=0"/>">Shop</a>
                <span class="breadcrumb-item active">Checkout</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->
<!-- Checkout Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <c:choose>
            <c:when test="${sessionScope.account==null}">
                <h3>
                    Bạn chưa đăng nhập tài khoản. Vui lòng đăng nhập <a href="<c:url value="/login"/>">tại đây</a>
                </h3>
            </c:when>
            <c:otherwise>
                <input type="hidden" id="msg" value="${message}"/>
                <form action="${url}/checkout" method="post">
                    <div class="form-group row px-xl-5">
                        <div class="col-lg-8">
                            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Billing Address</span></h5>
                            <div class="bg-light p-30 mb-5">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label>Full Name</label>
                                        <input class="form-control" name="name" id="name" type="text" placeholder="Nguyen Van A" required="required">

                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>E-mail</label>
                                        <input class="form-control" type="text" name="email" id="email" placeholder="example@email.com" required="required">
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>Mobile No</label>
                                        <input class="form-control" type="text" name="phone_number" id="phone_number" placeholder="+123 456 789" required="required">
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>Address Line 1</label>
                                        <input class="form-control" type="text" name="address1" id="address1" placeholder="123 Street" required="required">
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>Country</label>
                                        <input class="form-control" type="text" name="country" id="country" placeholder="Viet Nam" required="required">
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>City</label>
                                        <input class="form-control" type="text" name="city" id="city" placeholder="Ha Noi" required="required">
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label>ZIP Code</label>
                                        <input class="form-control" type="text" name="zipcode" id="zipcode" placeholder="123" required="required">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
                            <div class="bg-light p-30 mb-5">
                                <div class="border-bottom">
                                    <h6 class="mb-3">Products</h6>
                                    <c:forEach items="${sessionScope.order.listItem}" var="o">
                                        <div class="d-flex justify-content-between">
                                            <p>${o.product.name} x ${o.qty}</p>
                                            <p>$${o.price}</p>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="border-bottom pt-3 pb-2">
                                    <div class="d-flex justify-content-between mb-3">
                                        <h6>Subtotal</h6>
                                        <h6>$${sessionScope.sum_price}</h6>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <h6 class="font-weight-medium">Shipping</h6>
                                        <h6 class="font-weight-medium">$10</h6>
                                    </div>
                                </div>
                                <div class="pt-2">
                                    <div class="d-flex justify-content-between mt-2">
                                        <h5>Total</h5>
                                        <h5>$${sessionScope.sum_price + 10}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-5">
                                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Payment</span></h5>
                                <div class="bg-light p-30">
                                    <div class="form-group">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" name="payment" id="paypal" value="Paypal" checked>
                                            <label class="custom-control-label" for="paypal">Paypal</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" name="payment" id="directcheck"  value="Direct Check" >
                                            <label class="custom-control-label" for="directcheck">Direct Check</label>
                                        </div>
                                    </div>
                                    <div class="form-group mb-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" name="payment" id="banktransfer"  value="Bank Transfer" >
                                            <label class="custom-control-label" for="banktransfer">Bank Transfer</label>
                                        </div>
                                    </div>
                                    <button class="btn btn-block btn-primary font-weight-bold py-3">Place Order</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!-- Checkout End -->

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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    var msg = document.getElementById("msg").value;
    if(msg == "successCheckout"){
        swal({title:"Successfully order", icon:"success"});
    }else if(msg == "errorCheckout"){
        swal({title:"Fail order", icon:"error"});
    }
</script>
</body>

</html>