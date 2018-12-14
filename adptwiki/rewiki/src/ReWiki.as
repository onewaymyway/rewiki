package 
{
	import laya.display.Sprite;
	import laya.display.Stage;
	import laya.events.Event;
	import laya.net.Loader;
	import laya.ui.Box;
	import laya.utils.Browser;
	import laya.utils.Handler;
	import view.ReWikiView;
	/**
	 * ...
	 * @author ww
	 */
	public class ReWiki 
	{
		
		public function ReWiki() 
		{
			Laya.init(1000, 900);
			Laya.stage.scaleMode = Stage.SCALE_FULL;
			Laya.stage.screenMode = Stage.SCREEN_HORIZONTAL;
			
			var loads:Array;
			loads = [];
			//loads.push( { url:PathConfig.stockBasic, type:Loader.TEXT } );
			loads.push( { url:"res/atlas/comp.atlas", type:Loader.ATLAS } );
			loads.push({ url:"res/atlas/view.atlas", type:Loader.ATLAS });
			Laya.loader.load(loads, new Handler(this, start), null);
			
		}
		private function onStageResize(box:Box):void
		{
			box.width = Laya.stage.width /scaleRate;
			box.height = Laya.stage.height/scaleRate;
		}
		public static var scaleRate:Number = 2;
		public function start():void
		{
			var container:Sprite;
			if (Browser.pixelRatio > 1)
			{
				scaleRate = Browser.pixelRatio;
				var box:Box;
				box = new Box();
				container = box;
				box.scale(scaleRate, scaleRate);
				Laya.stage.addChild(box);
				Laya.stage.on(Event.RESIZE, this, onStageResize, [box]);
				onStageResize(box);
			}else
			{
				container = Laya.stage;
			}
			var wiki:ReWikiView;
			wiki = new ReWikiView();
			wiki.left = wiki.right = wiki.top = wiki.bottom = 0;
			container.addChild(wiki);
		}
		
	}

}