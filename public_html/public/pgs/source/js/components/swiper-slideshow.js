// Add in more as needed from this list: https://swiperjs.com/api/#custom-build
import { Swiper, Lazy } from "swiper/js/swiper.esm.js";

// Install modules if importing
Swiper.use([Lazy]);

// Note I've not included Navigation intentionally

function runSwiper() {
  if ($(".js-swiper-slideshow").length > 0) {
    $(".js-swiper-container").each(function(i) {
      let slidesPerView;
      let slideCount = $(this).find(".swiper-slide").length;
      if (slideCount > 1) {
        slidesPerView = 1.05;
      } else {
        slidesPerView = 1;
      }
      new Swiper($(this)[0], {
        // Disable preloading of all images
        preloadImages: false,
        // Enable lazy loading
        lazy: true,
        watchOverflow: true,
        grabCursor: true,
        loop: false,
        lazy: {
          loadPrevNext: true
        },
        // navigation: {
        //   nextEl: ".swiper-button-next",
        //   prevEl: ".swiper-button-prev",
        //   disabledClass: "swiper-button-disabled"
        // },
        spaceBetween: 16,
        slidesPerView: slidesPerView
      });
    });
  }
}

export { runSwiper };
