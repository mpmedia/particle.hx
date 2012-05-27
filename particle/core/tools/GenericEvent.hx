package particle.core.tools;

class GenericEvent extends EventBase {
	public var id:Int;
	public var data:GenericEventData ;
	
	public function new() {
		super();
		setAsync(true);
		id = 0;
		data = new GenericEventData();
	}
	
	override public function copy(paramEventBase:EventBase, paramBoolean:Bool):Void {
		super.copy(paramEventBase, paramBoolean);
		this.id = cast(paramEventBase,GenericEvent).id;
		this.data.copy(cast(paramEventBase, GenericEvent).data);
	}
	
	override private function invokeHandler(p_sender:Dynamic, 	p_handler:Dynamic):Void {
		cast(p_handler, IGenericEventHandler).onGenericEvent(p_sender, this);
	}
	
	override private function create():EventBase {
		return new GenericEvent();
	}
	
	function toString():String
	{
		return "[object GenericEvent]";
	}

}