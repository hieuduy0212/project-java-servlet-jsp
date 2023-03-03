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
        <span class="breadcrumb-item active">Favorites</span>
      </nav>
    </div>
  </div>
</div>
<!-- Breadcrumb End -->

<!-- Cart Start -->
<div class="container-fluid">
  <div class="row px-xl-5">
    <div class="col-lg-2"></div>
    <div class="col-lg-8 table-responsive mb-5">
      <br/>
      <table class="table table-light table-borderless table-hover text-center mb-0">
        <thead class="thead-dark">
        <tr>
          <th>Products</th>
          <th>Price</th>
          <th>Remove</th>
        </tr>
        </thead>
        <tbody class="align-middle">
        <c:forEach items="${sessionScope.listFP}" var="o">
          <tr>
            <td class="align-middle"><a class="h6 text-decoration-none text-truncate" href="${url}/detail?p=${o.id}"><img src="<c:url value="/view/admin/img/product/${o.image}"/>" alt="" style="width: 50px;"> ${o.name}</a></td>
            <td class="align-middle">$${o.price}</td>
            <td class="align-middle">
              <a class="btn btn-sm btn-danger" href="<c:url value="/view/user/delete-in-favorite?id=${o.id}"/>" role="button"><i class="fa fa-times"></i></a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    <div class="col-lg-2"></div>
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