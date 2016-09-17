package game.ui.roleInfos.awake.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RoleAwakePropRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="55" height="54">
			  <Image skin="png.uiRoleInfo.awake.英雄-觉醒-文字bj" x="-16" y="-7" var="img_bg"/>
			  <Label text="生命" autoSize="none" x="-42" y="10" style="普通说明" bold="true" var="prop_name" width="138" align="center" height="20"/>
			  <Label text="+200" autoSize="none" x="-20" y="25" style="普通说明" var="prop_value" align="center" width="94" height="20"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var prop_name:Label = null;
      
      public var prop_value:Label = null;
      
      public function RoleAwakePropRenderUI()
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
