package seng480b.data 
{
	import seng480b.Main;
	/**
	 * ...
	 * @author beyamor
	 */
	public class MotionCaptureResults 
	{
		private var changed:Vector.<Vector.<Boolean>>;
		
		public function MotionCaptureResults() 
		{
			changed = new Vector.<Vector.<Boolean>>;
			for (var x:uint = 0; x < Main.WIDTH; ++x) {
				
				changed[x] = new Vector.<Boolean>;
				for (var y:uint = 0; y < Main.HEIGHT; ++y) {
					
					changed[x][y] = false;
				}
			}
		}
		
		public function reset():void {
			
			for (var x:uint = 0; x < Main.WIDTH; ++x) {
				for (var y:uint = 0; y < Main.HEIGHT; ++y) {
					
					changed[x][y] = false;
				}
			}
		}
		
		public function setChanged(x:uint, y:uint, hasChanged:Boolean):void {
			
			changed[x][y] = hasChanged;
		}
		
		public function hasChanged(x:uint, y:uint):Boolean {
			
			if (x >= Main.WIDTH || y >= Main.WIDTH) return false;
			
			return changed[x][y];
		}
	}

}