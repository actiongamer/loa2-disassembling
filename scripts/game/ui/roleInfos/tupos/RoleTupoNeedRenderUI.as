package game.ui.roleInfos.tupos
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRenderS17UI;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RoleTupoNeedRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="56" height="56">
			  <WealthRenderS17 x="0" y="0" var="render_item" runtime="game.ui.commons.icons.WealthRenderS17UI"/>
			  <Image skin="png.uiRoleInfo.黄加" x="37" y="37" var="img_plus" centerX="0" centerY="0"/>
			  <Label var="txt_get" text="获取" autoSize="none" x="2" y="36" style="按钮文字" visible="false" buttonMode="true" mouseEnabled="false" mouseChildren="false" width="50" height="20" align="right"/>
			  <Label var="txt_status" text="获取" autoSize="none" x="-7" y="53" style="重要提示绿" visible="true" buttonMode="true" mouseEnabled="false" mouseChildren="false" width="70" height="20" align="center"/>
			</View>;
       
      
      public var render_item:WealthRenderS17UI = null;
      
      public var img_plus:Image = null;
      
      public var txt_get:Label = null;
      
      public var txt_status:Label = null;
      
      public function RoleTupoNeedRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS17UI"] = WealthRenderS17UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
