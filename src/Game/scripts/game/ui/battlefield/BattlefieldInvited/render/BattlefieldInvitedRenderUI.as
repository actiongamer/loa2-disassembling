package game.ui.battlefield.BattlefieldInvited.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Image;
   
   public class BattlefieldInvitedRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="376" height="95">
			  <Image skin="png.uiBattlefields.battlefieldInvitedModule.img_renderBg" x="-1" y="-1"/>
			  <Label text="姓名" autoSize="none" x="89" y="28" style="普通说明" width="276" align="left" var="txt_info" height="20"/>
			  <Label text="等级：10" autoSize="none" x="88" y="7" style="普通说明" width="63" align="left" var="txt_level" height="20"/>
			  <Label text="战力：100W" autoSize="none" x="166" y="7" style="普通说明" width="104" align="left" var="txt_fightValue" height="20"/>
			  <Button label="\l50500057" x="147" y="57" style="按钮小绿3" var="btn_accept"/>
			  <Button label="\l50500058" x="228" y="57" style="按钮小红" var="btn_refuse"/>
			  <Image skin="png.a5.comps.img_block" x="43" y="45" width="73" height="68" var="img_head" anchorX="0.5" anchorY="0.5" autoSize="true" scale="0.8" smoothing="true"/>
			  <Label text="战力：100W" autoSize="none" x="268" y="7" style="普通说明" width="104" align="left" var="txt_score" height="20"/>
			</View>;
       
      
      public var txt_info:Label = null;
      
      public var txt_level:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var btn_accept:Button = null;
      
      public var btn_refuse:Button = null;
      
      public var img_head:Image = null;
      
      public var txt_score:Label = null;
      
      public function BattlefieldInvitedRenderUI()
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
