package particle.core.tools;

interface ISerializable {
	public function serialize(object:Dynamic):Dynamic
	public function deserialize(object:Dynamic):Bool
}