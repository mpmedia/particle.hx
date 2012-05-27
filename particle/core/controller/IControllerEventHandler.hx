package particle.core.controller;

interface IControllerEventHandler {
	
	public function IControllerEventHandler():Void;
	public function onControllerEvent(event:ControllerEvent):Void;
}