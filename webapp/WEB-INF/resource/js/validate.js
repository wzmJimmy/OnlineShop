/* My criteria
 * now support required,email,rangelength,equalTo.
 */
var criteria ={
		required:(value,texts,message,...rest)=>{
			var element = rest[0];
			var bool = (typeof element == "boolean")?true:$(element).is(element);
			if(!(bool && value && value.length>0)) texts.push(message); 
		},	
		email:(value,texts,message,...rest)=>{
			if(!(value && value.match(/.+@.+/g))) texts.push(message); 
		},
		rangelength:(value,texts,message,...rest)=>{
			var range = rest[0];
			if(!(value && value.length>=range[0] && value.length<=range[1])) texts.push(message); 
		},
		equalTo:(value,texts,message,...rest)=>{
			var id = rest[0];
			if(!(value && $(id).val()==value)) texts.push(message); 
		},
	}
/*
 * My validator_generator:
 * @val {rules={},messages={}}. 
 * ## 	naively assume that rules have same indexes as messages ## 
 * ## 	naively assume error_labels are already built			## 
 *  return validator callback.
 */
function validator_generator(val){ 
	return (id) => {
		return function(){var value = $("#" + id).val();
		var errtexts = [];
		if(typeof val.rules == "string"){
			criteria[val.rules](value,errtexts,val.messages,true);
		}else{
			for(rule in val.rules){
				criteria[rule](value,errtexts,val.messages[rule],val.rules[rule]);
			}
		}
		if(errtexts.length>0){
			var texts = errtexts.join('<br/>');
			$("#error-"+ id).html(texts).show();
			$("#" + id).removeClass("is-valid").addClass("is-invalid");
	    	return false;
		}else{
	    	$("#error-" + id).hide();
	    	$("#" + id).removeClass("is-invalid").addClass("is-valid");
	    	return true;
	    } 
			
		}
	}
}
/*
 * My generate_validators: 
 * @valset {rules={},messages={}}. 
 * ## naively assume that rules have same indexes as messages ## 
 * return object of validator
 * callbacks.
 */
function generate_validators(valset){
	var validators = {};
	for(ind in valset.rules){
		$("#" + ind).parent().append(`<label id=${"error-"+ind} class="error_feedback"></label>`);
		validators[ind]=validator_generator({rules:valset.rules[ind],messages:valset.messages[ind]})
	}
	return validators;
} 
/*
 * batch_validate_appender: 
 * convenient for a batch of same criteria validator.
 */
function batch_validate_appender(valset,classname,rule_message){
	var batch = $("."+classname);
	var length = batch.length;
	var isString = typeof rule_message.rules == "string";
	var ids = [];
	for(var i=0;i<length;i++){
		var id = batch[i].id
		ids.push(id);
		if(isString){
			valset.rules[id]=rule_message.rules;
			valset.messages[id] = upperFirstChar(id) + rule_message.messages;
		}else{
			if(!valset.rules[id]){[valset.rules[id],valset.messages[id]] = [{},{}];}
			for(ind in rule_message.rules){
				valset.rules[id][ind] = rule_message.rules[ind];
				valset.messages[id][ind] = upperFirstChar(id) + rule_message.messages[ind];
			}
		}
	}
	return ids;
} 
/*
 * defaultEventAttach: 
 * ## naively assume that submit button with id submit ## 
 */
function defaultEventAttach(validator){
	for(id in validator){
		$("#"+id).blur(validator[id](id));
	}
	$("#submit").parent().append(`<div id=${"error-submit"} class="error_feedback"></div>`);
	$("#submit").click(function() {
		var bool = true;
		for(id in validator){
			bool = validator[id](id)() && bool;
		}
		if(!bool) {
			$("#error-submit").html("Please check the form again.");
			document.documentElement.scrollTop = 0;
			return false;
		}
		return true;
	});
}
function upperFirstChar(string){
	 return string.charAt(0).toUpperCase() + string.substr(1);
}