package game.ui.battlefield.BattlefieldRank.panel
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class BattlefieldRankTopPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="550" height="90">
			  <Image skin="png.uiBattlefields.battlefieldRankModule.img_top" x="3" y="2"/>
			  <Image skin="png.uiBattlefields.battlefieldRankModule.img_lightBg" x="176" y="30"/>
			  <Label text="我的积分：1" autoSize="none" x="18" y="29" style="普通说明" width="122" align="left" height="20" var="txt_myScore"/>
			  <Label text="我的排位：黄金一阶" autoSize="none" x="18" y="11" style="普通说明" align="left" height="20" var="txt_myGrade"/>
			  <Label text="下个月1号开启跨服战场新赛季" autoSize="none" x="80" y="31" style="渐变1" width="398" align="center" height="26" var="txt_leftDays"/>
			  <Label text="胜利" autoSize="none" x="18" y="47" style="普通说明" width="122" align="left" height="20" var="txt_victoryCnt"/>
			  <Label text="胜率" autoSize="none" x="18" y="65" style="普通说明" width="122" align="left" height="20" var="txt_victoryPer"/>
			  <Label autoSize="none" x="127.5" y="67" style="普通说明" width="295" align="center" height="20" var="txt_sjgj" centerX="0"/>
			</View>;
       
      
      public var txt_myScore:Label = null;
      
      public var txt_myGrade:Label = null;
      
      public var txt_leftDays:Label = null;
      
      public var txt_victoryCnt:Label = null;
      
      public var txt_victoryPer:Label = null;
      
      public var txt_sjgj:Label = null;
      
      public function BattlefieldRankTopPanelUI()
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
