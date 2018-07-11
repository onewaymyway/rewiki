/**Created by the LayaAirIDE,do not modify.*/
package ui.rewiki {
	import laya.ui.*;
	import laya.display.*; 

	public class ItemGroupUI extends View {
		public var groubBar:Image;
		public var groupLabel:Label;
		public var arrowClip:Clip;
		public var groupBox:VBox;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"scenecolor":"#dddddd","hitTestPrior":true},"child":[{"type":"Image","props":{"y":0,"x":0,"width":100,"var":"groubBar","skin":"view/bg_bar.png","sizeGrid":"0,4,0,4","right":0,"mouseEnabled":true,"left":0,"height":24}},{"type":"Label","props":{"y":5,"x":19,"var":"groupLabel","text":"label","mouseEnabled":false,"mouseChildren":false,"color":"#006666"}},{"type":"Clip","props":{"y":6,"x":5,"var":"arrowClip","skin":"comp/clip_tree.png","scaleY":0.5,"scaleX":0.5,"mouseEnabled":false,"mouseChildren":false,"clipY":2}},{"type":"VBox","props":{"y":24,"x":0,"var":"groupBox","right":0,"mouseEnabled":true,"left":0},"child":[{"type":"Button","props":{"skin":"comp/button.png","labelColors":"#dddddd,#dddddd,#dddddd","label":"label"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}