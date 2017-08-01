package 
{
	import flash.display.Sprite;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.events.Event;
	import ascb.util.NumberFormat;
	/**
	 * ...
	 * @author Pavel Simonenko
	 */
	public class TextScore extends Sprite
	{
		[Embed(source = "../src/Graphics/Crystal.ttf", fontFamily = Crystal, mimeType = "application/x-font", embedAsCFF = "false")]private var Crystal:Class;
		public var score:int = 0;
		private var textfield:TextField = new TextField;
		public var xcoord:int = 90;
		public var ycoord:int = 227;
		private var startMoney:uint = 000500;
		private var showingNumberFormat:NumberFormat = new NumberFormat();
		public var setNumberFormat:String = "000000000";
		public function TextScore() 
		{
			
		}
		
		public function showtext(text:String):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			showingNumberFormat.mask = setNumberFormat;
			var format:TextFormat = new TextFormat();
			format.size = 18;
			format.color = 0x981B1B;
			format.font = "Crystal";

			//addEventListener(Event.ENTER_FRAME, frameupdate);
			textfield.defaultTextFormat = format;
			textfield.text = text;
			textfield.autoSize = "right";
			textfield.wordWrap = false;
			textfield.selectable = false;
			
			textfield.embedFonts = true;
			textfield.x = xcoord;
			textfield.y = ycoord;

			addChild(textfield);
			

			// entry point
		
		}
		private function frameupdate(e:Event):void
		{
			score+= 100;
			if (score < 999999)
			textfield.text = String(score);
			else {removeEventListener(Event.ENTER_FRAME, init);
			textfield.text = "000500";}
		}
		public function updatetext(playerBet:uint,playerBank:uint):void
		{
			textfield.text = showingNumberFormat.format((playerBank-playerBet));
		}
		public function updateShowingText(playerBank:uint):void
		{
			textfield.text = showingNumberFormat.format((playerBank));
		}
	}

}