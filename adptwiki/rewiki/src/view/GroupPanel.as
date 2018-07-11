package view {
	import laya.ui.Panel;
	
	/**
	 * ...
	 * @author ww
	 */
	public class GroupPanel extends Panel {
		
		public function GroupPanel() {
			this.vScrollBarSkin = "comp/vscroll.png";
			this.vScrollBar.mouseWheelEnable = true;
		}
		
		public function initByData(dataO:Object):void {
			this.removeChildren();
			var list:Array;
			list = dataO as Array;
			var i:int, len:int;
			len = list.length;
			var tY:Number;
			tY = 0;
			for (i = 0; i < len; i++) {
				var itemGroup:ItemGroup;
				itemGroup = new ItemGroup();
				itemGroup.initByData(list[i]);
				itemGroup.pos(0, tY);
				tY += itemGroup.height;
				addChild(itemGroup);
			}
		}
	}

}