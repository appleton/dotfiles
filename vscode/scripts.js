setTimeout(() => {
  // How much taller I made the elements
  const timesBigger = 2;
  // How much extra padding I added to the container
  const extraPadding = 11;

  require([
    "vs/base/parts/quickopen/browser/quickOpenWidget",
    "vs/base/parts/quickopen/browser/quickOpenViewer"
  ], function({ QuickOpenWidget }, { Renderer }) {
    QuickOpenWidget.prototype.getHeight = function(input) {
      const renderer = input.renderer;

      if (!input) {
        const itemHeight = renderer.getHeight(null);

        return this.options.minItemsToShow
          ? this.options.minItemsToShow * itemHeight
          : 0;
      }

      let height = 0;

      let preferredItemsHeight;
      if (this.layoutDimensions && this.layoutDimensions.height) {
        preferredItemsHeight =
          (this.layoutDimensions.height -
            50) /* subtract height of input field (30px) and some spacing (drop shadow) to fit */ *
          0.4 /* max 40% of screen */;
      }

      if (
        !preferredItemsHeight ||
        preferredItemsHeight > QuickOpenWidget.MAX_ITEMS_HEIGHT
      ) {
        preferredItemsHeight = QuickOpenWidget.MAX_ITEMS_HEIGHT;
      }

      const entries = input.entries.filter(e =>
        this.isElementVisible(input, e)
      );
      const maxEntries = this.options.maxItemsToShow || entries.length;
      for (let i = 0; i < maxEntries && i < entries.length; i++) {
        // Here is one hack, we multiply the height by 2 to get 44px per row.
        const entryHeight = renderer.getHeight(entries[i]) * timesBigger;
        if (height + entryHeight <= preferredItemsHeight) {
          height += entryHeight;
        } else {
          break;
        }
      }

      // Here is another hack, add some padding to match the CSS
      return height + extraPadding;
    };

    // This makes the quick open window scroll down when focus moves beyond the
    // visible portion
    Renderer.prototype.getHeight = function() {
      return 44;
    };
  });
}, 2000);
