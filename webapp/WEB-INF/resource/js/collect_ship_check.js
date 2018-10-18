(function() {
var validate = {rules:{},messages:{}};
var bill = batch_validate_appender(validate,"shipping",{rules:"required",messages:" cannot be empty!"});
var validator = generate_validators(validate);

var show = true;
for(i in bill){
	var id = bill[i];
	show = validator[id](id)()&&show;
}
if(!show){
	$("#check").removeAttr("checked");
	$("#check").prop("disabled",true);
	$("#shipping").removeClass("collapse");
}

defaultEventAttach(validator);
})();