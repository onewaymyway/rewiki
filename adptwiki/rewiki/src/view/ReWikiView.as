package view 
{
	import laya.net.Loader;
	import laya.utils.Handler;
	import ui.rewiki.ReWikiUI;
	
	/**
	 * ...
	 * @author ww
	 */
	public class ReWikiView extends ReWikiUI 
	{
		
		public function ReWikiView() 
		{
			loadWikiPage("学习_Js.json");
		}
		public static var basePath:String="wiki/";
		public function loadWikiPage(pagePath:String):void
		{
			var path:String;
			path = basePath + pagePath;
			Laya.loader.load(path, new Handler(this, onPageDataLoaded), null, Loader.JSON);
		}
		
		private function onPageDataLoaded(dataO:Object):void
		{
			debugger;
			
		}
		
	}

}