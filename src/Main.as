package
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.SharedObject;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField; 
	import flash.events.ProgressEvent;
	import flash.text.TextFormat;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.filters.GlowFilter;
	import flash.filters.BitmapFilterQuality;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite 
	{
		[Embed(source = "graphics/background.png")] 
		private var background:Class;
		[Embed(source = "graphics/button.png")] 
		private var button:Class;
		[Embed(source = "sounds/win.mp3")]
		private var winner:Class;
		[Embed(source = "sounds/reset.mp3")]
		private var reset:Class;
		private var loaderprogres:Loader = new Loader();
		private var field1:TextField = new TextField;
		private var buttonpressed:Boolean = false;
		private var pressloader:Loader = new Loader();
		private var textscore:TextScore = new TextScore();
		//private var myxml:Xmljob = new Xmljob();
		//private var json:JsonJob = new JsonJob();
		private var imgactions:Imgloading = new Imgloading();
		private var spinAnimation:AnimationJob = new AnimationJob();
		private var backgroundimg:Bitmap = Bitmap(new background());
		private var buttonimg:Bitmap = Bitmap(new button());
		private var buttonsprite:Sprite = new Sprite();
		private var buttoncontainer:Sprite = new Sprite();
		private var onebetimg:Bitmap = Bitmap(new button());
		private var onebetsprite:Sprite = new Sprite();
		private var onebetcontainer:Sprite = new Sprite();
		private var maxbetimg:Bitmap = Bitmap(new button());
		private var maxbetsprite:Sprite = new Sprite();
		private var maxbetcontainer:Sprite = new Sprite();
		private var spintext:TextField = new TextField();
		private var onebettext:TextField = new TextField();
		private var addGradientToLeftBox:SpinBoxGradient = new SpinBoxGradient();
		private var addGradientToCenterBox:SpinBoxGradient = new SpinBoxGradient();
		private var addGradientToRightBox:SpinBoxGradient = new SpinBoxGradient();
		private var bet:uint = 0;
		private var playerBank:uint = 0;
		private var playerBet:uint = 0;
		private var betText:TextScore = new TextScore();
		private var winnerText:TextScore = new TextScore();
		private var slotMachine:SharedObject = SharedObject.getLocal("slotmachine");
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var spintextFormat:TextFormat = new TextFormat();
			//imgloadembed.imginit();
			//*****Background
			backgroundimg.x = 20;
			backgroundimg.y = 10;
			//*****Background
			//*****Buttons
			buttonimg.x = 250;
			buttonimg.y = 290;
			onebetimg.x = 200;
			onebetimg.y = 290;
			//*****Buttons
			//*****Text
			spintextFormat.size = 15;
			spintext.defaultTextFormat = spintextFormat;
			spintext.text = "Spin";
			spintext.selectable = false;
			spintext.x = 254;
			spintext.y = 300;
			spintext.width = 30;
			spintext.height = 30;
			onebettext.defaultTextFormat = spintextFormat;
			onebettext.text = "Bet\nOne";
			onebettext.selectable = false;
			onebettext.x = 206;
			onebettext.y = 300;
			onebettext.width = 30;
			onebettext.height = 30;
			betText.xcoord = 185;
			betText.setNumberFormat = "00";
			betText.showtext("00");
			winnerText.setNumberFormat = "0000";
			winnerText.xcoord = 219;
			winnerText.showtext("0000");
			//*****Text
			//Adding objects to stage
			buttonsprite.addChild(buttonimg);
			onebetsprite.addChild(onebetimg);
			addChild(backgroundimg);
			addChild(buttoncontainer);
			addChild(onebetcontainer);
			addChild(textscore);
			addChild(betText);
			addChild(winnerText);
			addChild(spinAnimation);
			addChild(addGradientToLeftBox);
			addChild(addGradientToCenterBox);
			addChild(addGradientToRightBox);
			buttoncontainer.addChild(buttonsprite);
			buttoncontainer.addChild(spintext);
			onebetcontainer.addChild(onebetsprite);
			onebetcontainer.addChild(onebettext);
			//Adding objects to stage
			textscore.showtext(("000000"+(String)(slotMachine.data.playerBank)));
			//Spining
			spinAnimation.spincount = 10;
			spinAnimation.imginit();
			addGradientToLeftBox.InitGradient(70);
			addGradientToCenterBox.InitGradient(155);
			addGradientToRightBox.InitGradient(242);
			//Spining
			//Buttons listeners
			onebetcontainer.addEventListener(MouseEvent.CLICK, betbuttonClicked);
			onebetcontainer.addEventListener(MouseEvent.MOUSE_OVER, betbuttonOver);
			if (!slotMachine.data.playerBank)
			{
				slotMachine.data.playerBank = 200;
				playerBank = 200;
			}
			else
			{
				playerBank = slotMachine.data.playerBank;
			}
			//Buttons listeners
			//xmljob();
			//json();
			//loaderinit();

		}
		private function betbuttonClicked(e:MouseEvent):void
		{
			if (playerBet==0)
			{
			buttoncontainer.addEventListener(MouseEvent.CLICK, mouseClicked);
			buttoncontainer.addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			}
			if (playerBet !=3)
			{
				playerBet++;
				betText.updateShowingText(playerBet);
			}
			else
			{
				playerBet = 1;
				betText.updateShowingText(playerBet);
			}
			var resetSound:Sound = Sound(new reset());
			resetSound.play();
		}
		private function mouseClicked(e:MouseEvent):void
		{
			var showresult:ResultCalculate = new ResultCalculate();
			winnerText.updateShowingText(0);
			textscore.updatetext(playerBet, playerBank);
			playerBank -= playerBet;
			slotMachine.data.playerBank = playerBank;
			//trace(slotMachine.data.playerBank);
			slotMachine.flush();
			spinAnimation.spining();
			spinAnimation.addEventListener(AnimationJob.WINNER, updatetext);
			onebetcontainer.removeEventListener(MouseEvent.CLICK, betbuttonClicked);
			onebetcontainer.removeEventListener(MouseEvent.MOUSE_OVER, betbuttonOver);
			buttoncontainer.removeEventListener(MouseEvent.CLICK, mouseClicked);
			buttoncontainer.removeEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			spinAnimation.addEventListener(AnimationJob.END, endofspin);
		}
		private function endofspin(e:Event):void
		{
			onebetcontainer.addEventListener(MouseEvent.CLICK, betbuttonClicked);
			onebetcontainer.addEventListener(MouseEvent.MOUSE_OVER, betbuttonOver);
			buttoncontainer.addEventListener(MouseEvent.CLICK, mouseClicked);
			buttoncontainer.addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
		}
		private function updatetext(e:Event):void
		{
			var prise:uint = playerBet * spinAnimation.winnerMoneyMultiply;
			playerBank += playerBet * spinAnimation.winnerMoneyMultiply;
			textscore.updateShowingText(playerBank);
			var playWinnerSound:Sound = Sound(new winner());
			playWinnerSound.play();
			winnerText.updateShowingText(prise);
			spinAnimation.winnerMoneyMultiply = 0;
			spinAnimation.removeEventListener(AnimationJob.WINNER, updatetext);
			slotMachine.data.playerBank = playerBank;
			slotMachine.flush();
		}
		private function mouseOver(e:MouseEvent):void
		{
			var glowing:GlowFilter = new GlowFilter;
			glowing.color = 0xFFFF4A;
			glowing.inner = true;
			glowing.quality = BitmapFilterQuality.HIGH;
			glowing.strength = 2;
			glowing.blurX = 25;
			glowing.blurY = 25;
			glowing.alpha = 0.2;
			buttonimg.filters = [glowing];
			buttoncontainer.addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
		}
		private function betbuttonOver(e:MouseEvent):void
		{
			var glowing:GlowFilter = new GlowFilter;
			glowing.color = 0xFFFF4A;
			glowing.inner = true;
			glowing.quality = BitmapFilterQuality.HIGH;
			glowing.strength = 2;
			glowing.blurX = 25;
			glowing.blurY = 25;
			glowing.alpha = 0.2;
			onebetimg.filters = [glowing];
			onebetcontainer.addEventListener(MouseEvent.MOUSE_OUT, betbuttonOut);
		}
		private function betbuttonOut(e:MouseEvent):void
		{
			onebetimg.filters = [];
		}
		private function mouseOut(e:MouseEvent):void
		{
			buttonimg.filters = [];
		}
	}
	
}