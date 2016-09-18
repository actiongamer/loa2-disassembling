package game.ui.battlefield.BattlefieldTeam.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class BattlefieldInvitePlayersRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="403" height="23">
			  <Label text="张飞" autoSize="none" x="1" y="1" style="普通说明" width="79" align="left" var="txt_name"/>
			  <Label text="10" autoSize="none" x="89" y="1" style="普通说明" width="36" align="left" var="txt_level" height="20"/>
			  <Label text="100W" autoSize="none" x="148" y="1" style="普通说明" width="104" align="left" var="txt_fightValue" height="20"/>
			  <Label text="黄金一阶" autoSize="none" x="266" y="1" style="普通说明" width="72" align="left" var="txt_rank" height="20"/>
			  <Button label="邀请" x="328" y="-1" style="按钮小蓝" var="btn_invite"/>
			  <Label text="积分:" autoSize="none" x="209" y="1" style="普通说明" width="73" align="left" var="txt_point" height="20"/>
			  <Label text="已接受" autoSize="none" x="341" y="1" style="不足禁止红" width="44" align="left" var="txt_accepted" height="20"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_level:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var txt_rank:Label = null;
      
      public var btn_invite:Button = null;
      
      public var txt_point:Label = null;
      
      public var txt_accepted:Label = null;
      
      public function BattlefieldInvitePlayersRenderUI()
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
