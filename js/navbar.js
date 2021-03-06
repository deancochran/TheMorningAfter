var scrollposition = window.pageYOffset;
            window.onscroll = function() {
            var currentScrollPos = window.pageYOffset;
            // if (scrollposition > document.getElementById("navbar")) {

            // }
            if (scrollposition > currentScrollPos) {
                document.getElementById("navbar").style.top = "0";
              } else {
                document.getElementById("navbar").style.top = "-120px";
              }
              scrollposition = currentScrollPos;
            }