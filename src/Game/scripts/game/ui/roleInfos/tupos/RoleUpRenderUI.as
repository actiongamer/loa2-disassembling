package game.ui.roleInfos.tupos
{
   import morn.core.components.View;
   
   public class RoleUpRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="20" height="20">
			  <Image skin="png.uiRoleInfo.tupo.img_arrowup" x="6" y="3"/>
			</View>;
       
      
      public function RoleUpRenderUI()
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
