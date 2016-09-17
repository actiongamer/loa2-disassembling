package game.ui.guildDungeon.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class GuildDungeonRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="1000" height="570">
			  <Image skin="png.a5.comps.img_block" var="img_bg" visible="true" smoothing="true" width="1000" height="570"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public function GuildDungeonRenderUI()
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
