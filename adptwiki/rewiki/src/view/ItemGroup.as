package view 
{
	import laya.events.Event;
	import ui.rewiki.ItemGroupUI;
	/**
	 * ...
	 * @author ww
	 */
	public class ItemGroup extends ItemGroupUI
	{
		
		public function ItemGroup() 
		{
			groubBar.on(Event.MOUSE_DOWN, this, onGroubBarClick);
		}
		
		public function reset():void
		{
			groupBox.removeChildren();
		}
		protected function onGroubBarClick(e:Event):void {
			if (groupBox.parent) {
				groupBox.removeSelf();
				arrowClip.index = 0;
			} else {
				addChild(groupBox);
				arrowClip.index = 1;
			}
			updateMySize();
		}
		
		public function initByData(dataO:Object):void
		{
			reset();
			//debugger;
			groupLabel.text = dataO.title;
			
			var dataList:Array;
			dataList = dataO.child;
			var i:int, len:int;
			len = dataList.length;
			var tItem:GroupItem;
			var tY:Number;
			tY = 0;
			for (i = 0; i < len; i++)
			{
				tItem = new GroupItem();
				tItem.initByData(dataList[i]);
				tItem.pos(0, tY);
				tY += tItem.height + 2;
				groupBox.addChild(tItem);
			}
			updateMySize();
		}
		
		public function updateMySize():void
		{
			if (arrowClip.index == 0)
			{
				this.height = groupBox.height + groupBox.y;
			}else
			{
				this.height = 40;
			}
			
			event(Event.RESIZE);
		}
		
	}

}