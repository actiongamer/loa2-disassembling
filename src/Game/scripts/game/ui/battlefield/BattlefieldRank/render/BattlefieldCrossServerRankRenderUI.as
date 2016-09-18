package game.ui.battlefield.BattlefieldRank.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class BattlefieldCrossServerRankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="522" height="32">
			  <Label text="张飞" autoSize="none" x="77" y="10" style="普通说明" width="79" align="left" var="txt_name"/>
			  <Label autoSize="none" x="132" y="9" style="普通说明" width="113" align="center" var="txt_server" height="20" text="10"/>
			  <Label text="100W" autoSize="none" x="255" y="9" style="普通说明" width="69" align="left" var="txt_fightValue" height="20"/>
			  <Label text="50%" autoSize="none" x="415" y="9" style="普通说明" width="61" align="left" var="txt_victoryPer" height="20"/>
			  <Label text="1000" autoSize="none" x="334" y="9" style="普通说明" width="60" align="left" var="txt_victoryCnt" height="20"/>
			  <Label text="50%" autoSize="none" x="489" y="9" style="普通说明" width="59" align="left" var="txt_score" height="20"/>
			  <Label text="1" autoSize="none" x="26" y="9" style="普通说明" width="42" align="left" var="txt_rank" height="20"/>
			  <Image skin="png.a5.comps.img_block" x="31" y="18" anchorX="0.5" anchorY="0.5" var="img_rank"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_server:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var txt_victoryPer:Label = null;
      
      public var txt_victoryCnt:Label = null;
      
      public var txt_score:Label = null;
      
      public var txt_rank:Label = null;
      
      public var img_rank:Image = null;
      
      public function BattlefieldCrossServerRankRenderUI()
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
