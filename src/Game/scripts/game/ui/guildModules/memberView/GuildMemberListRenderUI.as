package game.ui.guildModules.memberView
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GuildMemberListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="763" height="30" buttonMode="false">
			  <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" width="763" height="30"/>
			  <Image skin="png.uiGuildModule.公会排行-选中" width="763" height="30" sizeGrid="8,8,8,8," var="img_selectedBg"/>
			  <Label text="大脚哥布林" autoSize="none" bold="false" width="103" height="18" var="txt_name" buttonMode="true" selectable="false" underline="true" align="center" style="普通说明" x="42" y="6" mouseChildren="true"/>
			  <Label text="100" autoSize="none" x="139" bold="false" width="97" height="18" align="center" var="txt_lvl" style="普通说明" y="6"/>
			  <Label text="高级官员" autoSize="none" x="225" bold="false" width="97" height="18" align="center" var="txt_pos" y="6" mouseEnabled="false" style="普通说明"/>
			  <Label text="10020万" autoSize="none" x="331" bold="false" align="center" width="120" height="18" var="txt_con" style="普通说明" y="6" mouseEnabled="false"/>
			  <Label text="在线" autoSize="none" x="565" bold="false" align="center" width="108" height="18" var="txt_status" style="普通说明" y="6" mouseEnabled="false"/>
			  <Label text="10020万" autoSize="none" x="455" bold="false" align="center" width="120" height="18" var="txt_power" style="普通说明" y="6" mouseEnabled="false"/>
			  <Label text="200" autoSize="none" x="663" bold="false" align="center" width="108" height="18" var="txt_active" style="普通说明" y="6" mouseEnabled="false"/>
			</View>;
       
      
      public var img_selectedBg:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_lvl:Label = null;
      
      public var txt_pos:Label = null;
      
      public var txt_con:Label = null;
      
      public var txt_status:Label = null;
      
      public var txt_power:Label = null;
      
      public var txt_active:Label = null;
      
      public function GuildMemberListRenderUI()
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
