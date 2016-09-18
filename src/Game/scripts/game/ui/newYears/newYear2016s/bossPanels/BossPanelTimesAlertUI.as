package game.ui.newYears.newYear2016s.bossPanels
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class BossPanelTimesAlertUI extends View
   {
      
      protected static var uiView:XML = <View width="374" height="256">
			  <GRect fillAlpha="0.6" radius="4,4,4,4" lineAlpha="0" x="114.5" y="92" width="145" height="34" fillColor="0x333333"/>
			  <Label text="剩余次数:" autoSize="none" x="130" y="101" style="普通说明" width="61" height="20" var="txt_label"/>
			  <Label text="99/99" autoSize="none" x="188" y="101" style="普通说明" width="39" height="20" var="txt_times" align="center"/>
			  <Button skin="png.a5.comps.numBars.btn_plus" x="228" y="99" stateNum="1" var="btn_add"/>
			  <Label text="是否攻打年兽" autoSize="none" x="95.5" y="63" style="小标题" size="14" var="txt_content" width="183" height="20" align="center"/>
			  <Label text="是否攻打年兽" autoSize="none" x="84" y="131" style="普通说明" size="14" var="txt_tip" width="206" height="20" align="center"/>
			</View>;
       
      
      public var txt_label:Label = null;
      
      public var txt_times:Label = null;
      
      public var btn_add:Button = null;
      
      public var txt_content:Label = null;
      
      public var txt_tip:Label = null;
      
      public function BossPanelTimesAlertUI()
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
