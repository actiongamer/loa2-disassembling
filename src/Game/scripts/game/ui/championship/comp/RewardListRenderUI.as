package game.ui.championship.comp
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class RewardListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="351" height="66">
			  <Image skin="png.uiArenas.选中框" x="0" y="0" var="img_selectBox"/>
			  <Label text="1" autoSize="none" x="-4" y="45" style="渐变2" var="txt_rank" align="center" width="96" height="18"/>
			  <Image skin="png.uiRankReward.图标-1" x="44" y="4" anchorX="0.5" var="img_icon"/>
			  <List x="88" y="4" var="list_reward" repeatX="4" spaceX="2">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.小框分割线" x="2" y="63" width="330"/>
			</View>;
       
      
      public var img_selectBox:Image = null;
      
      public var txt_rank:Label = null;
      
      public var img_icon:Image = null;
      
      public var list_reward:List = null;
      
      public function RewardListRenderUI()
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
