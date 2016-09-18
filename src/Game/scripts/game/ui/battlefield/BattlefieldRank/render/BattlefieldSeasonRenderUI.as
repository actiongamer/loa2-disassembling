package game.ui.battlefield.BattlefieldRank.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class BattlefieldSeasonRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="530" height="85">
			  <Image skin="png.uiBattlefields.battlefieldRankModule.img_seasonBg" x="4" y="4"/>
			  <Image skin="png.uiBattlefields.battlefieldRankModule.img_selected" x="-2" y="4" name="selectBoxAll" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.a5.comps.img_block" x="51" y="42" anchorX="0.5" anchorY="0.5" var="img_icon" autoSize="false" width="64" height="64"/>
			  <Label text="排位等级：黄金一阶" autoSize="none" x="94" y="22" style="普通说明" width="126" align="left" var="txt_name" height="20"/>
			  <Label text="排位等级：黄金一阶" autoSize="none" x="94" y="46" style="普通说明" width="132" align="left" var="txt_condition" height="39" multiline="true" wordWrap="true"/>
			  <List x="222" y="17" repeatX="4" spaceX="2" var="list_reward">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Button label="\l41300086" x="434" y="31" style="按钮中绿" var="btn_reward"/>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="438" y="3" var="img_finished"/>
			  <Box x="1" y="4" var="box_isNowRank">
			    <Image skin="png.a5.commonImgs.img_redLabel" x="2"/>
			    <Label text="我的排位" autoSize="none" y="29" style="渐变1" width="126" align="left" var="txt_isNowRank" height="20" size="12"/>
			  </Box>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_condition:Label = null;
      
      public var list_reward:List = null;
      
      public var btn_reward:Button = null;
      
      public var img_finished:Image = null;
      
      public var box_isNowRank:Box = null;
      
      public var txt_isNowRank:Label = null;
      
      public function BattlefieldSeasonRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
