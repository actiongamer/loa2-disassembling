package game.ui.vipModule.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class VipPrivilegeRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="51" height="41">
			  <Image skin="png.uiVip.选中9宫格" width="51" visible="false" var="img_selected"/>
			  <Label text="dsa" autoSize="none" x="0" y="10.5" style="普通说明" width="51" align="center" var="txt_prompt"/>
			</View>;
       
      
      public var img_selected:Image = null;
      
      public var txt_prompt:Label = null;
      
      public function VipPrivilegeRenderUI()
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
