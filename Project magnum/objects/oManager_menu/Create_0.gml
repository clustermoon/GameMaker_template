enum eMenuType {
	ScriptRunner, 
	PageTransfer
};

enum eMenuPages {
	load, 
	settings
};

Page_Main = {
	"Play" : [eMenuType.ScriptRunner, start_game],
	"Continue" : [eMenuType.PageTransfer, eMenuPages.load],
	"Settings" : [eMenuType.PageTransfer, eMenuPages.settings],
	"Exit" : [eMenuType.ScriptRunner, exit_game]
};

Page_Settings = {
	"Input" : [],	
	"Sound" : [],	
	"Graphics" : []	
};


