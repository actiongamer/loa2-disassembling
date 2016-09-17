package game.ui.roleInfos.equipPanels
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class RoleDetailPropRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="142" height="19">
			  <Label text="突破等级:" autoSize="none" x="10" y="1" width="70" height="18" align="left" var="txt_name" style="加底标题深"/>
			  <Image skin="png.a5.bgs.panelBgs.数值底" x="74" y="1"/>
			  <Label text="Lv.90" autoSize="none" x="69" y="1" color="0xffecb4" bold="true" width="73" height="18" align="center" size="12" var="txt_value" labelFilterKind="无"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function RoleDetailPropRenderUI()
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
