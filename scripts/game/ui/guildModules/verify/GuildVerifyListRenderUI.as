package game.ui.guildModules.verify
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class GuildVerifyListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="560" height="30">
			  <Label text="名字" autoSize="none" x="27" y="7" bold="false" width="104" height="18" var="txt_name" style="普通说明" align="center" underline="true"/>
			  <Label text="100" autoSize="none" x="129" y="7" bold="false" width="97" height="18" align="center" var="txt_lvl" style="普通说明"/>
			  <Label text="\l999000818" autoSize="none" x="213" y="7" bold="false" width="84" height="18" align="center" var="txt_type" style="普通说明"/>
			  <Label text="1000000" autoSize="none" x="310" y="7" bold="false" align="center" width="72" height="18" var="txt_power" style="普通说明"/>
			  <Button label="\l11000859" stateNum="1" buttonMode="true" labelColors="0xebe5d6,0xe1dfd6,0xada99b" labelSize="13" labelFont="FZZHB" x="409" y="2" sizeGrid="3,3,3,3" width="70" height="24" var="btn_accept" style="按钮小绿"/>
			  <Button label="\l11000860" stateNum="1" buttonMode="true" labelColors="0xebe5d6,0xe1dfd6,0xada99b" labelSize="13" labelFont="FZZHB" x="480" y="2" sizeGrid="3,3,3,3" var="btn_deny" style="按钮小红" width="70" height="24"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_lvl:Label = null;
      
      public var txt_type:Label = null;
      
      public var txt_power:Label = null;
      
      public var btn_accept:Button = null;
      
      public var btn_deny:Button = null;
      
      public function GuildVerifyListRenderUI()
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
