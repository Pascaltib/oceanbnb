import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Welcome to", "Oceanbnb"],
    typeSpeed: 25,
    loop: false
  });
}

export { loadDynamicBannerText };
