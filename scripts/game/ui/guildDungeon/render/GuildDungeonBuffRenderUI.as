package game.ui.guildDungeon.render
{
   import morn.customs.components.BuffRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GuildDungeonBuffRenderUI extends BuffRender
   {
      
      protected static var uiView:XML = <BuffRender width="32" height="32">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="0" y="0" var="img_quality" width="32" height="32" sizeGrid="8,8,8,8"/>
			  <Image skin="png.comp.image" x="4" y="4" width="24" height="24" var="img_icon"/>
			  <Label text="1" autoSize="none" x="2" y="12" color="0xc2beaf" size="12" width="29" height="18" align="right" var="txt_layers" bold="false"/>
			</BuffRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_layers:Label = null;
      
      public function GuildDungeonBuffRenderUI()
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
