package game.ui.battlefield.BattlefieldRank.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class BattlefieldLocalRankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="522" height="32">
			  <Label text="张飞" autoSize="none" x="72" y="8" style="普通说明" align="left" var="txt_name"/>
			  <Label text="100W" autoSize="none" x="159" y="7" style="普通说明" width="89" align="left" var="txt_fightValue" height="20"/>
			  <Label text="50%" autoSize="none" x="321" y="7" style="普通说明" width="61" align="left" var="txt_victoryPer" height="20"/>
			  <Label text="1000" autoSize="none" x="253" y="7" style="普通说明" width="60" align="left" var="txt_victoryCnt" height="20"/>
			  <Label text="50%" autoSize="none" x="394" y="7" style="普通说明" width="59" align="left" var="txt_score" height="20"/>
			  <Label text="1" autoSize="none" x="26" y="7" style="普通说明" width="42" align="left" var="txt_rank" height="20"/>
			  <Label text="50%" autoSize="none" x="491" y="7" style="普通说明" width="59" align="left" var="txt_crossRank" height="20"/>
			  <Image skin="png.a5.comps.img_block" x="32" y="15" anchorX="0.5" anchorY="0.5" var="img_rank"/>
			  <Image skin="png.a5.comps.img_block" x="494" y="16" anchorX="0.5" anchorY="0.5" var="img_crossRank"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var txt_victoryPer:Label = null;
      
      public var txt_victoryCnt:Label = null;
      
      public var txt_score:Label = null;
      
      public var txt_rank:Label = null;
      
      public var txt_crossRank:Label = null;
      
      public var img_rank:Image = null;
      
      public var img_crossRank:Image = null;
      
      public function BattlefieldLocalRankRenderUI()
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
