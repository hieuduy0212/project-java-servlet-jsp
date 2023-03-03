<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/8/2022
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/view/admin" var="url"/>
<jsp:include page="/view/admin/slidebar.jsp"/>
<!-- End of Sidebar -->

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
        <jsp:include page="/view/admin/topbar.jsp"/>
        <!-- End of Topbar -->
        <!-- Begin Page Content -->

        <div class="container-fluid">
            <!-- Page Heading -->
            <a class="btn btn-primary" href="<c:url value="/view/admin/add-product"/>" role="button">Add product</a>
            <br/>
            <h1 class="h3 mb-2 text-gray-800">List of Products</h1>
                        <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>ID#</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Category</th>
                                <th>Option</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listP}" var="o">
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td><img class="img-fluid" src="<c:url value="/view/admin/img/product/${o.image}"/> " alt=""></td>
                                    <td>${o.price}</td>
                                    <td>${o.title}</td>
                                    <td>${o.description}</td>
                                    <c:forEach items="${listC}" var="o1">
                                        <c:if test="${o.cateID == o1.id}">
                                            <td>${o1.cname}</td>
                                        </c:if>
                                    </c:forEach>
                                    <td><a class="btn btn-block btn-danger" href="<c:url value="/view/admin/edit-product?id=${o.id}"/>">Edit</a>
                                        <a class="btn btn-block btn-danger" href="<c:url value="/view/admin/delete-product?id=${o.id}"/>">Delete</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; Your Website 2020</span>
            </div>
        </div>
    </footer>
    <!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Sign out" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="<c:url value="/signout" />">Sign out</a>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="${url}/vendor/jquery/jquery.min.js"></script>
<script src="${url}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${url}/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${url}/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${url}/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${url}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${url}/js/demo/datatables-demo.js"></script>

</body>

</html>