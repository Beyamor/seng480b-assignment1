package seng480b
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Camera;
	import flash.media.Video;
	import seng480b.control.CaptureCoordinator;
	import seng480b.data.FrameBuffer;
	import seng480b.control.FrameCapturer;
	import seng480b.data.MotionCaptureResults;
	import seng480b.display.MotionCaptureDisplay;
	import seng480b.processing.MotionInterpreter;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Main extends Sprite 
	{
		public static const	WIDTH:uint	= 640,
							HEIGHT:uint	= 480;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Set up the camera
			var	camera:Camera	= Camera.getCamera(),
				video:Video		= new Video(WIDTH, HEIGHT);
				
			camera.setMode(WIDTH, HEIGHT, 15);
			video.attachCamera(camera);
			stage.addChild(video);
			
			// Create a buffer for the frames
			var	buffer:FrameBuffer = new FrameBuffer;
			
			// Start capturing video
			var	capturer:FrameCapturer = new FrameCapturer(video, buffer);
			
			// Set it up for interpresetation
			var	results:MotionCaptureResults	= new MotionCaptureResults,
				interpreter:MotionInterpreter	= new MotionInterpreter(buffer, results);
			
			// Coordinate the capture
			var	coordinator:CaptureCoordinator = new CaptureCoordinator(3, capturer, interpreter);
			addEventListener(Event.ENTER_FRAME, coordinator.onFrameEntered);
			
			// Display the motion capture results
			stage.addChild(new MotionCaptureDisplay(results));
		}
	}
	
}