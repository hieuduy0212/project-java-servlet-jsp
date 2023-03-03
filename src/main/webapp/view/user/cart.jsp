<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/25/2022
  Time: 9:42 AM
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
        <a class="breadcrumb-item text-dark" href="${url}/index">Home</a>
        <a class="breadcrumb-item text-dark" href="${url}/shop?c=0">Shop</a>
        <span class="breadcrumb-item active">Shopping Cart</span>
      </nav>
    </div>
  </div>
</div>
<!-- Breadcrumb End -->

<!-- Cart Start -->
<div class="container-fluid">
  <div class="row px-xl-5">
    <div class="col-lg-8 table-responsive mb-5">
      <form action="<c:url value="/view/user/update-cart"/>" method="post">
        <button type="submit" class="btn btn-outline-warning btn-block" style="color: black">Update your cart</button>
        <br/>
        <table class="table table-light table-borderless table-hover text-center mb-0">
          <thead class="thead-dark">
          <tr>
            <th>Products</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Remove</th>
          </tr>
          </thead>
          <tbody class="align-middle">
          <c:forEach items="${sessionScope.order.listItem}" var="o">
            <tr>
              <td class="align-middle"><img src="<c:url value="/view/admin/img/product/${o.product.image}"/>" alt="" style="width: 50px;"> ${o.product.name}</td>
              <td class="align-middle">$${o.product.price}</td>
              <td class="align-middle">
                <div class="input-group quantity mx-auto" style="width: 100px;">
                  <div class="input-group-btn">
                    <button class="btn btn-sm btn-primary btn-minus" type="button">
                      <i class="fa fa-minus"></i>
                    </button>
                  </div>
                  <input type="text" name="${o.product.id}"
                         class="form-control form-control-sm bg-secondary border-0 text-center" value="${o.qty}">
                  <div class="input-group-btn">
                    <button class="btn btn-sm btn-primary btn-plus" type="button">
                      <i class="fa fa-plus"></i>
                    </button>
                  </div>
                </div>
              </td>
              <td class="align-middle">$${o.price}</td>
              <td class="align-middle">
                <a class="btn btn-sm btn-danger" href="<c:url value="/view/user/delete-in-cart?id=${o.product.id}"/>" role="button"><i class="fa fa-times"></i></a>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </form>
    </div>
    <div class="col-lg-4">
      <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>
      <div class="bg-light p-30 mb-5">
        <div class="border-bottom pb-2">
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
          <a class="btn btn-block btn-warning font-weight-bold my-3 py-3" href="${url}/checkout" role="button">Proceed To Checkout</a>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Cart End -->


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