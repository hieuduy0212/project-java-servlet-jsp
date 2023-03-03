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
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-12 col-md-9">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-4" style="display: flex;justify-content: center;align-items:center"><img style="max-width: 100%" src="<c:url value="/view/admin/img/category/${category.cimage}"/>" alt=""/></div>
                                <div class="col-lg-8">
                                    <input type="hidden" id="message" value="${message}">
                                    <div class="text-left" style="padding-top: 10px;padding-left: 10px" >
                                        <a class="small" href="<c:url value="/view/admin/category"/>"><i class="fa fa-arrow-circle-left"></i> List of category</a>
                                    </div>
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Edit category's info</h1>
                                        </div>
                                        <form class="user" method="post"
                                              action="<c:url value="/view/admin/edit-category"/>"
                                              enctype="multipart/form-data">
                                            <div class="form-group">
                                                <input name="name" type="text" class="form-control form-control-user"
                                                       id="name" placeholder="Name" value="${category.cname}">
                                            </div>
                                            <div class="form-group">
                                                <input name="file-image" type="file"
                                                       class="form-control form-control-user"
                                                       id="file-image" style="padding: 0.3rem 1rem 1.9rem;">
                                            </div>
                                            <button type="submit" class="btn btn-primary btn-lg btn-block" id="btnEditCategory" disabled>Edit category</button>
                                            <hr>
                                        </form>
                                        <hr>
                                    </div>
                                </div>
                            </div>
                        </div>
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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

</script>
<script type="text/javascript">
    var msg = document.getElementById("message").value;
    if(msg=="successEditProduct"){
        swal({text:"Your changes have been successfully saved", icon: "success"});
    }else if(msg=="errorEditProduct"){
        swal({text:"Failed to change information", icon: "error"});
    }
</script>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function (){
        $("#name").keyup(function (){
            if( /^\s*$/.test($("#name").val()) ){
                $("#btnEditCategory").attr("disabled", true);
            }else{
                $("#btnEditCategory").attr("disabled", false);
            }
        });
        $("#file-image").change(function (){
            if($("#file-image").val() != false && /^\s*$/.test($("#name").val()) == false){
                $("#btnEditCategory").attr("disabled", false);
            }
        });
    });
</script>

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