// If your components require any hooks or custom uploaders, or if your pages
// require connect parameters, uncomment the following lines and declare them as
// such:
//
import { alertOnMountHook } from "../vendor/hooks/alert";
// import * as Params from "./params";
// import * as Uploaders from "./uploaders";
//
console.log({ Hooks: { alertOnMountHook } });

(function () {
  window.storybook = { Hooks: { alertOnMountHook } };
})();

// If your components require alpinejs, you'll need to start
// alpine after the DOM is loaded and pass in an onBeforeElUpdated
//
// import Alpine from 'alpinejs'
// window.Alpine = Alpine
// document.addEventListener('DOMContentLoaded', () => {
//   window.Alpine.start();
// });

// (function () {
//   window.storybook = {
//     LiveSocketOptions: {
//       dom: {
//         onBeforeElUpdated(from, to) {
//           if (from._x_dataStack) {
//             window.Alpine.clone(from, to)
//           }
//         }
//       }
//     }
//   };
// })();
