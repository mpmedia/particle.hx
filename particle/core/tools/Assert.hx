package particle.core.tools;

/**
 * ...
 * @author marc paraiso
 */

class Assert 
{

	
	public static function _assert(param1:Bool, param2:String = null) : Void
        {
            if (!param1)
            {
                if (param2 != null)
                {
                    throw Error("ASSERT: " + param2);
                }
                throw Error("ASSERT!");
            }
            return;
        }
	
}

