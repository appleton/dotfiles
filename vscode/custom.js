define([
  "module",
  "require",
  "customize-ui/utils",
  "vs/base/parts/quickinput/browser/quickInputList",
], function (module, require, utils, list) {
  /*
   * Import custom CSS from application support.
   */
  utils.addStyleSheet(
    "vscode-file://vscode-app/Users/aappleton/Library/Application Support/Code/User/globalStorage/iocave.monkey-patch/modules/custom.css"
  );
});
