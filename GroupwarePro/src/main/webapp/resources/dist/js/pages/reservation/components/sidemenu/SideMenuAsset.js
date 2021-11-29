import Component from "../../core/Components.js";

export default class SideMenuAsset extends Component {

  template () {
    return `
    <div class="col-12 pb-1 mb-2 border-bottom">
        <button id="addAssetBtn" type="button" class="btn btn-outline-dark btn-block mb-1">자산 추가</button>
        <div id="editAssetBtnGroup" class="btn-group d-none mb-1">
          <button id="editAssetBtn" type="button" class="btn btn-outline-primary">수정</button>
          <button id="cancelAssetBtn" type="button" class="btn btn-outline-dark"><i class="far fa-hand-point-up"></i></button>
          <button id="deleteAssetBtn" type="button" class="btn btn-outline-danger">삭제</button>
        </div>
        <select name="category" class="custom-select custom-select-sm mb-1">
        </select>
        <div class="input-group mb-1">
            <input type="hidden" name="id">
            <input type="text" name="title" class="form-control" placeholder="자산명" style="width: 100px;">
            <input type="color" name="color" class="form-control p-1" value="#0275d8">
        </div>
    </div>
    `;
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { categories, asset } = newState;

    const selectCategories = this.$target.querySelector('select[name="category"]');

    // 자산목록 상태 변경시
    if (categories) {
      selectCategories.innerHTML = categories.sort((a, b) => a.ascNo - b.ascNo).map((category, index) => {
        return `<option ${index === 0 ? "selected" : ""} value="${category.ascNo}">${category.name}</option>`
      }).join('');
      
    // 자산 상태 변경시
    } else if (asset) {
      const editAssetBtnGroup = this.$target.querySelector('#editAssetBtnGroup');
      const addAssetBtn = this.$target.querySelector('#addAssetBtn');

      const id = this.$target.querySelector('input[name="id"]');
      const title = this.$target.querySelector('input[name="title"]');
      const color = this.$target.querySelector('input[name="color"]');

      id.value = asset.id;
      title.value = asset.title;
      color.value = asset.color;
      selectCategories.value = asset.ascNo;

      addAssetBtn.classList.add("d-none");
      editAssetBtnGroup.classList.remove("d-none");
      editAssetBtnGroup.classList.add("d-flex");
    } else {
      this.render();
    }
  }

  setEvent () {
    const { insertAsset, editAsset, deleteAsset } = this.$props;

    // 자산 추가
    this.addEvent('click', '#addAssetBtn', ({ target }) => {
      const asNo = this.$target.querySelector('input[name="id"]').value;
      const name = this.$target.querySelector('input[name="title"]').value;
      const color = this.$target.querySelector('input[name="color"]').value;
      const ascNo = this.$target.querySelector('select[name="category"]').value;
      const ascName = this.$target.querySelector(`select[name="category"] option[value="${ascNo}"]`).textContent;
      
      insertAsset({ asNo:'', name, color, ascNo, ascName });
    });

    // 자산 수정
    this.addEvent('click', '#editAssetBtn', ({ target }) => {
      const asNo = this.$target.querySelector('input[name="id"]').value;
      const name = this.$target.querySelector('input[name="title"]').value;
      const color = this.$target.querySelector('input[name="color"]').value;
      const ascNo = this.$target.querySelector('select[name="category"]').value;
      const ascName = this.$target.querySelector(`select[name="category"] option[value="${ascNo}"]`).textContent;

      editAsset({ asNo, name, color, ascNo, ascName });
    });

    // 자산 삭제
    this.addEvent('click', '#deleteAssetBtn', ({ target }) => {
      const asNo = this.$target.querySelector('input[name="id"]').value;
      const name = this.$target.querySelector('input[name="title"]').value;
      const color = this.$target.querySelector('input[name="color"]').value;
      const ascNo = this.$target.querySelector('select[name="category"]').value;
      const ascName = this.$target.querySelector(`select[name="category"] option[value="${ascNo}"]`).textContent;

      deleteAsset({ asNo, name, color, ascNo, ascName });
    });

    // 이벤트 등록버튼으로 되돌리기
    this.addEvent('click', '#cancelAssetBtn', ({ target }) => {
      const editAssetBtnGroup = this.$target.querySelector('#editAssetBtnGroup');
      const addAssetBtn = this.$target.querySelector('#addAssetBtn');

      addAssetBtn.classList.remove("d-none");
      editAssetBtnGroup.classList.remove("d-flex");
      editAssetBtnGroup.classList.add("d-none");
    });
  }
}