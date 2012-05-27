package particle.core.tools;

 interface IGenericEventDispatcher {
	public function addGenericEventHandler(p_handler:IGenericEventHandler):Void;
	public function removeEventHandler(p_handler:IGenericEventHandler):Void;
	public function dispatchGenericEvent(p_id:Int,p_data:GenericEventData):Void;
}