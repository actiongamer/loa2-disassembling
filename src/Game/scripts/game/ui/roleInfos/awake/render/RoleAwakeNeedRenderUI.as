package game.ui.roleInfos.awake.render
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRenderS3UI;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class RoleAwakeNeedRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="50" height="50">
			  <WealthRenderS3 x="0" var="render_item" y="0" runtime="game.ui.commons.icons.WealthRenderS3UI"/>
			  <Label var="txt_get" text="获取" autoSize="none" x="11" y="18" style="按钮文字" visible="false" buttonMode="false" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.uiRoleInfo.黄加" var="img_plus" centerX="0" centerY="0" mouseEnabled="false" mouseChildren="false" x="-52" y="3"/>
			</View>;
       
      
      public var render_item:WealthRenderS3UI = null;
      
      public var txt_get:Label = null;
      
      public var img_plus:Image = null;
      
      public function RoleAwakeNeedRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS3UI"] = WealthRenderS3UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
