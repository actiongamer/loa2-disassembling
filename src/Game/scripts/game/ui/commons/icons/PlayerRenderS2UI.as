package game.ui.commons.icons
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class PlayerRenderS2UI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="50" height="50">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44"/>
			  <Label text="Lv.98" autoSize="left" x="1" y="2" width="46" height="18" var="txt_lv" style="普通说明"/>
			  <List x="1" y="-8" repeatX="3" spaceX="-10" var="list_tupo">
			    <TupoClipRender scale="0.7" name="render" runtime="game.ui.commons.icons.TupoClipRenderUI"/>
			  </List>
			</PlayerRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_lv:Label = null;
      
      public var list_tupo:List = null;
      
      public function PlayerRenderS2UI()
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
