document.addEventListener('turbolinks:load', function () {
  var categoryInput = document.querySelector('#category_input');
  categoryInput.addEventListener('blur', handlerCategoryBlur);
})

function handlerCategoryBlur(categoryInput) {
  var primaryParam = document.querySelector('#primary_param');
  var secondaryParam = document.querySelector('#secondary_param');
  var value = document.querySelector('#category_input').value;
  switch (value) {
    case 'single_badge':
      primaryParam.classList.remove('hide');
      secondaryParam.classList.remove('hide');
      break;
    default:
      primaryParam.classList.remove('hide');
      secondaryParam.classList.add('hide');
  }
}
