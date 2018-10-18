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
		password:{
			required:true,
			rangelength: [6, 20],
		},
		confirm_password:{
			required:true,
			equalTo:"#password",
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
		password:{
			required:"Password cannot be empty!",
			rangelength: "Password must be between 6 and 20!",
		},
		confirm_password:{
			required:"Confirm password cannot be empty!",
			equalTo:"Passwords must be the same!",
		},
	}
};
var validator = generate_validators(validate);
defaultEventAttach(validator);  
})();

