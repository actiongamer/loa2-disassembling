package game.ui.roleInfos.phaseUps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class PhashUpPropRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="160" height="18">
			  <Label text="+130%" autoSize="left" x="51" y="1" color="0xc2beaf" width="38" height="18" var="txt_value"/>
			  <Label text="攻击攻击" autoSize="left" x="0" y="0" color="0xc2beaf" height="18" var="txt_name"/>
			  <Image skin="png.uiRoleInfo.subPanels.img_arrowGreen" x="89" y="3" var="img_arrowGreen"/>
			  <Label text="+140%" autoSize="left" x="110" y="1" color="0xfa221" width="40" height="18" var="txt_valueNext"/>
			</View>;
       
      
      public var txt_value:Label = null;
      
      public var txt_name:Label = null;
      
      public var img_arrowGreen:Image = null;
      
      public var txt_valueNext:Label = null;
      
      public function PhashUpPropRenderUI()
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
