package game.ui.battlefield.BattlefieldTeam.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class BattlefieldMemberRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="350" height="78">
			  <Image skin="png.uiBattlefields.battlefieldTeamModule.img_normalBg" x="0" y="0" var="img_bg"/>
			  <Label text="张飞" autoSize="none" x="89" y="14" style="普通说明" width="104" align="left" var="txt_name"/>
			  <Image skin="png.a5.comps.img_block" x="40" y="30" width="73" height="68" var="img_head" anchorX="0.5" anchorY="0.5" autoSize="true" scale="0.8" smoothing="true"/>
			  <Label text="等级：10" autoSize="none" x="89" y="50" style="普通说明" width="104" align="left" var="txt_level"/>
			  <Label text="战力：100W" autoSize="none" x="161" y="50" style="普通说明" width="104" align="left" var="txt_fightValue"/>
			  <Label text="黄金一阶" autoSize="none" x="197" y="14" style="普通说明" width="104" align="left" var="txt_rank"/>
			  <Button skin="png.a5.btns.btn_closeS6" x="324" y="2" stateNum="1" var="btn_kick"/>
			  <Label text="积分：" autoSize="none" x="253" y="50" style="普通说明" width="92" align="left" var="txt_score" height="20"/>
			  <Image skin="png.a5.commonImgs.img_leader" x="-13" y="-10" var="img_leader"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var txt_name:Label = null;
      
      public var img_head:Image = null;
      
      public var txt_level:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var txt_rank:Label = null;
      
      public var btn_kick:Button = null;
      
      public var txt_score:Label = null;
      
      public var img_leader:Image = null;
      
      public function BattlefieldMemberRenderUI()
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
