package 
{
	import flash.display.Bitmap;
	import flash.display.GradientType;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.filters.GradientBevelFilter;
	import flash.filters.GradientGlowFilter;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Loader;
	/**
	 * ...
	 * @author Pavel Simonenko
	 */
	public class ImgloadEmbed extends Sprite
	{
		[Embed(source = "graphics/background.png")]
		private var backgroundimg:Class;
		[Embed(source = "Graphics/n_1.png")]
		private var n1:Class;
		[Embed(source = "Graphics/n_2.png")]
		private var n2:Class;
		[Embed(source = "Graphics/n_3.png")]
		private var n3:Class;
		[Embed(source = "Graphics/n_4.png")]
		private var n4:Class;
		[Embed(source = "Graphics/n_5.png")]
		private var n5:Class;
		[Embed(source = "Graphics/n_6.png")]
		private var n6:Class;
		private var imgbackground:Bitmap = Bitmap(new backgroundimg());
		private var loader:Loader = new Loader();
		public var xcoord:int = 20;
		public var ycoord:int = 10;
		public var scalez:int;
		public var glowbool:Boolean;
		public var container1:Sprite = new Sprite();
		public var xcord:int = 70;
		public function ImgloadEmbed() 
		{
			
		}
		
		public function imginit():void
		{
			imgbackground.x = xcoord;
			imgbackground.y = ycoord;
			addChild(imgbackground);
		}
		public function spinimages():void
		{
			const Y_COORD:int = 55;
			var img1:Bitmap = Bitmap(new n1());
			var img2:Bitmap = Bitmap(new n2());
			var img3:Bitmap = Bitmap(new n3());
			var img4:Bitmap = Bitmap(new n4());
			var img5:Bitmap = Bitmap(new n5());
			var img6:Bitmap = Bitmap(new n6());
			img2.y = Y_COORD;
			img3.y = Y_COORD * 2;
			img4.y = Y_COORD * 3;
			img5.y = Y_COORD * 4;
			img6.y = Y_COORD * 5;
			container1.addChild(img1);
			container1.addChild(img2);
			container1.addChild(img3);
			container1.addChild(img4);
			container1.addChild(img5);
			container1.addChild(img6);
			//container1.x = xcord;
			//container1.y = 140;
			addChild(container1);
		}
	}

}