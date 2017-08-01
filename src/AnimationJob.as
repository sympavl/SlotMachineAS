package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.Shape; 
	import flash.display.GradientType; 
	import flash.display.SpreadMethod;
	import flash.geom.Matrix; 
	import flash.media.Sound;
	/**
	 * ...
	 * @author 
	 */
	public class AnimationJob extends Sprite 
	{
		[Embed(source = "sounds/spin.mp3")] 
		private var spinSound:Class;
		[Embed(source = "sounds/stop.mp3")]
		private var stopSound:Class;
		[Embed(source = "sounds/start.mp3")]
		private var startSound:Class;
		public var spincount:int = 1;
		public var xcoord:int = 70;
		private var value:int = 0;
		private var leftExternalContainer:ImgloadEmbed = new ImgloadEmbed();
		private var centerExternalContainer:ImgloadEmbed = new ImgloadEmbed();
		private var rightExternalContainer:ImgloadEmbed = new ImgloadEmbed();
		private var SpinContainer1:Sprite = new Sprite();
		private var SpinContainer2:Sprite = new Sprite();
		private var SpinContainer3:Sprite = new Sprite();
		private var WiningArray:Array = [];
		private var funcinitcount:int = 0;
		private var spinsound:Sound = new Sound();
		private var stopsound:Sound = new Sound();
		private var startsound:Sound = new Sound();
		private var calcResult:ResultCalculate = new ResultCalculate();
		public var winnerMoneyMultiply:uint = 0;
		public static var WINNER:String = "winner";
		public static var END:String = "end";
		public function AnimationJob() 
		{
			
		}
		public function imginit():void
		{
			/*var leftspincontainer:Sprite = new Sprite();
			leftspincontainer.addChild(container1);
			leftspincontainer.x = 155;
			addChild(leftspincontainer);*/
			spinsound = Sound(new spinSound());
			stopsound = Sound(new stopSound());
			startsound = Sound(new startSound());
			//**************
			leftExternalContainer.spinimages();
			centerExternalContainer.spinimages();
			rightExternalContainer.spinimages();
			//**************
			SpinContainer1.addChild(leftExternalContainer);
			SpinContainer1.x = 70;
			SpinContainer1.y = 140;
			SpinContainer2.addChild(centerExternalContainer);
			SpinContainer2.x = 155;
			SpinContainer2.y = 140;
			SpinContainer3.addChild(rightExternalContainer);
			SpinContainer3.x = 242;
			SpinContainer3.y = 140;
			//**************
			addChild(SpinContainer1);
			addChild(SpinContainer2);
			addChild(SpinContainer3);
			//SPIN WINDOW GRADIENT
			var Blitmask1:BlitMask = new BlitMask(SpinContainer1, SpinContainer1.x, 125, SpinContainer1.width, 90, true, true, 0xFFFFFFFF, true);
			var Blitmask2:BlitMask = new BlitMask(SpinContainer2, SpinContainer2.x, 125, SpinContainer2.width, 90, true, true, 0xFFFFFFFF, true);
			var Blitmask3:BlitMask = new BlitMask(SpinContainer3, SpinContainer3.x, 125, SpinContainer3.width, 90, true, true, 0xFFFFFFFF, true);
		}
		public function spining():void
		{
			var i:int = 0;
			spinsound.play(500, 18);
			startsound.play();
			while (i < 3)
			{
				var randomcolumnvalue:int=randomcolumnvalue = Math.floor(Math.random() * 6);
				var newNumber:Number=newNumber = (randomcolumnvalue * 55) + 140 + spincount*330 + value;
				trace ("random value " + randomcolumnvalue);
				TweenMax.to(this["SpinContainer"+(i+1)],4 + (i*.9), { y:newNumber,onComplete:EndofTween } );
				value = (newNumber) - (randomcolumnvalue * 55) - (140);
				WiningArray[i] = randomcolumnvalue;
				i++;

			}
		}
		private function EndofTween():void
		{
			stopsound.play();
			funcinitcount++;
			if (funcinitcount == 3)
			{
			dispatchEvent(new Event(AnimationJob.END));
			trace(WiningArray[2]);
			funcinitcount = 0;
			winnerMoneyMultiply = calcResult.ResultInit(WiningArray);
				if (winnerMoneyMultiply != 0)
				{
					dispatchEvent(new Event(AnimationJob.WINNER));
				}
			}
		}
		
	}

}