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
        <select name="category" class="custom-select custom-select-sm mb-1">
        </select>
        <div class="input-group mb-1">
            <input type="hidden" name="ascNo">
            <input type="text" name="name" class="form-control text-center" placeholder="자산 목록명" style="width: 100px;">
        </div>
    </div>
    `;
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { category, categories } = newState;
    const selectCategories = this.$target.querySelector('select[name="category"]');

    // 자산목록 상태 변경시
    if (category) {
      const editCategoryBtnGroup = this.$target.querySelector('#editCategoryBtnGroup');
      const addCategoryBtn = this.$target.querySelector('#addCategoryBtn');
  
      const ascNo = this.$target.querySelector('input[name="ascNo"]');
      ascNo.value = category.ascNo;

      const name = this.$target.querySelector('input[name="name"]');
      name.value = category.name;

      addCategoryBtn.classList.add("d-none");
      editCategoryBtnGroup.classList.remove("d-none");
      editCategoryBtnGroup.classList.add("d-flex");
      selectCategories.classList.add('d-none');

    // 자산목록 상태 변경시 (렌더링 시)
    } else if (categories) {
      selectCategories.innerHTML = categories.sort((a, b) => a.ascNo - b.ascNo).map((category, index) => {
        return `<option ${index === 0 ? "selected" : ""} value="${category.ascNo}">${category.name}</option>`
      }).join('');

    } else {
      this.render();
    }
  }

  setEvent () {
    const { insertCategory, editCategory, deleteCategory } = this.$props;

    // 카테고리 추가
    this.addEvent('click', '#addCategoryBtn', ({ target }) => {
      const ascNo = this.$target.querySelector('input[name="ascNo"]').value;
      const name = this.$target.querySelector('input[name="name"]').value;
      
      insertCategory({ ascNo:'', name });
    });

    // 카테고리 수정
    this.addEvent('click', '#editCategoryBtn', ({ target }) => {
      const ascNo = this.$target.querySelector('input[name="ascNo"]').value;
      const name = this.$target.querySelector('input[name="name"]').value;

      editCategory({ ascNo, name });
    });

    // 카테고리 삭제
    this.addEvent('click', '#deleteCategoryBtn', ({ target }) => {
      const ascNo = this.$target.querySelector('input[name="ascNo"]').value;
      const name = this.$target.querySelector('input[name="name"]').value;

      deleteCategory({ ascNo, name });
    });

    // 카테고리 선택
    this.addEvent('change', 'select[name="category"]', ({ target }) => {
      const editCategoryBtnGroup = this.$target.querySelector('#editCategoryBtnGroup');
      const addCategoryBtn = this.$target.querySelector('#addCategoryBtn');
      const selectCategories = this.$target.querySelector('select[name="category"]');
      
      this.$target.querySelector('input[name="ascNo"]').value = selectCategories.value;
      this.$target.querySelector('input[name="name"]').value = selectCategories.querySelector(`option[value="${selectCategories.value}"]`).textContent;

      addCategoryBtn.classList.add("d-none");
      editCategoryBtnGroup.classList.add("d-flex");
      editCategoryBtnGroup.classList.remove("d-none");
    });

    // 이벤트 등록버튼으로 되돌리기
    this.addEvent('click', '#cancelCategoryBtn', ({ target }) => {
      const editCategoryBtnGroup = this.$target.querySelector('#editCategoryBtnGroup');
      const addCategoryBtn = this.$target.querySelector('#addCategoryBtn');
      const selectCategories = this.$target.querySelector('select[name="category"]');
      
      addCategoryBtn.classList.remove("d-none");
      editCategoryBtnGroup.classList.remove("d-flex");
      editCategoryBtnGroup.classList.add("d-none");
      selectCategories.classList.remove('d-none');
    });
  }
}