package seng480b.display
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import seng480b.data.MotionCaptureResults;
	import seng480b.Main;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MotionCaptureDisplay extends Sprite
	{
		private var	bitmap:Bitmap,
					captureData:MotionCaptureResults;
		
		private function get buffer():BitmapData {
			
			return bitmap.bitmapData;
		}
		
		public function MotionCaptureDisplay(captureData:MotionCaptureResults)
		{
			this.captureData = captureData;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			bitmap = new Bitmap(new BitmapData(Main.WIDTH, Main.HEIGHT, true, 0));
			addChild(bitmap);
		}
		
		private function onAddedToStage(e:Event = null):void {
			
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event = null):void {
			
			buffer.lock();
			
			for (var x:int = 0; x < Main.WIDTH; ++x) {
				for (var y:int = 0; y < Main.HEIGHT; ++y) {
					
					var color:uint = captureData.hasChanged(x, y)? 0x88FF0000 : 0;
					
					buffer.setPixel32(x, y, color);
				}
			}
			
			buffer.unlock();
		}
	}

}