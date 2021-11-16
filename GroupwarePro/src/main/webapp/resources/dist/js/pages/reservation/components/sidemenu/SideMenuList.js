import Component from "../../core/Components.js";

export default class SideMenuList extends Component {

    template () {
        return `
        <div id="rezList" class="list-group mx-3" style="width: 100%">
            <a href="#" class="list-group-item list-group-item-action">One</a>
            <a href="#" class="list-group-item list-group-item-action">Two
                <li>
                    303호
                    <span class="badge badge-secondary badge-pill">12</span>
                </li>
                <li>
                    Item 2b
                    <span class="badge badge-secondary badge-pill">4</span>
                </li>
            </a>
            <a href="#" class="list-group-item list-group-item-action">Three
                <li>
                    Item 3a
                    <span class="badge badge-secondary badge-pill">12</span>
                </li>
                <li>
                    Item 3b
                    <span class="badge badge-secondary badge-pill">12</span>
                </li>
            </a>
        </div>
        `;
    }

    setState (newState) {
        this.$state = { ...this.$state, ...newState };

        const { assets=null, categories=null, events=null } = newState;

        const list = this.$target.querySelector('#rezList');

        if (categories) {
            // console.log(categories);
            list.innerHTML = categories.map((category) => {
                const { ascNo, name } = category;
                return `<a id="ascNo${ascNo}" href="/spring/reservation/${ascNo}" class="list-group-item list-group-item-action" data-link>${name}</a>`;
            }).join('');
        } else if (assets) {
            // console.log(assets);

            assets.forEach((asset) => {
                const { id, title, extendedProps: { ascNo } } = asset;
                const events = asset.getEvents().filter((event) => event.extendedProps.empNo == empNo);
                console.log(title, ascNo, events);

                const aTag = this.$target.querySelector(`#ascNo${ascNo}`);
                aTag.innerHTML += `
                <li id="asNo${id}">
                    ${title}
                    <span class="badge badge-secondary badge-pill">${events.length}</span>
                </li>
                `;
            });
        } else {
            this.render();
        }        
    }

}