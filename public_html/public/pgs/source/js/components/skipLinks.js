// Make skip links work on mobile. Written 1/2020. See https://axesslab.com/skip-links/
export default function() {
  document.getElementById("skip-links").addEventListener("click", function(e) {
    e.preventDefault();
    var target = document.getElementById("main");
    target.setAttribute("tabindex", "-1");
    target.focus();
  });
};