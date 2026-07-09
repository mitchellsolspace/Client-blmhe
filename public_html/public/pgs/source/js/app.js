// jQuery and Bootstrap are added as tags on _layout.twig because I couldn't get Bootstrap to work through includes

import { runSwiper } from "components/swiper-slideshow.js";
import skipLinks from "components/skipLinks";

$(document).ready(function () {
  runSwiper();
  skipLinks();
});
