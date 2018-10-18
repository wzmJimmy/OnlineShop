(function() {
var pathnames = window.location.pathname.split('/');
console.log(pathnames);
if(pathnames[4]==="addProduct") $("#imageFile").addClass("product");
else $("#if-star").hide();

var validate = {rules:{},messages:{}};
var bill = batch_validate_appender(validate,"product",{rules:"required",messages:" cannot be empty!"});
var validator = generate_validators(validate);

if($("#productPrice").val()=="0.0") $("#productPrice").val("")

defaultEventAttach(validator);
})();