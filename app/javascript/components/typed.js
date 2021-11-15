import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Welcome to", "Oceanbnb"],
    typeSpeed: 50,
    loop: false
  });
}

export { loadDynamicBannerText };
