package seng480b.control 
{
	import flash.events.Event;
	import seng480b.data.FrameBuffer;
	import seng480b.processing.MotionInterpreter;
	/**
	 * ...
	 * @author beyamor
	 */
	public class CaptureCoordinator 
	{
		private var	capturer:FrameCapturer,
					interpreter:MotionInterpreter,
					framesBetweenUpdates:uint,
					elapsedFrames:uint				= 0;
		
		public function CaptureCoordinator(framesBetweenUpdates:uint, capturer:FrameCapturer, interpreter:MotionInterpreter) 
		{
			this.capturer				= capturer;
			this.interpreter			= interpreter;
			this.framesBetweenUpdates	= framesBetweenUpdates;
		}
		
		public function onFrameEntered(e:Event = null):void {
			
			++elapsedFrames;
			if (elapsedFrames >= framesBetweenUpdates) {
				
				elapsedFrames = 0;
				update();
			}
		}
		
		private function update():void {
			
			capturer.capture();
			interpreter.updateResults();
		}
	}

}