package game.ui.roleInfos.equipPanels
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class DetailYuanfenInfoRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="283" height="19">
			  <Label text="【皮肤只用】" autoSize="none" x="4" y="1" color="0x3d1700" bold="true" width="279" height="18" align="left" size="12" var="txt_name" isHtml="true" style="普通说明暗色"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public function DetailYuanfenInfoRenderUI()
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
