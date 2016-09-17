package game.ui.battlefield.BattlefieldRankReward.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class BattlefieldRankRewardRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="425" height="142">
			  <Label text="称号奖励：" autoSize="none" x="91" y="24" style="渐变1" width="269" align="left" size="14" font="Microsoft YaHei" height="22" var="txt_title" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.a5.commonImgs.rankBig1" x="44" y="65" var="img_icon" anchorX="0.5" anchorY="0.5"/>
			  <Box x="-2" y="-3" var="box_isNowRank">
			    <Image skin="png.a5.commonImgs.img_redLabel" x="2"/>
			    <Label text="我的排位" autoSize="none" y="29" style="渐变1" width="126" align="left" var="txt_isNowRank" height="20" size="12"/>
			  </Box>
			  <Label text="称号获得" autoSize="none" x="0" y="108" style="渐变2" width="89" align="center" var="txt_rank" size="14" height="22"/>
			  <List x="91" y="79" repeatX="5" spaceX="5." var="list_reward">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.分割线" x="2" y="137"/>
			</View>;
       
      
      public var txt_title:Label = null;
      
      public var img_icon:Image = null;
      
      public var box_isNowRank:Box = null;
      
      public var txt_isNowRank:Label = null;
      
      public var txt_rank:Label = null;
      
      public var list_reward:List = null;
      
      public function BattlefieldRankRewardRenderUI()
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
