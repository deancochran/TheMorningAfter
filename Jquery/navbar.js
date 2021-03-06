var scrollposition = window.pageYOffset;
            window.onscroll = function() {
            var currentScrollPos = window.pageYOffset;
              if (scrollposition > currentScrollPos) {
                  document.getElementById("navbar").style.top = "0";
                } else {
                  document.getElementById("navbar").style.top = "-150px";
                }
              scrollposition = currentScrollPos;
            }