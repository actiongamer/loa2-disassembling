package game.ui.guildModules.flag
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class GuildFlagRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="52" height="55" buttonMode="true">
			  <Image skin="png.uiGuildModule.公会排行-选中" x="-4" y="-3" sizeGrid="6,6,6,6" width="60" height="60" var="img_selected"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_1" x="-2" y="0" width="54" height="54"/>
			  <Image skin="png.comp.image" x="1" y="3" var="img" width="48" height="48" smoothing="true"/>
			</View>;
       
      
      public var img_selected:Image = null;
      
      public var img:Image = null;
      
      public function GuildFlagRenderUI()
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
