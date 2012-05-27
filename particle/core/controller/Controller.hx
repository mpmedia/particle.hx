package particle.core.controller;
import particle.core.tools.GenericEvent;
import particle.core.tools.GenericEventData;
import particle.core.tools.IGenericEventDispatcher;
import particle.core.tools.IGenericEventHandler;

/**
 * ...
 * @author marc paraiso
 */

class Controller implements IGenericEventDispatcher
{

	private var m_created:Bool;
	private var m_running:Bool;
	private var m_event:GenericEvent;
	private static var m_controller:MainController;
	
	public function new() 
	{
		m_created = false;
		m_running = false;
		m_event = null;
	}
	
	function create():Bool 
	{
		if (this.m_created) return false;
		this.m_created = this.onCreate();
		return this.m_created;
	}
	
	function destroy():Void 
	{
		if (!this.m_created) return;
		this.m_created = false;
		this.onDestroy();
	}
	
	function start():Void {
		if (this.m_running) return;
		if (this.m_created) {
			if (!this.create()) return;
		}
		this.m_running = true;
		this.onStart();
	}
	
	function finish(param:Int = -1):Void {
		if (!this.m_running) return;
		this.m_running = false;
		this.onFinish(param);
	}
	
	function isRunning():Bool 
	{
		return this.m_running;
	}
	
	public function onFinish(param:Int) 
	{
		
	}
	public function onStart() 
	{
		
	}
	public function onDestroy() 
	{
		
	}
	
	public function onCreate() 
	{
		
	}
	
	/* INTERFACE particle.core.tools.IGenericEventDispatcher */
	
	public function addGenericEventHandler(p_handler:IGenericEventHandler):Void 
	{
		if (this.m_event == null) this.m_event = new GenericEvent();
		this.m_event.addHandler(p_handler);
	}
	
	public function removeEventHandler(p_handler:IGenericEventHandler):Void 
	{
		if (this.m_event != null) this.m_event.removeHandler(p_handler);
	}
	
	public function dispatchGenericEvent(p_id:Int, p_data:GenericEventData):Void 
	{
		if (this.m_event == null) return;
		this.m_event.id = p_id;
		if (p_data != null) {
			this.m_event.data.copy(p_data);
		}else {
			this.m_event.data.reset();
		}
	}
	
	function addViewEventHandler(p_handler:IViewEventHandler) {
		m_controller.addGenericEventHandlerInternal(p_handler);
	}
	
	function removeViewEventHandler(p_handler) {
		m_controller.removeEventHandlerInternal(p_handler);
	}
	
	function dispatchControllerEvent(p_id:Int, p_data:GenericEvent = null) {
		dispatchGenericEvent(p_id, p_data);
	}
	
	static function setMainController(p_controller:MainController):Void {
		m_controller = p_controller;
	}
}