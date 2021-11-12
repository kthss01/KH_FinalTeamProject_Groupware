import Component from "../../core/Components.js";

export default class SideMenuCategory extends Component {

  template () {
    return `
    <div class="col-12 pb-1 mb-2 border-bottom">
        <button id="addCategoryBtn" type="button" class="btn btn-outline-dark btn-block mb-1">자산 목록 추가</button>
        <div id="editCategoryBtnGroup" class="btn-group d-none mb-1">
          <button id="editCategoryBtn" type="button" class="btn btn-outline-primary">수정</button>
          <button id="cancelCategoryBtn" type="button" class="btn btn-outline-dark"><i class="far fa-hand-point-up"></i></button>
          <button id="deleteCategoryBtn" type="button" class="btn btn-outline-danger">삭제</button>
        </div>
        <div class="input-group mb-1">
            <input type="hidden" name="ascNo">
            <input type="text" name="name" class="form-control text-center" placeholder="자산 목록명" style="width: 100px;">
        </div>
    </div>
    `;
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { category } = this.$state;
    // console.log(category);

    this.render(category);
  }

  render (category) {
    this.$target.innerHTML = this.template();

    const editCategoryBtnGroup = this.$target.querySelector('#editCategoryBtnGroup');
    const addCategoryBtn = this.$target.querySelector('#addCategoryBtn');

    if (category) {
      // console.log(category);

      const ascNo = this.$target.querySelector('input[name="ascNo"]');
      ascNo.value = category.ascNo;

      const name = this.$target.querySelector('input[name="name"]');
      name.value = category.name;

      addCategoryBtn.classList.add("d-none");
      editCategoryBtnGroup.classList.remove("d-none");
      editCategoryBtnGroup.classList.add("d-flex");
    } else {
      addCategoryBtn.classList.remove("d-none");
      editCategoryBtnGroup.classList.remove("d-flex");
      editCategoryBtnGroup.classList.add("d-none");
    }

    this.mounted(); 
  }

  setEvent () {

    const { insertCategory, editCategory, deleteCategory } = this.$props;

    // 카테고리 추가
    this.addEvent('click', '#addCategoryBtn', ({ target }) => {
      // console.log('addCategoryBtn');

      const ascNo = this.$target.querySelector('#ascNo').value;
      const name = this.$target.querySelector('#name').value;
      
      // console.log(calNo, name, color);

      insertCategory({ calNo, name, color });
    });

    // 카테고리 수정
    this.addEvent('click', '#editCategoryBtn', ({ target }) => {
      // console.log('editCategoryBtn');

      const ascNo = this.$target.querySelector('#ascNo').value;
      const name = this.$target.querySelector('#name').value;

      editCategory({ ascNo, name });
    });

    // 카테고리 삭제
    this.addEvent('click', '#deleteCategoryBtn', ({ target }) => {
      // console.log('deleteCategoryBtn');

      const ascNo = this.$target.querySelector('#ascNo').value;
      const name = this.$target.querySelector('#name').value;

      deleteCategory({ ascNo, name });
    });

    // 이벤트 등록버튼으로 되돌리기
    this.addEvent('click', '#cancelCategoryBtn', ({ target }) => {
      const editCategoryBtnGroup = this.$target.querySelector('#editCategoryBtnGroup');
      const addCategoryBtn = this.$target.querySelector('#addCategoryBtn');

      addCategoryBtn.classList.remove("d-none");
      editCategoryBtnGroup.classList.remove("d-flex");
      editCategoryBtnGroup.classList.add("d-none");
    });
  }
}