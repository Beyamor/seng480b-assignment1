package seng480b.processing 
{
	import com.gskinner.geom.ColorMatrix;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import seng480b.data.Frame;
	import seng480b.data.FrameBuffer;
	import seng480b.data.MotionCaptureResults;
	import seng480b.Main;
	/**
	 * ...
	 * @author beyamor
	 */
	public class MotionInterpreter 
	{		
		private var	buffer:FrameBuffer,
					results:MotionCaptureResults;
		
		public function MotionInterpreter(buffer:FrameBuffer, results:MotionCaptureResults) 
		{
			this.buffer		= buffer;
			this.results	= results;
		}
		
		public function updateResults():void {
			
			var	currentFrame:Frame			= buffer.current,
				previousFrame:Frame			= buffer.previous,
				difference:BitmapData		= currentFrame.bitmapdata;
				
			difference.draw(previousFrame.bitmapdata, null, null, BlendMode.DIFFERENCE);
			
			var	colorAdjustment:ColorMatrix	= new ColorMatrix;
			colorAdjustment.adjustContrast(100);
			colorAdjustment.adjustBrightness(5);
			difference.applyFilter(difference, difference.rect, new Point, new ColorMatrixFilter(colorAdjustment));
			difference.applyFilter(difference, difference.rect, new Point, new BlurFilter(100, 100, BitmapFilterQuality.LOW));
			
			var	regionOfChange:Rectangle = difference.getColorBoundsRect(0x00FFFFFF, 0x00000000, false);
			
			results.reset();
			for (var x:uint = regionOfChange.left; x < regionOfChange.right; ++x) {
				for (var y:uint = regionOfChange.top; y < regionOfChange.bottom; ++y) {
					
					results.setChanged(x, y, true);
				}
			}
		}
	}

}