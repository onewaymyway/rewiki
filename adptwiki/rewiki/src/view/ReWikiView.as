package view 
{
	import laya.debug.tools.Notice;
	import laya.events.Event;
	import laya.net.Loader;
	import laya.ui.Button;
	import laya.utils.Handler;
	import laya.utils.Utils;
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
		public var freshBtn:Button;
		public var curVersion:Number;
		public function ReWikiView() 
		{
			initGroupPanel();
			Notice.listen(ReWikiMsg.LoadPage, this, loadWikiPage);
			Laya.loader.load(basePath+"nav.json", new Handler(this, onNavDataLoaded), null, Loader.JSON);
			changeVersion();
			var page:String;
			page = "学习_机器学习.json";
			var q:String;
			q = Utils.getQueryString("page");
			if (q) page = q;
			loadWikiPage(page);
		}
		private function changeVersion():void
		{
			curVersion = Math.random();
		}
		public static var basePath:String = "https://orzooo.com/website/";
		public static var baseEditPath:String = "https://github.com/onewaymyway/rewiki/blob/master/docs/website/";
		public function loadWikiPage(pagePath:String):void
		{
			_curUrl = pagePath;
			var path:String;
			path = basePath + pagePath + "?v=" + curVersion;
			
			var curPath:String;
			curPath = window.location.href.split("?")[0];
			curPath = curPath + "?page=" + pagePath;
			if (window.history && window.history.replaceState)
			{
				window.history.replaceState("0", "ReWiki:" + pagePath, curPath);
			}
			Laya.loader.load(path, new Handler(this, onPageDataLoaded), null, Loader.JSON);
		}
		public var groupPanelContent:GroupPanel;
		public var groupPanelNav:GroupPanel;
		
		private function initGroupPanel():void
		{
			groupPanelNav = new GroupPanel();
			
			groupPanelNav.top = 10;
			groupPanelNav.bottom = 10;
			groupPanelNav.width = 200;
			
			addChild(groupPanelNav);
			
			groupPanelContent = new GroupPanel();
			
			groupPanelContent.top = 10;
			groupPanelContent.bottom = 10;
			groupPanelContent.left = groupPanelNav.width;
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
			
			freshBtn = new Button();
			freshBtn.skin = "view/refresh2.png";
			freshBtn.y = 10;
			freshBtn.scale(0.5, 0.5);
			freshBtn.right = editBtn.width+30;
			addChild(freshBtn);
			freshBtn.on(Event.CLICK, this, onFreshBtnClick);
			
		}
		
		private function onFreshBtnClick():void
		{
			changeVersion();
			loadWikiPage(_curUrl);
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