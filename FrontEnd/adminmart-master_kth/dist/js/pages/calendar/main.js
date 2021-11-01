import App from './App.js';
import Router from './core/Router.js'

new App(document.querySelector('#app'), { router: new Router() });