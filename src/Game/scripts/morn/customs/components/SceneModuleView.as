package morn.customs.components
{
   import morn.customs.expands.MornExpandUtil;
   
   public class SceneModuleView extends ModuleViewBase
   {
       
      
      public function SceneModuleView()
      {
         super();
         MornExpandUtil.setLayout(this);
      }
   }
}
