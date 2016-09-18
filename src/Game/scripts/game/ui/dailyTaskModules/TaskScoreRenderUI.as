package game.ui.dailyTaskModules
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   
   public class TaskScoreRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="30" height="30">
			  <Image skin="png.comp.image" width="30" height="30" var="img_icon" x="0" y="0"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public function TaskScoreRenderUI()
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
