package game.ui.arenas.ranks
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class ArenaRankRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="340" height="20">
			  <Label text="随品质变化" autoSize="none" style="随品质变化" x="70" y="1" var="txt_name" align="center" width="127" height="18"/>
			  <Label text="1" autoSize="none" style="普通说明" x="1" y="1" var="txt_rank" align="center" width="59" height="18"/>
			  <Label text="1" autoSize="none" style="普通说明" x="195" y="1" var="txt_lv" align="center" width="59" height="18"/>
			  <Image skin="png.uiActRank.红箭头" x="290" y="0" var="img_arrow"/>
			  <Label autoSize="none" style="普通说明" x="271" y="1" var="txt_noChange" align="center" width="64" height="18" text="—"/>
			</PlayerRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_rank:Label = null;
      
      public var txt_lv:Label = null;
      
      public var img_arrow:Image = null;
      
      public var txt_noChange:Label = null;
      
      public function ArenaRankRenderUI()
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
