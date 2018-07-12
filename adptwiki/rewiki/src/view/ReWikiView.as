package view 
{
	import laya.debug.tools.Notice;
	import laya.events.Event;
	import laya.net.Loader;
	import laya.ui.Button;
	import laya.utils.Handler;
	import msg.ReWikiMsg;
	import tools.WebTools;
	import ui.rewiki.ReWikiUI;
	
	/**
	 * ...
	 * @author ww
	 */
	public class ReWikiView extends ReWikiUI 
	{
		public var editBtn:Button;
		public function ReWikiView() 
		{
			initGroupPanel();
			Notice.listen(ReWikiMsg.LoadPage, this, loadWikiPage);
			Laya.loader.load(basePath+"nav.json", new Handler(this, onNavDataLoaded), null, Loader.JSON);
			loadWikiPage("学习_Js.json");
		}
		public static var basePath:String = "http://orzooo.com/website/";
		public static var baseEditPath:String = "https://github.com/onewaymyway/rewiki/blob/master/docs/website/";
		public function loadWikiPage(pagePath:String):void
		{
			_curUrl = pagePath;
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
			
			editBtn = new Button();
			editBtn.skin = "comp/button.png";
			editBtn.y = 10;
			editBtn.right = 25;
			editBtn.label = "Edit";
			editBtn.labelColors = "#ffffff";
			addChild(editBtn);
			editBtn.on(Event.CLICK, this, onEditBtnClick);
		}
		
		private var _curUrl:String;
		private function onEditBtnClick():void
		{
			if (_curUrl)
			{
				WebTools.openUrl(baseEditPath+_curUrl);
			}
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