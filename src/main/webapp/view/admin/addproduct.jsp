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
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-12 col-md-9">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <input type="hidden" id="message" value="${message}">
                                    <div class="text-left" style="padding-top: 10px;padding-left: 10px" >
                                        <a class="small" href="<c:url value="/view/admin/product"/>"><i class="fa fa-arrow-circle-left"></i> List of product</a>
                                    </div>
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Enter product's info</h1>
                                        </div>
                                        <form class="user" method="post"
                                              action="<c:url value="/view/admin/add-product"/>"
                                              onsubmit="return checkAddProduct()" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <input name="name" type="text" class="form-control form-control-user"
                                                       id="name" placeholder="Name">
                                            </div>
                                            <div class="form-group">
                                                <input name="price" type="text" class="form-control form-control-user"
                                                       id="price" placeholder="Price">
                                            </div>

                                            <div class="form-group">
                                                <input name="title" type="text" class="form-control form-control-user"
                                                       id="title" placeholder="Title">
                                            </div>

                                            <div class="form-group">
                                                <textarea placeholder="Description" name="description" class="form-control form-control-user"
                                                          id="description" rows="10" style="resize: both;width: 100%; border-radius: 14px;"></textarea>
                                            </div>

                                            <div class="form-group">
                                                <input name="file-image" type="file"
                                                       class="form-control form-control-user"
                                                       id="file-image" style="padding: 0.3rem 1rem 1.9rem;">
                                            </div>

                                            <div class="form-group user-select-auto">
                                                <select name="category" id="category" class="custom-select">
                                                    <option disabled="disabled" selected="selected" value="">Category</option>
                                                    <c:forEach items="${listC}" var="o">
                                                        <option value="${o.id}">${o.id} - ${o.cname}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary btn-lg btn-block">Add product
                                            </button>
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
    function checkAddProduct() {
        var name = document.getElementById("name").value;
        var price = document.getElementById("price").value;
        var title = document.getElementById("title").value;
        var category = document.getElementById("category").value;
        if (name == null || name == "" || name.length == 0) {
            swal({title: "Empty name", text: "Enter product's name", icon: "error"});
            return false;
        }
        if (price == null || price == "") {
            swal({title: "Empty price", text: "Enter product's price", icon: "error"});
            return false;
        } else {
            var myRe = /(^\d*\.\d+$|^\d+$)/
            if (myRe.test(price) == false) {
                swal({title: "Price is not digital", text: "Enter product's price (ex: 1.1 or .4)", icon: "error"});
                return false;
            }
        }
        if (title == null || title == "") {
            swal({title: "Empty title", text: "Enter product's title", icon: "error"});
            return false;
        }
        if (category == null || category == "") {
            swal({title: "Empty category", text: "Choose a category", icon: "error"});
            return false;
        }
    }
</script>
<script>
    var msg = document.getElementById("message").value;
    if(msg=="successAddProduct"){
        swal({text:"Successfully added product", icon: "success"});
    }else if(msg=="errorAddProduct"){
        swal({text:"Failed to add product", icon: "error"});
    }
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