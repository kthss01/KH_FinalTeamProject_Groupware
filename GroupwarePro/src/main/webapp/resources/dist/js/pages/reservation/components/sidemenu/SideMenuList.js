import Component from "../../core/Components.js";

export default class SideMenuList extends Component {

    template () {
        return `
        <div id="rezList" class="list-group mx-3" style="width: 100%">
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
                return `<a id="ascNo${ascNo}" href="/spring/reservation/${ascNo}" class="list-group-item list-group-item-action" data-link data-value="${name}">${name}</a>`;
            }).join('');
        } else if (assets) {
            console.log('assets', assets);

            // const aTags = this.$target.querySelectorAll("a");
            // console.log('aTags', aTags);
            // aTags.forEach((tag) => {
            //     tag.innerHTML = tag.dataset['value'];
            // });
            const arr = [ ...new Set(assets.map((asset) => asset.extendedProps.ascNo)) ];
            console.log(arr);
            arr.forEach((ascNo) => {
                const tag = this.$target.querySelector(`#ascNo${ascNo}`);
                tag.innerHTML = tag.dataset['value'];
            });

            assets.forEach((asset) => {
                const { id, title, extendedProps: { ascNo } } = asset;
                const events = asset.getEvents().filter((event) => event.extendedProps.empNo == empNo);
                // console.log(title, ascNo, events);

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