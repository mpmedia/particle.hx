package particle.core.model;

import particle.core.tools.EventBase;
import particle.core.tools.GenericEvent;
import particle.core.tools.IGenericEventHandler;

class ControllerEvent extends GenericEvent {
	public static inline Start:int = -3;
	public static inline Finish = -2;
	public static inline CustomFirst = 0;
	
	public function New() {
		setAsync(false);
	}
	
	/**
	 * Invokes the callback function
	 * of a registered event handler. 
	 * Subclasses must override this method to call 
	 * the appropriate callback method on the event handler.
	 * 
	 * @param	p_sender
	 * @param	p_handler
	 */
	override function invokeHandler(p_sender:Dynamic,p_handler:Dynamic) {
		cast(p_handler, IControllerEventHandler).onControllerEvent(this);
	}
	
	/**
	 * Creates a new instance of this event class. 
	 * The function is used as an event factory. 
	 * Sublcasses must override this method 
	 * to return an instance of the subclass.
	 * @return EventBase
	 */
	override function create():EventBase {
		return new ControllerEvent();
	}
}