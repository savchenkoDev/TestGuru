document.addEventListener('turbolinks:load', function () {
  var categoryInput = document.querySelector('#category_input');
  categoryInput.addEventListener('blur', handlerCategoryBlur);
})

function handlerCategoryBlur(categoryInput) {
  var primary_param = document.querySelector('#primary_param');
  var secondary_param = document.querySelector('#secondary_param');
  var value = document.querySelector('#category_input').value;
  switch (value) {
    case 'single_badge':
      primary_param.classList.remove('hide');
      secondary_param.classList.remove('hide');
      break;
    default:
      primary_param.classList.remove('hide');
      secondary_param.classList.add('hide');
  }
}
