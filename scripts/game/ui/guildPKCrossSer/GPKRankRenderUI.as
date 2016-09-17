package game.ui.guildPKCrossSer
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Label;
   
   public class GPKRankRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="288" height="20">
			  <Label text="名字" autoSize="none" x="33" y="2" style="普通说明" var="txt_name" height="20" width="69" align="center"/>
			  <Label text="1" autoSize="none" x="0" y="2" style="普通说明" var="txt_rank" align="center" width="33" height="20"/>
			  <Label text="名字" autoSize="none" x="163" y="2" style="普通说明" var="txt_gx" height="20" width="80" align="center"/>
			  <Label text="1" autoSize="none" x="102" y="2" style="普通说明" var="txt_times" align="center" width="62" height="20"/>
			  <Label text="1" autoSize="none" x="242" y="2" style="普通说明" var="txt_win" align="center" width="45" height="20"/>
			</PlayerRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_rank:Label = null;
      
      public var txt_gx:Label = null;
      
      public var txt_times:Label = null;
      
      public var txt_win:Label = null;
      
      public function GPKRankRenderUI()
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
