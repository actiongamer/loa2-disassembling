package game.ui.arenas.ranks
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.customs.components.GCircle;
   import morn.core.components.Label;
   
   public class ArenaRankTopRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="95" height="90">
			  <Image skin="png.a5.comps.img_block" x="19" y="0" width="56" height="56" var="img_icon"/>
			  <GCircle fillAlpha="1" lineAlpha="0" x="19" y="0" width="56" height="56" var="img_mask"/>
			  <Label text="第一名" autoSize="none" x="19" y="55" style="小标题" var="txt_rank" align="center" width="59" height="18"/>
			  <Label text="第一名" autoSize="none" x="2" y="72" style="普通说明" var="txt_name" align="center" width="93" height="18"/>
			</PlayerRender>;
       
      
      public var img_icon:Image = null;
      
      public var img_mask:GCircle = null;
      
      public var txt_rank:Label = null;
      
      public var txt_name:Label = null;
      
      public function ArenaRankTopRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
