package com.at2.dirimote.examples.Toucharea 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;

	public class ColorIndicator extends Sprite
	{
		
		[Embed(source = "/../bin/ui/color_black.png")]
		private var color_black:Class;
		
		[Embed(source = "/../bin/ui/color_blue.png")]
		private var color_blue:Class;
		
		[Embed(source = "/../bin/ui/color_green.png")]
		private var color_green:Class;
		
		[Embed(source = "/../bin/ui/color_grey.png")]
		private var color_grey:Class;
		
		[Embed(source = "/../bin/ui/color_orange.png")]
		private var color_orange:Class;
		
		[Embed(source = "/../bin/ui/color_purple.png")]
		private var color_purple:Class;
		
		[Embed(source = "/../bin/ui/color_red.png")]
		private var color_red:Class;
		
		[Embed(source = "/../bin/ui/color_white.png")]
		private var color_white:Class;
		
		[Embed(source = "/../bin/ui/color_yellow.png")]
		private var color_yellow:Class;
		
		private var currentColor:Bitmap = null;
		
		public function ColorIndicator() 
		{
			setColor('color_black');
		}
		
		public function setColor(color:String):void {
			
			if (currentColor) {
			
				removeChild(currentColor);
			}

			switch(color) {

				case "color_black":
					currentColor = new color_black() as Bitmap;
					this.addChild(currentColor);
					break;
					
				case "color_blue":
					currentColor = new color_blue() as Bitmap;
					this.addChild(currentColor);
					break;
					
				case "color_green":
					currentColor = new color_green() as Bitmap;
					this.addChild(currentColor);
					break;
					
				case "color_grey":
					currentColor = new color_grey() as Bitmap;
					this.addChild(currentColor);
					break;
					
				case "color_orange":
					currentColor = new color_orange() as Bitmap;
					this.addChild(currentColor);
					break;
					
				case "color_purple":
					currentColor = new color_purple() as Bitmap;
					this.addChild(currentColor);
					break;
					
				case "color_red":
					currentColor = new color_red() as Bitmap;
					this.addChild(currentColor);
					break;
					
				case "color_white":
					currentColor = new color_white() as Bitmap;
					this.addChild(currentColor);
					break;
					
				default:
				case "color_yellow":
					currentColor = new color_yellow() as Bitmap;
					this.addChild(currentColor);
					break;
			}
		}
	}
}