function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "last"};
	this.sidHashMap["last"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S1>"] = {sid: "last:4"};
	this.sidHashMap["last:4"] = {rtwname: "<S1>"};
	this.rtwnameHashMap["<Root>/Led "] = {sid: "last:4"};
	this.sidHashMap["last:4"] = {rtwname: "<Root>/Led "};
	this.rtwnameHashMap["<S1>:2"] = {sid: "last:4:2"};
	this.sidHashMap["last:4:2"] = {rtwname: "<S1>:2"};
	this.rtwnameHashMap["<S1>:6"] = {sid: "last:4:6"};
	this.sidHashMap["last:4:6"] = {rtwname: "<S1>:6"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
