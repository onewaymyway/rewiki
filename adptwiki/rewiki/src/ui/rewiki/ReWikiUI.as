/**Created by the LayaAirIDE,do not modify.*/
package ui.rewiki {
	import laya.ui.*;
	import laya.display.*; 

	public class ReWikiUI extends View {
		public var navList:List;
		public var contentList:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":600,"height":400},"child":[{"type":"List","props":{"width":150,"var":"navList","top":5,"repeatX":1,"left":2,"height":390,"bottom":5},"child":[{"type":"Box","props":{"right":2,"name":"render","left":2},"child":[{"type":"Label","props":{"y":0,"text":"label","right":0,"name":"txt","left":0,"height":19,"color":"#f1e4e4"}}]}]},{"type":"List","props":{"width":416,"var":"contentList","top":12,"right":5,"repeatX":1,"left":179,"height":383,"bottom":5},"child":[{"type":"Box","props":{"right":2,"name":"render","left":2},"child":[{"type":"Label","props":{"y":0,"text":"label","right":0,"name":"txt","left":0,"height":19,"color":"#f1e4e4"}}]}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}