package view 
{
	import laya.debug.tools.Notice;
	import laya.events.Event;
	import laya.utils.Browser;
	import msg.ReWikiMsg;
	import tools.WebTools;
	import ui.rewiki.GroupItemUI;
	
	/**
	 * ...
	 * @author ww
	 */
	public class GroupItem extends GroupItemUI 
	{
		
		public function GroupItem() 
		{
			this.on(Event.CLICK, this, onDoubleClick);
		}
		private var _dataO:Object;
		public function initByData(dataO:Object):void
		{
			label.text = dataO.title;
			this._dataO = dataO;
			if (_dataO && _dataO.href)
			{
				label.underline = true;
			}else
			{
				label.underline = false;
			}
		}
		
		
		private function onDoubleClick():void
		{
			//debugger;
			if (_dataO && _dataO.href)
			{
				tryOpenUrl(_dataO.href);
			}
		}
		
		private function tryOpenUrl(url:String):void
		{
			if (url.indexOf("@Page:") >= 0)
			{
				var refer:String;
				refer = url.split("Page:")[1];
				
				Notice.notify(ReWikiMsg.LoadPage, [refer.split(".").join("_")+".json"]);
				return;
			}
			WebTools.openUrl(url);
		}
		
	}

}