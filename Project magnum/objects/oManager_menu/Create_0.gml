enum eMenuType {
	ScriptRunner, 
	PageTransfer
};

enum eMenuPages {
	main,
	load, 
	settings
};

Page_Main = {
	"Play" : [eMenuType.ScriptRunner, start_game],
	"Continue" : [eMenuType.PageTransfer, eMenuPages.load],
	"Settings" : [eMenuType.PageTransfer, eMenuPages.settings],
	"Exit" : [eMenuType.ScriptRunner, exit_game]
};

var _l = variable_struct_get_names(Page_Main);
Page_Main_buttons = array_create(array_length(_l), noone);

Page_Settings = {
	"Input" : [],	
	"Sound" : [],	
	"Graphics" : [],
	"Back" : []
};


current_page = 0;
cursor = 0;

