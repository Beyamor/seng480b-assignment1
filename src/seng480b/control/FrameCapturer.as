package seng480b.control 
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.media.Video;
	import seng480b.data.Frame;
	import seng480b.data.FrameBuffer;
	/**
	 * ...
	 * @author beyamor
	 */
	public class FrameCapturer 
	{
		private var	video:Video,
					buffer:FrameBuffer;
		
		public function FrameCapturer(video:Video, buffer:FrameBuffer) 
		{
			this.video	= video;
			this.buffer	= buffer;
		}
		
		public function capture():void {
			
			buffer.push(Frame.readFrom(video));
		}
	}

}