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

        // 자산목록 상태 변경시
        if (categories) {
            list.innerHTML = categories.map((category) => {
                const { ascNo, name } = category;
                return `<a id="ascNo${ascNo}" href="/spring/reservation/${ascNo}" class="list-group-item list-group-item-action" data-link data-value="${name}">${name}</a>`;
            }).join('');
        // 자산 상태 변경시
        } else if (assets) {
            const arr = [ ...new Set(assets.map((asset) => asset.extendedProps.ascNo)) ];

            arr.forEach((ascNo) => {
                const tag = this.$target.querySelector(`#ascNo${ascNo}`);
                tag.innerHTML = tag.dataset['value'];
            });

            assets.forEach((asset) => {
                const { id, title, extendedProps: { ascNo } } = asset;
                const events = asset.getEvents().filter((event) => event.extendedProps.empNo == empNo);
                const aTag = this.$target.querySelector(`#ascNo${ascNo}`);
                
                aTag.innerHTML += `
                <li id="asNo${id}" type="none">
                    <span class="badge text-white" style="background-color: ${asset.extendedProps.color}; opacity: 0.8; width: 30px;">${events.length}</span>
                    &nbsp;&nbsp;
                    ${title}
                </li>
                `;
            });
        } else {
            this.render();
        }        
    }
}