package view 
{
	import laya.debug.tools.Notice;
	import laya.net.Loader;
	import laya.utils.Handler;
	import msg.ReWikiMsg;
	import ui.rewiki.ReWikiUI;
	
	/**
	 * ...
	 * @author ww
	 */
	public class ReWikiView extends ReWikiUI 
	{
		
		public function ReWikiView() 
		{
			initGroupPanel();
			Notice.listen(ReWikiMsg.LoadPage, this, loadWikiPage);
			Laya.loader.load(basePath+"nav.json", new Handler(this, onNavDataLoaded), null, Loader.JSON);
			loadWikiPage("学习_Js.json");
		}
		public static var basePath:String="http://orzooo.com/website/";
		public function loadWikiPage(pagePath:String):void
		{
			var path:String;
			path = basePath + pagePath;
			Laya.loader.load(path, new Handler(this, onPageDataLoaded), null, Loader.JSON);
		}
		public var groupPanelContent:GroupPanel;
		public var groupPanelNav:GroupPanel;
		
		private function initGroupPanel():void
		{
			groupPanelNav = new GroupPanel();
			
			groupPanelNav.top = 10;
			groupPanelNav.bottom = 10;
			groupPanelNav.width = 300;
			
			addChild(groupPanelNav);
			
			groupPanelContent = new GroupPanel();
			
			groupPanelContent.top = 10;
			groupPanelContent.bottom = 10;
			groupPanelContent.left = 350;
			groupPanelContent.right = 10;
			
			addChild(groupPanelContent);
		}
		private function onNavDataLoaded(dataO:Object):void
		{
			if (!dataO) return;
			groupPanelNav.initByData(dataO["Nav"]);
		}
		private function onPageDataLoaded(dataO:Object):void
		{
			if (!dataO) return;	
			groupPanelContent.initByData(dataO["Content"]);
	
		}
		
	}

}