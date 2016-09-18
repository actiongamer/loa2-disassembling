package game.ui.familyBosses
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import game.ui.familyBosses.render.FamilyBossRewardShowRenderUI;
   
   public class DamageRewardShowPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="250" height="260">
			  <Box x="-2" y="-2" var="box_content">
			    <Box var="box_reward">
			      <Image skin="png.uiFamilyBosses.底框"/>
			    </Box>
			    <List x="4" y="4" repeatY="3" spaceY="5" var="list_reward">
			      <FamilyBossRewardShowRender name="render" runtime="game.ui.familyBosses.render.FamilyBossRewardShowRenderUI"/>
			    </List>
			    <Button label="前往领奖" x="83" style="按钮中绿" y="221" var="btn_getReward" centerX="0"/>
			  </Box>
			  <Box x="222" y="3" var="box_mini" width="26" height="25">
			    <Button skin="png.a5.commonImgs.btn_small" stateNum="1" var="btn_mini"/>
			    <Image skin="png.a5.commonImgs.img_suofang" x="12" y="12" anchorX=".5" anchorY=".5" var="img_suofang" mouseEnabled="false" mouseChildren="false" rotation="180"/>
			  </Box>
			</View>;
       
      
      public var box_content:Box = null;
      
      public var box_reward:Box = null;
      
      public var list_reward:List = null;
      
      public var btn_getReward:Button = null;
      
      public var box_mini:Box = null;
      
      public var btn_mini:Button = null;
      
      public var img_suofang:Image = null;
      
      public function DamageRewardShowPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.familyBosses.render.FamilyBossRewardShowRenderUI"] = FamilyBossRewardShowRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
