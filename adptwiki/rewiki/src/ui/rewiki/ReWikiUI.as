/**Created by the LayaAirIDE,do not modify.*/
package ui.rewiki {
	import laya.ui.*;
	import laya.display.*; 

	public class ReWikiUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":600,"height":400}};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}