package 
{
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
	import flash.filters.BitmapFilterQuality;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Pavel Simonenko
	 */
	public class Imgloading extends Sprite
	{
		public var imagelink:String = 'image.png';
		private var loader:Loader = new Loader();
		public var xcoord:int = 300;
		public var ycoord:int = 0;
		public var scalez:int;
		public var glowbool:Boolean;
		private var textField:TextField = new TextField();
		private var container1:Sprite = new Sprite();
		public function Imgloading() 
		{
			
		}
		
		public function ImgInit():void
		{
			loader.load( new URLRequest(imagelink));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadercomplete);
		}
		private function loadercomplete(e:Event):void
		{
			trace("загрузка завершена");
			//addChild(loader);
			//addChild(textField);
			container1.addChild(loader);
			container1.addChild(textField);
			addChild(container1);
			loader.x = xcoord;
			loader.y = ycoord;
			//modifyimg();
			//loader.filters = [new GlowFilter(0xFFFF4A)];
			if (scalez)
			loader.scaleZ = scalez;
			if (glowbool)
			loader.filters = [new GlowFilter(0xFFFF4A)];
		}
		public function imgevent():void
		{

			container1.addEventListener(MouseEvent.MOUSE_OVER, imgmouseoverevent);


			
		}
		private function imgmouseoverevent(e:MouseEvent):void
		{
			var glowing:GlowFilter = new GlowFilter;
			glowing.color = 0xFFFF4A;
			glowing.inner = true;
			glowing.quality = BitmapFilterQuality.HIGH;
			glowing.strength = 2;
			glowing.blurX = 25;
			glowing.blurY = 25;
			glowing.alpha = 0.2;
			loader.filters = [glowing];
			container1.addEventListener(MouseEvent.MOUSE_OUT, imgmouseoutevent);
		}
		private function imgmouseoutevent(e:MouseEvent):void
		{
			loader.filters = [];
			container1.removeEventListener(MouseEvent.MOUSE_OUT, imgmouseoutevent);
			container1.addEventListener(MouseEvent.MOUSE_OVER, imgmouseoverevent);
		}
		
		public function buttontext(showText:String,xcord:int,ycord:int,color:uint):void
		{

			textField.text = showText;
			textField.x = xcord;
			textField.y = ycord;
			textField.textColor = color;
			textField.selectable = false;
		}
	}

}