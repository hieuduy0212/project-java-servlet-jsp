<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/25/2022
  Time: 9:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/view/user" var="url"/>
<jsp:include page="./header.jsp"/>
<!-- Topbar End -->
<!-- Navbar Start -->
<!-- Navbar Start -->
<jsp:include page="./navbar.jsp"/>
<!-- Topbar End -->
<!-- Navbar End -->


<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <span class="breadcrumb-item active">Contact</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Contact Start -->
<div class="container-fluid">

    <c:choose>
        <c:when test="${sessionScope.account==null}">
            <h3>
                Bạn chưa đăng nhập tài khoản. Vui lòng đăng nhập <a href="<c:url value="/login"/>">tại đây</a>
            </h3>
        </c:when>
        <c:otherwise>
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Contact Us</span>
            </h2>
            <div class="row px-xl-5">
                <div class="col-lg-2 mb-5"></div>
                <div class="col-lg-8 mb-5">
                    <div class="contact-form bg-light p-30">
                        <div id="success"></div>
                        <form method="post" action="<c:url value="/view/user/contact"/>">
                            <div class="bg-light p-30 mb-5">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label>Your Name</label>
                                        <input class="form-control" name="name" id="name" type="text" required="required">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Your Email</label>
                                        <input class="form-control" name="email" id="email" type="text" required="required">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Your Subject</label>
                                        <input class="form-control" name="subject" id="subject" type="text" required="required">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Your Message</label>
                                        <textarea class="form-control" rows="8" id="message" placeholder="Message"
                                                  required="required" name="message"></textarea>
                                    </div>
                                    <div>
                                        <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Send
                                            Message
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-2 mb-5"></div>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<!-- Contact End -->


<!-- Footer Start -->
<jsp:include page="footer.jsp"/>
<!-- Footer End -->
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="./lib/easing/easing.min.js"></script>
<script src="./lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="./mail/jqBootstrapValidation.min.js"></script>
<script src="./mail/contact.js"></script>

<!-- Template Javascript -->
<script src="./js/main.js"></script>
</body>

</html>