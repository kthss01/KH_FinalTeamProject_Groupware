import Reservation from '../components/Reservation.js';
import ReservationDetail from '../components/reservation/ReservationDetail.js';

export default class Router {
  $app;

  constructor() {
    window.addEventListener("popstate", this.router);

    document.addEventListener("DOMContentLoaded", () => {
      document.body.addEventListener("click", e => {
        if (e.target.closest('a') && e.target.closest('a').matches("[data-link]")) {
          e.preventDefault();
          this.navigateTo(e.target.closest('a').href);
        }
      });
    });
  }

  setApp($app) {
    this.$app = $app;
  }

  pathToRegex = path => new RegExp("^" + path.replace(/\//g, "\\/").replace(/:\w+/g, "(.+)") + "$");

  getParams = match => {
    const values = match.result.slice(1); // posts/2/4 이러면 2, 4가 들어감
    const keys = Array.from(match.route.path.matchAll(/:(\w+)/g)).map(result => result[1]); // :id?쿼리스트링들이 여기 들어간다고함 /id/code 일때 이렇게되는거 id만 받으면 그냥 2/3 이게 하나의 id로

    return Object.fromEntries(keys.map((key, i) => {
      return [key, values[i]];
    }));
  };

  navigateTo = url => {
    history.pushState(null, null, url);
    console.log("url", url);
    this.$app.setState({ isRoute: true, url });
  }

  router = () => {
    const routes = [{
        path: "/spring/reservation",
        view: Reservation
      },
      {
        path: "/spring/reservation/:id",
        view: ReservationDetail
      },
    ];

    // Test each route for potential match
    const potentialMatches = routes.map(route => {
      return {
        route: route,
        result: location.pathname.match(this.pathToRegex(route.path))
      };
    });

    let match = potentialMatches.find(potentialMatch => potentialMatch.result !== null);

    if (!match) {
      match = {
        route: routes[0],
        result: [location.pathname]
      }
    }

    return match.route.view;
  };

}