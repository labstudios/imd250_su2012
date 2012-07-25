package com
{
	import flash.display.MovieClip;
	import flash.display.FrameLabel;
	
	public class FrameListener
	{
		private var frameList:Object;
		private var targ:MovieClip;
		
		public function FrameListener(mc:MovieClip = null):void
		{
			if(mc != null)
			{
				this.movieClip = mc;
			}
		}
		
		/*Add listener and clearFrame must be called when the timeline is stopped, otherwise the swf will seize.*/
		public function addListener(frameName:String, func:Function):void
		{
			
			if(this.targ == null)
			{
				trace("ERROR: your frame listener does not have a MovieClip to work with.");
			}
			else if(this.targ.currentFrame != 1)
			{
				trace("ERROR: Listener attempted after the playhead has advanced.");
			}
			else if(frameList[frameName] != undefined)
			{
				this.targ.addFrameScript(frameList[frameName], func);
			}
			else
			{
				trace(frameName + " does not exist in " + this.targ.name + ". Listener rejected.");
			}
		}
		
		public function clearFrame(frameName:String):void
		{
			if(this.targ == null)
			{
				trace("ERROR: your frame listener does not have a MovieClip to work with.");
			}
			else if(this.targ.currentFrame != 1)
			{
				trace("ERROR: Clear attempted after the playhead has advanced.");
			}
			else if(frameList[frameName] != undefined)
			{
				this.targ.addFrameScript(frameList[frameName], null);
			}
			else
			{
				trace(frameName + " does not exist in " + this.targ.name + ". Nullifier rejected.");
			}
		}
		
		private function buildFrameList():void
		{
			frameList = new Object();
			for(var i:int = 0; i < targ.currentLabels.length; i++)
			{
				var frameLab:FrameLabel = targ.currentLabels[i];
				frameList[frameLab.name] = frameLab.frame - 1;
			}
		}
		
		public function set movieClip(mc:MovieClip):void
		{
			this.targ = mc;
			buildFrameList();
		}
		
		public function get movieClip():MovieClip
		{
			return this.targ;
		}
	}
}