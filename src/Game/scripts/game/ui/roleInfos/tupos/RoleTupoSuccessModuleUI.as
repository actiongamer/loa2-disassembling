package game.ui.roleInfos.tupos
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.ClickToNextUI;
   
   public class RoleTupoSuccessModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="600">
			  <Image skin="png.uiRoleInfo.tupo.img_tupoSuccessTitle" x="391" y="7" var="img_title" anchorX="0.5" anchorY="0.5"/>
			  <ClickToNext x="324.5" y="534" var="box_tip" runtime="game.ui.commons.comps.others.ClickToNextUI"/>
			</PopModuleView>;
       
      
      public var img_title:Image = null;
      
      public var box_tip:ClickToNextUI = null;
      
      public function RoleTupoSuccessModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.ClickToNextUI"] = ClickToNextUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
