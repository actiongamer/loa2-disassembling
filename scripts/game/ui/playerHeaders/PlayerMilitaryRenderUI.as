package game.ui.playerHeaders
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class PlayerMilitaryRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="64" height="64" buttonMode="false">
			  <Image skin="png.uiPlayerHeader.黑底" x="-28" y="22"/>
			  <Label text="徽章一览" autoSize="none" x="-37" y="39" style="渐变蓝" align="center" var="txt_badge" width="140" height="24" size="15" bold="false"/>
			  <Image skin="png.uiPlayerHeader.img_bg3" buttonMode="true" var="img_bg" x="10" y="0"/>
			  <Image skin="png.uiPlayerHeader.徽章" x="32" y="23" buttonMode="true" var="img_militaryIcon" mouseEnabled="false" mouseChildren="false" anchorX="0.5" anchorY="0.5" autoSize="true" smoothing="true"/>
			</View>;
       
      
      public var txt_badge:Label = null;
      
      public var img_bg:Image = null;
      
      public var img_militaryIcon:Image = null;
      
      public function PlayerMilitaryRenderUI()
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
