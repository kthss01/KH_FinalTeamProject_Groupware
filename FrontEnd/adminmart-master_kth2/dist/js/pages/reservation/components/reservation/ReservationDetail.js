import Component from "../../core/Components.js";

export default class ReservationDetail extends Component {

    template () {
        return `
        `;
    }

    setState (newState) {
        this.$state = { ...this.$state, ...newState };
        this.render();
    }

    setEvent () {
        
    }
}