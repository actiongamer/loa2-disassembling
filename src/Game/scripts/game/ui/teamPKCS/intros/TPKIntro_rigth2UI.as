package game.ui.teamPKCS.intros
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TPKIntro_rigth2UI extends View
   {
      
      protected static var uiView:XML = <View width="504" height="384">
			  <Image skin="png.uiTPKIntro.img_txt2" x="0" y="168" sizeGrid="10,40,10,10" height="224" centerX="0" width="504"/>
			  <Label text="\l50800115" autoSize="none" y="0" style="普通说明" width="490" height="202" multiline="true" wordWrap="true" var="txt_tip1" leading="5" centerX="0"/>
			  <Label text="\l999900250" autoSize="none" y="233" style="普通说明" width="490" multiline="true" wordWrap="true" var="txt_tip2" leading="2" centerX="0" x="0"/>
			  <Label text="\l50800125" autoSize="none" y="209" style="渐变1" width="504" multiline="false" wordWrap="false" var="txt_title1" leading="0" align="center" height="20" size="14" centerX="0"/>
			</View>;
       
      
      public var txt_tip1:Label = null;
      
      public var txt_tip2:Label = null;
      
      public var txt_title1:Label = null;
      
      public function TPKIntro_rigth2UI()
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
