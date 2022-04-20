(function ($) {
    "use strict"; // Start of use strict

    // Toggle the side navigation
    $("#sidebarToggle, #sidebarToggleTop").on('click', function (e) {
        $("body").toggleClass("sidebar-toggled");
        $(".sidebar").toggleClass("toggled");
        if ($(".sidebar").hasClass("toggled")) {
            $('.sidebar .collapse').collapse('hide');
        }
        ;
    });

    // Close any open menu accordions when window is resized below 768px
    $(window).resize(function () {
        if ($(window).width() < 768) {
            $('.sidebar .collapse').collapse('hide');
        }
        ;

        // Toggle the side navigation when window is resized below 480px
        if ($(window).width() < 480 && !$(".sidebar").hasClass("toggled")) {
            $("body").addClass("sidebar-toggled");
            $(".sidebar").addClass("toggled");
            $('.sidebar .collapse').collapse('hide');
        }
        ;
    });

    // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
    $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function (e) {
        if ($(window).width() > 768) {
            var e0 = e.originalEvent,
                delta = e0.wheelDelta || -e0.detail;
            this.scrollTop += (delta < 0 ? 1 : -1) * 30;
            e.preventDefault();
        }
    });

    // Scroll to top button appear
    $(document).on('scroll', function () {
        var scrollDistance = $(this).scrollTop();
        if (scrollDistance > 100) {
            $('.scroll-to-top').fadeIn();
        } else {
            $('.scroll-to-top').fadeOut();
        }
    });

    // Smooth scrolling using jQuery easing
    $(document).on('click', 'a.scroll-to-top', function (e) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top)
        }, 1000, 'easeInOutExpo');
        e.preventDefault();
    });

})(jQuery);// End of use strict

function go_save() {

    if (document.joinform.id.value == "") {
        alert("아이디를 입력해주세요.");
        console.log(document.joinform.id.value);
        document.joinform.c_id.focus();
    } else if (document.joinform.c_pwd.value == "") {
        alert("비밀번호를 입력해주세요.");
        document.joinform.c_pwd.focus();
    } else if (document.joinform.c_pwd.value != document.joinform.c_pwd2.value) {
        alert("비밀번호가 일치하지 않습니다.");
        document.joinform.c_pwd2.focus();
    } else if (document.joinform.c_name.value == "") {
        alert("이름을 입력해주세요.");
        document.joinform.c_name.focus();
    } else if (document.joinform.c_email.value == "") {
        alert("이메일을 입력해주세요.");
        document.joinform.c_email.focus();
    } else if (document.joinform.c_phone.value == "") {
        alert("전화번호를 입력해주세요.");
        document.joinform.c_phone.focus();
    } else if (document.joinform.c_dep.value == "") {
        alert("부서를 입력해주세요.");
        document.joinform.c_dep.focus();
    } else if (document.joinform.c_position.value == "") {
        alert("직책을 입력해주세요.");
        document.joinform.c_position.focus();
    } else {
        document.joinform.action = "join";
        document.joinform.submit();
    }
}