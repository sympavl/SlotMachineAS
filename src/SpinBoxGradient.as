package 
{
	import flash.display.Shape; 
	import flash.display.GradientType; 
	import flash.display.SpreadMethod;
	import flash.geom.Matrix; 
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 
	 */
	public class SpinBoxGradient extends Sprite
	{
		
		public function SpinBoxGradient() 
		{
		}
		public function InitGradient(xcoord:int):void
		{
			var shape:Shape = new Shape ;
			var type:String = GradientType.LINEAR;
			var matrix:Matrix = new Matrix ;
			matrix.createGradientBox(100,95,1.5708,xcoord,125);
			var colors:Array = [0x3D3F3D,0xfff4f4,0xfff4f4,0x3D3F3D];		
			var alphas:Array = [1,0,0,1];
			var ratios:Array = [0,60,166,255];
			shape.graphics.beginGradientFill(type, colors, alphas, ratios, matrix);
			shape.graphics.lineStyle();
			shape.graphics.drawRect(xcoord, 125, 65, 90);
			addChild(shape);
		}
		
	}

}