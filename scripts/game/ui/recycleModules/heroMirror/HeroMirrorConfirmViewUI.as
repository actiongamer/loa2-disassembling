package game.ui.recycleModules.heroMirror
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.List;
   import game.ui.commons.icons.LotteryRenderS7UI;
   import game.ui.commons.icons.WealthRenderS14UI;
   
   public class HeroMirrorConfirmViewUI extends View
   {
      
      protected static var uiView:XML = <View width="395" height="250">
			  <Label text="确认进行此次英雄转换吗？" style="重要提示橘黄" width="323" height="18" centerX="0" y="32" align="center" x="36" var="txt_109001016"/>
			  <Label text="\l109001023" style="重要提示绿" height="18" y="106" align="left" x="25"/>
			  <Box y="174" var="box_costWealth" centerX="0" x="89.5">
			    <Label text="本次消耗：" autoSize="left" y="5" style="普通说明" width="64" height="18" var="txt_30609005"/>
			    <List x="62" repeatX="2" var="list_cost">
			      <LotteryRenderS7 name="render" runtime="game.ui.commons.icons.LotteryRenderS7UI"/>
			    </List>
			  </Box>
			  <List y="51" repeatX="5" spaceX="15" var="costList" x="25">
			    <WealthRenderS14 name="render" runtime="game.ui.commons.icons.WealthRenderS14UI"/>
			  </List>
			  <List y="121" repeatX="5" spaceX="15" var="rewardList" x="25">
			    <WealthRenderS14 name="render" runtime="game.ui.commons.icons.WealthRenderS14UI"/>
			  </List>
			</View>;
       
      
      public var txt_109001016:Label = null;
      
      public var box_costWealth:Box = null;
      
      public var txt_30609005:Label = null;
      
      public var list_cost:List = null;
      
      public var costList:List = null;
      
      public var rewardList:List = null;
      
      public function HeroMirrorConfirmViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS7UI"] = LotteryRenderS7UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS14UI"] = WealthRenderS14UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
