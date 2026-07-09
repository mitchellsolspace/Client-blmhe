/**
 * @function
 *
 * @param {function} action - A function to run
 *
 * @example
 *
 *     onWindowResize(() => {console.log("I've been resized!");})
 */
export let onWindowResize = action => {
  // See https://stackoverflow.com/questions/8898412/iphone-ipad-triggering-unexpected-resize-events for why I have to go through this junk
  let windowWidth = $(window).width();
  $(window).on("resize", () => {
    if ($(window).width() != windowWidth) {
      // Update the window width for next time
      windowWidth = $(window).width();
      action();
    }
  });
};

/**
 * @function
 *
 * @param {string} clickTarget - A class or id
 * @param {function} action - A function to run
 *
 * @example
 *
 *     onClick('.class', () => {console.log("hi");})
 */
export let onClick = (clickTarget, action) => {
  $(clickTarget).click(() => {
    action();
  });
};