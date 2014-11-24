package Factories 
{
	/**
	 * ...
	 * @author FDH
	 */
	public class Factory 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Factory() 
		{
		}
		
		// -- Methods -- //
		
		public function create(type:int, engine:Engine):*
		{
			throw new Error("FACTORY MUST OVERRIDE 'create' FUNCTION. ~ABSTRACT CLASS");
		}
	}

}