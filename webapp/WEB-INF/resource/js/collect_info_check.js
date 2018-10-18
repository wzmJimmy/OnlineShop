(function() {
var validate = {
	rules:{
		firstName:"required",
		lastName:"required",
		email:{
			required:true,
			email:true,
		},
		phone:{
			required:true,
			rangelength: [9, 13],
		},
	},
	messages:{
		firstName:"First name cannot be empty!",
		lastName:"Last name cannot be empty!",
		email:{
			required:"Email cannot be empty!",
			email:"Email is invalid!",
		},
		phone:{
			required:"Phone cannot be empty!",
			rangelength:"Phone is invalid",
		},
	}
};

var bill = batch_validate_appender(validate,"billing",{rules:"required",messages:" cannot be empty!"});
var validator = generate_validators(validate);

var show = true;
for(i in bill){
	var id = bill[i];
	show = validator[id](id)()&&show;
}
if(!show){
	$("#check").removeAttr("checked");
	$("#check").prop("disabled",true);
	$("#billing").removeClass("collapse");
}

defaultEventAttach(validator);
})();

