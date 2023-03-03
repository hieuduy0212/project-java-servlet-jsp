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
                <h1 class="h3 mb-2 text-gray-800">User List</h1>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>ID#</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Image</th>
                                    <th>IsAdmin</th>
                                    <th>Option</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listA}" var="o">
                                    <tr>
                                        <td>${o.id}</td>
                                        <td>${o.name}</td>
                                        <td>${o.email}</td>
                                        <td><img class="img-fluid" src="<c:url value="/view/admin/img/${o.avatar}"/>"
                                                 style="max-width: 100px"
                                                 alt=""></td>
                                        <c:choose>
                                            <c:when test="${o.isAdmin == 1}">
                                                <td>ADMIN</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>NON ADMIN</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:if test="${o.id > 1}">
                                            <td><a class="btn btn-block btn-danger btn-sm" href="<c:url value="/view/admin/edit-user?id=${o.id}"/>">Edit</a>
                                                <a class="btn btn-block btn-danger btn-sm" href="<c:url value="/view/admin/delete-user?id=${o.id}"/>">Delete</a></td>
                                        </c:if>
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