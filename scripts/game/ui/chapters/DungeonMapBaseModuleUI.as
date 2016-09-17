package game.ui.chapters
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.btns.BtnLongBarUI;
   import morn.core.components.Image;
   
   public class DungeonMapBaseModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="1000" height="600">
			  <PanelBg width="1000" height="600" panelDragEnabled="false" x="0" y="0"/>
			  <BtnLongBar x="952" y="32" var="btn_right" runtime="game.ui.commons.comps.btns.BtnLongBarUI"/>
			  <BtnLongBar x="54" y="32" var="btn_left" scaleX="-1" runtime="game.ui.commons.comps.btns.BtnLongBarUI"/>
			  <Image skin="png.a5.comps.img_block" var="img_bg" visible="true" smoothing="true" width="995" height="570" x="3" y="26"/>
			</PopModuleView>;
       
      
      public var btn_right:BtnLongBarUI = null;
      
      public var btn_left:BtnLongBarUI = null;
      
      public var img_bg:Image = null;
      
      public function DungeonMapBaseModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnLongBarUI"] = BtnLongBarUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
