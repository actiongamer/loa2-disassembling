package game.ui.guildPKCrossSer
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   
   public class GPKIntroPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="585" height="568">
			  <PanelBg x="13" y="8" width="557" height="558"/>
			  <Image skin="png.comp.image" y="39" height="502" width="532" var="img_bg" centerX="0"/>
			  <Image skin="png.uiPkIntro.img_intro_tbg" y="59" centerX="0"/>
			  <Label text="渐变1" autoSize="none" x="231.5" y="64" style="渐变1" width="148" height="22" align="center" centerX="0" var="txt_title"/>
			  <Label text="普通说明" autoSize="none" y="110" style="普通说明" width="504" height="384" multiline="true" wordWrap="true" var="txt_intro" centerX="0"/>
			  <PageBarS2 y="520" var="pageBarUI" centerX="0" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var txt_title:Label = null;
      
      public var txt_intro:Label = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public function GPKIntroPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
