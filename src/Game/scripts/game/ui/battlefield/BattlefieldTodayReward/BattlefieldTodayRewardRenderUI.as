package game.ui.battlefield.BattlefieldTodayReward
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class BattlefieldTodayRewardRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="192" height="298">
			  <Image skin="png.uiBattlefields.battlefieldTodayRewardModule.img_bg" x="-5" y="-4"/>
			  <Image skin="png.uiBattlefields.battlefieldTodayRewardModule.img_labelBg" x="2" y="35"/>
			  <Image skin="png.uiBattlefields.battlefieldTodayRewardModule.img_labelBg" x="2" y="107"/>
			  <Image skin="png.uiBattlefields.battlefieldTodayRewardModule.img_splitLine" x="4" y="147"/>
			  <Image skin="png.uiBattlefields.battlefieldTodayRewardModule.img_blackBg" x="1" y="242"/>
			  <Button label="\l50400405" x="36.5" y="248" style="按钮大绿" var="btn_award"/>
			  <Label text="战场目标" autoSize="none" x="2" y="2" style="渐变1" width="188" align="center" height="46" var="txt_name" size="14" multiline="true" wordWrap="true"/>
			  <Label text="\l50500137" autoSize="none" x="6" y="37" style="加底标题" width="65" align="center" height="20"/>
			  <Label text="\l50500138" autoSize="none" x="6" y="109" style="加底标题" width="65" align="center" height="20"/>
			  <Label text="单场最高" autoSize="none" x="12" y="64" style="普通说明" width="177" align="left" height="38" var="txt_target" multiline="false" wordWrap="true"/>
			  <List x="11" y="158" repeatX="3" spaceX="10" var="list_reward">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_finished" x="110" y="1" var="img_finished"/>
			</View>;
       
      
      public var btn_award:Button = null;
      
      public var txt_name:Label = null;
      
      public var txt_target:Label = null;
      
      public var list_reward:List = null;
      
      public var img_finished:Image = null;
      
      public function BattlefieldTodayRewardRenderUI()
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
