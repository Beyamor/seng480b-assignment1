package seng480b.data 
{
	import flash.display.BitmapData;
	import flash.display.IBitmapDrawable;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import seng480b.Main;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Frame 
	{
		public static const		WIDTH:uint				= Main.WIDTH,
								HEIGHT:uint				= Main.HEIGHT;
							
		private static const	PIXEL_AREA:Rectangle	= new Rectangle(0, 0, WIDTH, HEIGHT),
								NUMBER_OF_PIXELS:uint	= WIDTH * HEIGHT;
							
		private var data:BitmapData;
		
		public function Frame(data:BitmapData) 
		{
			this.data = data;
		}
		
		public function get width():uint {
			
			return WIDTH;
		}
		
		public function get height():uint {
			
			return HEIGHT;
		}
		
		public static function createBlank():Frame {
			
			return new Frame(
						new BitmapData(WIDTH, HEIGHT, true, 0));
		}
		
		public static function readFrom(drawable:IBitmapDrawable):Frame {
			
			var	data:BitmapData = new BitmapData(WIDTH, HEIGHT, true, 0);
			data.draw(drawable);
			return new Frame(data);
		}
		
		public function get numberOfPixels():uint {
			
			return NUMBER_OF_PIXELS;
		}
		
		public function get pixels():ByteArray {
			
			var	pixels:ByteArray = data.getPixels(PIXEL_AREA);
			pixels.position = 0;
			return pixels;
		}
		
		public function get bitmapdata():BitmapData {
			
			return data.clone();
		}
	}

}