
        document.addEventListener("DOMContentLoaded", function () {
            var lazyImages = [].slice.call(document.querySelectorAll("img.lazy"));

            if ("IntersectionObserver" in window) {
                var lazyImageObserver = new IntersectionObserver(function (entries, observer) {
                    entries.forEach(function (entry) {
                        if (entry.isIntersecting) {
                            var lazyImage = entry.target;
                            lazyImage.src = lazyImage.dataset.src;
                            lazyImage.classList.add("loaded");
                            lazyImageObserver.unobserve(lazyImage);
                        }
                    });
                });

                lazyImages.forEach(function (lazyImage) {
                    lazyImageObserver.observe(lazyImage);
                });
            }
        });
