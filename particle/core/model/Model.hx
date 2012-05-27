package particle.core.model;


class Model implements particle.core.tools.ISerializable {
	
	private var m_config(default,default):Xml;
	private static var m_model(default,default):Model = null;
	private static var m_appVendor(default,default):String = "";
	private static var m_appID(default,default):String = "";
	private static var m_appName(default,default):String = "";
	private static var m_appVersion(default,default):String = "";
	private static var m_defaultConfig(default,default):String = "";
	
	public function new() {
		this.m_config = new Xml();

	}
	
	public static function setInstance(model:Model) {
		m_model = model;
	}
	
	public static function getInstance():Model{
		return m_model;
	}
	
	public function create() {
		this.onCreate();
	}
	
	public function destroy():Void 
	{
		this.m_config = new Xml();
		this.onDestroy();
	}
	
	private function onCreate() {
		
	}
	
	private function onDestroy() {
		
	}
	
	/* INTERFACE particle.core.tools.ISerializable */
	
	public function serialize(object:Dynamic):Dynamic 
	{
		return object;
	}
	
	public function deserialize(object:Dynamic):Bool 
	{
		return true ; 
	}
	

	
	
}