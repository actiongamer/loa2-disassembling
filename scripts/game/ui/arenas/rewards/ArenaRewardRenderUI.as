package game.ui.arenas.rewards
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class ArenaRewardRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="351" height="77">
			  <Image skin="png.uiArenas.scores.红底02" x="-3" y="53"/>
			  <Label text="1" autoSize="none" x="-4" y="57" style="渐变2" var="txt_rank" align="center" width="96" height="18"/>
			  <Image skin="png.a5.commonImgs.rank1" x="44" y="13" anchorX="0.5" var="img_icon"/>
			  <List x="90" y="10" var="list_reward" repeatX="4" spaceX="2">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.splitLines.线" x="9" y="75" width="330"/>
			  <Image skin="png.uiArenas.scores.已领取" x="252" y="0" visible="false" var="img_get"/>
			  <Image skin="png.uiArenas.选中框2" var="img_selectBox"/>
			</View>;
       
      
      public var txt_rank:Label = null;
      
      public var img_icon:Image = null;
      
      public var list_reward:List = null;
      
      public var img_get:Image = null;
      
      public var img_selectBox:Image = null;
      
      public function ArenaRewardRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
