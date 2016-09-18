package game.ui.commons.icons
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class HeroRenderS1UI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="50" height="50">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="8" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="3" y="11" var="img_icon" width="44" height="44"/>
			  <Label text="Lv.98" x="3" y="39" width="46" height="18" var="txt_lv" style="普通说明" align="right"/>
			  <List x="1" y="0" repeatX="3" spaceX="-10" var="list_tupo">
			    <TupoClipRender scale="0.7" name="render" runtime="game.ui.commons.icons.TupoClipRenderUI"/>
			  </List>
			  <Label text="Lv.98" y="58" height="20" var="txt_shengjielv" align="center" style="普通说明" x="-1.5" width="53"/>
			</PlayerRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_lv:Label = null;
      
      public var list_tupo:List = null;
      
      public var txt_shengjielv:Label = null;
      
      public function HeroRenderS1UI()
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
