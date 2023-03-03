<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url value="/view/user" var="url"/>
<div class="container-fluid mb-3">
  <div class="row px-xl-5">
    <div class="col-lg-8">
      <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item position-relative active" style="height: 430px;">
            <img class="position-absolute w-100 h-100" src="https://c4.iggcdn.com/indiegogo-media-prod-cld/image/upload/c_fill,w_695,g_auto,q_auto,dpr_2.6,f_auto,h_460/eorkfdwuzaiu8bd5zeoz  " style="object-fit: cover;">
            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
              <div class="p-3" style="max-width: 700px;">
                <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Shoes Fashion</h1>
                <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Những đôi giày tốt đưa bạn đến những nơi tuyệt vời để gặp những điều tuyệt vời hơn</p>
                <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="${url}/shop?c=0">Shop Now</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-4">
      <div class="product-offer mb-30" style="height: 200px;">
        <img class="img-fluid" src="https://www.grunge.com/img/gallery/shoes-werent-always-made-for-right-and-left-feet/intro-1654262661.jpg" alt="">
        <div class="offer-text">
          <h6 class="text-white text-uppercase">Save 20%</h6>
          <h3 class="text-white mb-3">Special Offer</h3>
          <a href="${url}/shop?c=0" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
      <div class="product-offer mb-30" style="height: 200px;">
        <img class="img-fluid" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfGcacS--TTGnEV9Q4U4QXZpbM65nUG9q6Vg&usqp=CAU" alt="">
        <div class="offer-text">
          <h6 class="text-white text-uppercase">Save 20%</h6>
          <h3 class="text-white mb-3">Special Offer</h3>
          <a href="${url}/shop?c=0" class="btn btn-primary">Shop Now</a>
        </div>
      </div>
    </div>
  </div>
</div>