// search bar 
import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Bloody Mary", "Pina Colada"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };