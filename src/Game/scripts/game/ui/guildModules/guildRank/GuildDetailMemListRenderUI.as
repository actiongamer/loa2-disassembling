package game.ui.guildModules.guildRank
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GuildDetailMemListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="560" height="30">
			  <Image skin="png.a5.commonImgs.公会排行-选中" width="560" height="30" sizeGrid="8,8,8,8," var="img_select" x="0" y="2"/>
			  <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" width="560" height="30" x="0"/>
			  <Label text="大脚哥布林" autoSize="none" bold="false" width="103" var="txt_name" buttonMode="true" selectable="false" underline="true" align="center" style="普通说明" x="44" y="8" mouseChildren="true"/>
			  <Label text="100" autoSize="none" x="171" bold="false" width="97" align="center" var="txt_lvl" style="普通说明" y="8" height="20"/>
			  <Label text="高级官员" autoSize="none" x="280" bold="false" width="97" align="center" var="txt_pos" y="8" mouseEnabled="false" style="普通说明"/>
			  <Label text="10020万" autoSize="none" x="423" bold="false" align="center" width="120" var="txt_power" style="普通说明" y="8" mouseEnabled="false"/>
			</View>;
       
      
      public var img_select:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_lvl:Label = null;
      
      public var txt_pos:Label = null;
      
      public var txt_power:Label = null;
      
      public function GuildDetailMemListRenderUI()
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
