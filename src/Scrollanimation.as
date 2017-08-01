package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Pavel Simonenko
	 */
	public class Scrollanimation extends Sprite
	{
		[Embed(source = "Graphics/n_1.png")]
		private var N_1:Class;
		[Embed(source = "Graphics/n_2.png")]
		private var N_2:Class;
		[Embed(source = "Graphics/n_3.png")]
		private var N_3:Class;
		[Embed(source = "Graphics/n_4.png")]
		private var N_4:Class;
		[Embed(source = "Graphics/n_5.png")]
		private var N_5:Class;
		[Embed(source = "Graphics/n_6.png")]
		private var N_6:Class;
		private const IMG_SIZE:int = 55;
		public function Scrollanimation() 
		{
			addImagetoVision();
		}
		public function addImagetoVision():void
		{
			var n_1:Bitmap = new (N_1);
			var n_2:Bitmap = new (N_2);
			var n_3:Bitmap = new (N_3);
			var n_4:Bitmap = new (N_4);
			var n_5:Bitmap = new (N_5);
			var n_6:Bitmap = new (N_6);
			addChild(n_1);
			n_2.y = IMG_SIZE;
			n_3.y = IMG_SIZE * 2;
			n_4.y = IMG_SIZE * 3;
			n_5.y = IMG_SIZE * 4;
			n_6.y = IMG_SIZE * 5;
			addChild(n_2);
			addChild(n_3);
			addChild(n_4);
			addChild(n_5);
			addChild(n_6);
		}
		
		
	}

}