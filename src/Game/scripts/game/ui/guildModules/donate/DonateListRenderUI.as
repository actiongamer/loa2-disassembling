package game.ui.guildModules.donate
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.CheckBox;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS16UI;
   
   public class DonateListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="180" height="250" buttonMode="true">
			  <Image skin="png.uiGuildModule.donate.img_donateBg1" x="0" y="1" var="img_bg"/>
			  <Image skin="png.uiGuildModule.donate.img_donateTitle1" x="86" y="20" anchorX=".5" anchorY=".5" var="img_title"/>
			  <Label text="\l40700011" autoSize="left" x="42" y="68" style="普通说明" mouseChildren="false" mouseEnabled="false" language="en" lgx="22,42" lgy="68,68"/>
			  <Label text="+5" autoSize="none" x="60" y="68" style="普通说明" width="100" height="18" var="txt_exp" mouseChildren="false" mouseEnabled="false" align="right"/>
			  <Label text="\l40700010" autoSize="left" x="42" y="134" style="普通说明" mouseEnabled="false" mouseChildren="false" language="en" lgx="22,42" lgy="134,134"/>
			  <Label text="\l40700009" autoSize="left" x="42" y="47" style="普通说明" mouseChildren="false" mouseEnabled="false" language="en" lgx="22,42" lgy="47,47"/>
			  <Label text="+5" autoSize="none" x="60" y="47" style="普通说明" width="100" height="18" var="txt_score" mouseEnabled="false" mouseChildren="false" align="right"/>
			  <Label text="+5000" autoSize="left" x="60" y="134" style="普通说明" width="100" height="18" var="txt_contr" mouseEnabled="false" mouseChildren="false" align="right"/>
			  <CheckBox x="78" y="165" selected="true" style="CheckBox普通" var="selectedBox" mouseChildren="false" mouseEnabled="false"/>
			  <Button x="30" y="195" style="按钮大绿" var="btn_donate"/>
			  <Label text="\l3006" autoSize="left" x="42" y="112" style="普通说明" mouseEnabled="false" mouseChildren="false" language="en" lgx="22,42" lgy="112,112"/>
			  <Label text="+5000" autoSize="left" x="60" y="112" style="普通说明" width="100" height="18" var="txt_guildCoin" mouseEnabled="false" mouseChildren="false" align="right"/>
			  <Label text="\l40710520" autoSize="left" x="42" y="90" style="普通说明" mouseChildren="false" mouseEnabled="false" lgx="22,42" lgy="90,90" language="en"/>
			  <Label text="+5" x="60" y="90" style="普通说明" width="100" height="18" var="txt_fund" mouseChildren="false" mouseEnabled="false" align="right"/>
			  <WealthRenderS16 x="35" y="199" var="costRender" mouseEnabled="false" mouseChildren="false" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_title:Image = null;
      
      public var txt_exp:Label = null;
      
      public var txt_score:Label = null;
      
      public var txt_contr:Label = null;
      
      public var selectedBox:CheckBox = null;
      
      public var btn_donate:Button = null;
      
      public var txt_guildCoin:Label = null;
      
      public var txt_fund:Label = null;
      
      public var costRender:WealthRenderS16UI = null;
      
      public function DonateListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS16UI"] = WealthRenderS16UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
