package seng480b.data
{
	import flash.display.BitmapData;
	import seng480b.Main;
	/**
	 * ...
	 * @author beyamor
	 */
	public class FrameBuffer 
	{
		private var _current:Frame,
					_previous:Frame;
		
		public function FrameBuffer() 
		{
			_current	= Frame.createBlank();
			_previous	= Frame.createBlank();
		}
		
		public function push(newFrame:Frame):void {
			
			_previous	= _current;
			_current	= newFrame;
		}
		
		public function get current():Frame {
			
			return _current;
		}
		
		public function get previous():Frame {
			
			return _previous;
		}
		
		public function get frameWidth():uint {
			
			return Main.WIDTH;
		}
		
		public function get frameHeight():uint {
			
			return Main.HEIGHT;
		}
	}

}