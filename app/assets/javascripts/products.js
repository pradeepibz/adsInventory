$(document).on('click', '.submit-product-import', function(){
  $('.product-import').trigger('click');
});
$(document).on('change', ".product-import", function(){
  if (this.files && this.files[0]) {
    var fileExtension = ['csv', 'xls', 'xlsx'];
    if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
        alert("Only formats are allowed : "+fileExtension.join(', '));
    }
    else {
      $('#product-form').submit();
      $(".new-product-btn").hide();
      $(".submit-product-import").hide();
    }
  };
});
function validateQty(event){
  if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
    event.preventDefault();
  }
}
$(document).ready(function() {
  $('.selectpicker').selectpicker();
});
$(document).on("change", ".selectpicker", function(){
  $('.selectpicker').selectpicker('refresh');
});
$(document).on("click", ".add-new-item", function(){
  $('.selectpicker').selectpicker('refresh');
});