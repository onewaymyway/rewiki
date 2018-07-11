/**Created by the LayaAirIDE,do not modify.*/
package ui.rewiki {
	import laya.ui.*;
	import laya.display.*; 

	public class GroupItemUI extends View {
		public var label:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":88,"height":27},"child":[{"type":"Label","props":{"y":3,"var":"label","text":"label","right":0,"left":20,"height":21,"color":"#f6e4e4"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}