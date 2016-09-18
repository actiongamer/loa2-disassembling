package game.ui.alerts
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Image;
   
   public class MsgTopCenterModuleUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="700" height="42">
			  <Image skin="png.a5.commonImgs.跑马灯" var="bg" left="0" right="0"/>
			</StaticModuleView>;
       
      
      public var bg:Image = null;
      
      public function MsgTopCenterModuleUI()
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
