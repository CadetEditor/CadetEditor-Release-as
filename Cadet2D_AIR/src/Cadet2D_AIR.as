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
	import core.editor.operations.w_okif;
	import core.editor.ui.components.SplashScreen;
	
	[SWF(backgroundColor="#15181A", frameRate="60")]
	public class Cadet2D_AIR extends Sprite
	{
		private var g_jxvs		:NativeWindow;
		private var r_gxip		:SplashScreen;
		private var configURL			:String = "config.xml";
		
		public function Cadet2D_AIR()
		{
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, s_hmjv);
			
			var h_citi:NativeWindowInitOptions = new NativeWindowInitOptions();
			h_citi.systemChrome = "none";
			h_citi.transparent = true;
			g_jxvs = new NativeWindow(h_citi);
			r_gxip = new SplashScreen();
			g_jxvs.stage.scaleMode = StageScaleMode.NO_SCALE;
			g_jxvs.stage.align = StageAlign.TOP_LEFT;
			g_jxvs.stage.addChild( r_gxip );
			g_jxvs.width = r_gxip.width;
			g_jxvs.height = r_gxip.height;
			var bounds:Rectangle = Screen.mainScreen.bounds;
			g_jxvs.x = ( bounds.width - g_jxvs.width ) >> 1;
			g_jxvs.y = ( bounds.height - g_jxvs.height ) >> 1;
			g_jxvs.activate();
			
			// Don't init straight away, so the invokeHandler has chance to be called.
			AsynchronousUtil.callLater(u_amvr);
		}
		
		/**
		 * Handle any commandline parameters.
		 */
		private function s_hmjv( event:InvokeEvent ):void
		{
			if ( event.arguments.length == 0 ) return;
			configURL = event.arguments[0];
		}
		
		private function u_amvr():void
		{
			CoreApp.init();
			
			var initOperation:w_okif = new w_okif( stage, configURL );
			initOperation.addEventListener(Event.COMPLETE, initCompleteHandler);
			initOperation.execute();
			
			r_gxip.h_tfle(initOperation);
		}
		
		private function initCompleteHandler( event:Event ):void
		{
			g_jxvs.close();
			stage.nativeWindow.visible = true;
			stage.nativeWindow.maximize();
		}
	}
}