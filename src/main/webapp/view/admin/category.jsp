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
            <a class="btn btn-primary" href="<c:url value="/view/admin/add-category"/>" role="button">Add category</a>
            <br/>
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Category List</h1>
            <!-- DataTales Example -->
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="card shadow mb-4 col-lg-8">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>ID#</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Option</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listC}" var="o">
                                    <tr>
                                        <td  style="vertical-align: middle">${o.id}</td>
                                        <td style="vertical-align: middle">${o.cname}</td>
                                        <td style="vertical-align: middle"><img class="img-fluid" src="<c:url value="/view/admin/img/category/${o.cimage}"/>"
                                                 style="max-width: 100px"
                                                 alt=""></td>
                                        <td style="vertical-align: middle">
                                            <div style="display: flex;align-items: center;justify-content: space-evenly">
                                                <a class="btn btn-outline-danger" style="max-width: 100px; min-width: 90px" href="<c:url value="/view/admin/edit-category?id=${o.id}"/>">Edit</a>
                                                <a class="btn btn-outline-danger" style="max-width: 100px;min-width: 90px" href="<c:url value="/view/admin/delete-category?id=${o.id}"/>">Delete</a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2"></div>
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