package game.ui.commons.icons
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class PlayerRenderS3UI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="80" height="80">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="80" height="80"/>
			  <Image skin="png.comp.image" var="img_icon" width="75" height="75" x="2" y="2"/>
			  <Label text="Lv.98" autoSize="left" x="8" y="57" width="71" var="txt_lv" style="普通说明" size="15"/>
			  <List x="4" y="-10" repeatX="3" var="list_tupo" spaceX="-5">
			    <TupoClipRender name="render" runtime="game.ui.commons.icons.TupoClipRenderUI"/>
			  </List>
			</PlayerRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_lv:Label = null;
      
      public var list_tupo:List = null;
      
      public function PlayerRenderS3UI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.TupoClipRenderUI"] = TupoClipRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
