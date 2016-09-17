package game.ui.vipModule.render
{
   import morn.core.components.View;
   import morn.core.components.List;
   
   public class VipPrivilegesRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="51" height="656">
			  <List repeatY="16" var="func_list">
			    <VipPrivilegeRender x="0" y="0" name="render" runtime="game.ui.vipModule.render.VipPrivilegeRenderUI"/>
			  </List>
			</View>;
       
      
      public var func_list:List = null;
      
      public function VipPrivilegesRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.vipModule.render.VipPrivilegeRenderUI"] = VipPrivilegeRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
