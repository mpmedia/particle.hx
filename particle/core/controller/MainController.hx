package particle.core.controller;

class MainController extends Controller implements IViewEventHandler,IPlateformEventHandler {
	static private var m_styles:IStyles;
	static private var m_resourceLoader:IResourceLoader;
	private var m_quit:Bool;
	private var _controllerEvent:ControllerEvent;
	private var m_view(default,default):IView;
	private var m_language(default,default);
	
	public function new() {
		m_language = 0;
		m`_controllerEvent = null;
		m_quit = false;
		m_view = null;
		m_resourceLoader = null;
		m_styles = null;
		Controller.setMainController(this);
		//@TODO implement Plateform
		Plateform.getInstance().setController(this);
	}
	

	public function getLanguageName(p_language:Int):String {
		throw "Not implemented";
		return null;
	}
	public function getLanguageId(p_language:String):Int {
		throw "Not implemented";
		return null;
	}
	public function getLangageShortName(p_language:Int):String {
		throw "Not implemented";
		return null; 
	}
	function quit() {
		//@TODO implementer quit
		this.m_quit = true;
		//Plateform.getInstance().postQuitEvent();
	}
	public static function setResourceLoader(p_loader:IResourceLoader) {
		m_resourceLoader = p_loader;
	}
	public static function setStyles(p_styles:IStyles):Void {
		m_styles = p_styles;
	}
	
}