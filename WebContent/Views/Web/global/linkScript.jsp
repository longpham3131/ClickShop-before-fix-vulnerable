
<!-- Thư viện hỗ trợ Jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<%--BS4 JS--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Loading page -->
<script>
    $(window).on("load", function () {
        $(".loader-wrapper").fadeOut("slow");
    });
</script>

<%--Search tool animation --%>
<script type="text/javascript">
    $(document).ready(function () {
        $("#sidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $('#dismiss, .overlay').on('click', function () {
            $('#sidebar').removeClass('active');
            $('.overlay').removeClass('active');
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').addClass('active');
            $('.overlay').addClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });
    });
</script>

<%--Search JS --%>
<script src="<%=request.getContextPath()%>/Views/Web/js/searchNameProduct.js"></script>

<%--Back To Top JS --%>
<a href="#" class="backToTop cd-top text-replace js-cd-top"></a>
<script src="<%=request.getContextPath()%>/Views/Web/js/main.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/util.js"></script>

<!-- OWL CAROUSEL JS -->
<script src="<%=request.getContextPath()%>/Views/Web/js/owl.carousel.min.js"></script>
<script>
    $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 10,
        autoHeight: true,

        responsive: {
            0: {
                items: 1
            },
        }
    })
</script>

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 3,
        spaceBetween: 15,
        loop: true,
        pagination: {},
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
</script>

<%--Định dạng tiền sản phẩm --%>
<script>
    let listGia = document.querySelectorAll(".priceProduct");
    for (i = 0; i < listGia.length; i++) {
        listGia[i].innerHTML = new Intl.NumberFormat('vn-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(parseInt(listGia[i].innerHTML));
    }
</script>

<script>
    window.onscroll = function() {myFunction()};

    var header = document.getElementById("myHeader");
    var sticky = header.offsetTop;

    function myFunction() {
        if (window.pageYOffset > sticky) {
            header.classList.add("scrollHeader");
        } else {
            header.classList.remove("scrollHeader");
        }
    }
</script>