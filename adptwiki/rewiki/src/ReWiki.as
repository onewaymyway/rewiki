package 
{
	import laya.display.Stage;
	import laya.net.Loader;
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
			
			var loads:Array;
			loads = [];
			//loads.push( { url:PathConfig.stockBasic, type:Loader.TEXT } );
			loads.push( { url:"res/atlas/comp.atlas", type:Loader.ATLAS } );
			loads.push({ url:"res/atlas/view.atlas", type:Loader.ATLAS });
			Laya.loader.load(loads, new Handler(this, start), null);
			
		}
		
		public function start():void
		{
			var wiki:ReWikiView;
			wiki = new ReWikiView();
			wiki.left = wiki.right = wiki.top = wiki.bottom = 0;
			Laya.stage.addChild(wiki);
		}
		
	}

}