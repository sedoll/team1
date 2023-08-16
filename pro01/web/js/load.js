// window.onload = function () {
//     var hash = window.location.hash;
//     if (hash) {
//       var targetRadio = document.getElementById(hash.substr(1));
//       if (targetRadio) {
//         targetRadio.checked = true;
//       }
//     }
//   };

function handleLinkClick(target) {
    window.onload = function() {
        var hash = window.location.hash;
        if (hash) {
            var targetRadio = document.getElementById(hash.substr(1));
            if (targetRadio) {
                targetRadio.checked = true;
            }
        }
    };
}
