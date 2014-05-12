// Copyright (c) 2012, Unwrong Ltd. http://www.unwrong.com
// All rights reserved. 

package
{
	import flash.desktop.NativeApplication;
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.Screen;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.InvokeEvent;
	import flash.geom.Rectangle;
	
	import core.app.CoreApp;
	import core.app.util.AsynchronousUtil;
	import core.editor.operations._dk896;
	import core.editor.ui.components.SplashScreen;
	
	[SWF(backgroundColor="#15181A", frameRate="60")]
	public class Cadet2D_AIR extends Sprite
	{
		private var _fj2513		:NativeWindow;
		private var _pa935		:SplashScreen;
		private var configURL			:String = "config.xml";
		
		public function Cadet2D_AIR()
		{
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, _fy2820);
			
			var _td2482:NativeWindowInitOptions = new NativeWindowInitOptions();
			_td2482.systemChrome = "none";
			_td2482.transparent = true;
			_fj2513 = new NativeWindow(_td2482);
			_pa935 = new SplashScreen();
			_fj2513.stage.scaleMode = StageScaleMode.NO_SCALE;
			_fj2513.stage.align = StageAlign.TOP_LEFT;
			_fj2513.stage.addChild( _pa935 );
			_fj2513.width = _pa935.width;
			_fj2513.height = _pa935.height;
			var bounds:Rectangle = Screen.mainScreen.bounds;
			_fj2513.x = ( bounds.width - _fj2513.width ) >> 1;
			_fj2513.y = ( bounds.height - _fj2513.height ) >> 1;
			_fj2513.activate();
			
			// Don't init straight away, so the invokeHandler has chance to be called.
			AsynchronousUtil.callLater(_qe826);
		}
		
		/**
		 * Handle any commandline parameters.
		 */
		private function _fy2820( event:InvokeEvent ):void
		{
			if ( event.arguments.length == 0 ) return;
			configURL = event.arguments[0];
		}
		
		private function _qe826():void
		{
			CoreApp.init();
			
			var initOperation:_dk896 = new _dk896( stage, configURL );
			initOperation.addEventListener(Event.COMPLETE, initCompleteHandler);
			initOperation.execute();
			
			_pa935._xq148(initOperation);
		}
		
		private function initCompleteHandler( event:Event ):void
		{
			_fj2513.close();
			stage.nativeWindow.visible = true;
			stage.nativeWindow.maximize();
		}
	}
}