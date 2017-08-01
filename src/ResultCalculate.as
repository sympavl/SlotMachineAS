package 
{
	/**
	 * ...
	 * @author 
	 */
	public class ResultCalculate 
	{
		
		public function ResultCalculate() 
		{
			
		}
		
		public function ResultInit(results:Array):uint
		{
			if (results[0] == 0 && results[1] == 0)
			{
				trace("WINNER"); return 5;
			}
			if (results[0] == 0)
			{
				trace("WINNER"); return 2;
			}
			if (results[0] == 0 && results[1] == 0 && results[2] == 0)
			{
				trace("WINNER"); return 10;
			}
			if (results[0] == 5 && results[1] == 5 && results[2] == 5)
			{
				trace("WINNER"); return 12;
			}
			if (results[0] == 4 && results[1] == 4 && results[2] == 4)
			{
				trace("WINNER"); return 20;
			}
			if (results[0] == 3 && results[1] == 3 && results[2] == 3)
			{
				trace("WINNER"); return 50;
			}
			if (results[0] == 2 && results[1] == 2 && results[2] == 2)
			{
				trace("WINNER"); return 100;
			}
			if (results[0] == 1 && results[1] == 1 && results[2] == 1)
			{
				trace("WINNER"); return 250;
			}
			return 0;
		}
		
	}

}