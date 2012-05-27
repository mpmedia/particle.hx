package particle.core.tools;

class GenericEventData
{
	public var str:String;
	public var int1:Int;
	public var int2:Int;
	public var obj:{ };
	
	public function new() {
		this.str = "";
		this.int1 = 0;
		this.int2 = 0;
		this.obj= null;
	}
	public function reset():Void
	{
		this.str = "";
		this.int1 = 0;
		this.int2 = 0;
		this.obj= null;
	}
	
	public function copy(paramGenericEventData:GenericEventData) {
		this.str = paramGenericEventData.str;
		this.int1 = paramGenericEventData.int1;
		this.int2 = paramGenericEventData.int2;
		this.obj = paramGenericEventData.obj;
	}
}