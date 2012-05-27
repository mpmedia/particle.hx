package particle.core.tools;

class EventBase {
	private var m_async:Bool;
	private var m_handler:Dynamic;
	private var m_handlers:Array<Dynamic>;
	private static var m_asyncSenders:Array<Dynamic> = new Array<Dynamic>();
	private static var m_asyncEvents:Array<Dynamic> = new Array<Dynamic>();
	
	public function new(){
		m_async = false;
		m_handler = null;
		m_handlers = null;
	}
	
	public function reset(){
		this.m_handler = null;
		this.m_handlers = null;
	}
	
	public  function setAsync(paramBoolean:Bool):Void {
		this.m_async = paramBoolean;
	}
	
	public  function isAsync():Bool {
		return this.m_async;
	}
	
	public function addHandler(p_handler:Dynamic):Void {
		if (null == p_handler) {
			return;
		}
		if (null != this.m_handlers) {
			var i:Int = 0;
			while ( i < this.m_handlers.length) {
				if (this.m_handlers[i] == p_handler) {
					return;
				}
				i++;
			}
			this.m_handlers.push(p_handler);
			return;
		}
		if (null == this.m_handler) {
			this.m_handler = p_handler;
			return;
		}
		if (this.m_handler == p_handler) {
			return;
		}
		this.m_handlers = new Array<Dynamic>();
		this.m_handlers.push(this.m_handler);
		this.m_handlers.push(p_handler);
		this.m_handler = null;
		
	}

	public function removeHandler(p_handler:Dynamic):Void {
		var i:Int = 0;
		if (p_handler == null) return;
		if (this.m_handlers != null) {
			while (i < this.m_handlers.length) {
				if (this.m_handlers[i] == p_handler) {
					this.m_handlers.remove(p_handler);
					if (this.m_handlers.length == 1) {
						this.m_handler = this.m_handlers.pop();
						this.m_handlers = null;
					}
					return;
				}
				i++;
			}
		}
		if (this.m_handler == p_handler) {
			this.m_handler = null;
		}
		return;
	}
	
	public function dispatch(p_sender:Dynamic):Void {
		if (this.m_async) {
			var localEventBase:EventBase =clone(true);
			localEventBase.m_async = false;
			EventBase.m_asyncEvents.push(localEventBase);
			EventBase.m_asyncSenders.push(p_sender);
			return;
		}
		if (null != this.m_handler) {
			invokeHandler(p_sender, this.m_handler);
		}
		var i:Int = 0;
		while ((null != this.m_handlers) && (i < this.m_handlers.length)) {
			invokeHandler(p_sender, this.m_handlers[i]);
			i++;
		}
	}
	
	public static function dispatchAsync():Void {
		if (null ==  m_asyncEvents) return;
		var i:Int = 0;
		while (i< m_asyncEvents.length) 
		{
			var localEventBase:EventBase = m_asyncEvents[i];
			localEventBase.dispatch(m_asyncSenders[i]);
		}
		m_asyncEvents.splice(0, m_asyncEvents.length);
		m_asyncSenders.splice(0, m_asyncSenders.length);
		i++;
	}
	
	public function clone(paramBoolean:Bool):EventBase {
		var localEventBase:EventBase = create();
		localEventBase.copy(this, paramBoolean);
		return localEventBase;
	}
	
	public function copy(paramEventBase:EventBase,paramBoolean:Bool):Void {
		this.m_async = paramEventBase.m_async;
		if (!paramBoolean)  return;
		this.m_handler = paramEventBase.m_handler;
		if (null == paramEventBase.m_handlers) {
			this.m_handlers = null;
		}else {
			if (null == this.m_handlers) {
				this.m_handlers = new Array<Dynamic>();
			}
			for ( handler in paramEventBase.m_handlers) {
				this.m_handlers.push(handler);
			}
		}
	}

	private function invokeHandler(p_sender:Dynamic,p_handler:Dynamic):Void {
		throw "EventBase.invokeHandler is abstract !";
	}
	
	private function  create():EventBase {
		throw "EventBase.create is abstract !";
		return null;
	}
}