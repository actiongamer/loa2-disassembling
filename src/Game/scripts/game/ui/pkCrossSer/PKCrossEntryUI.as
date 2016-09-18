package game.ui.pkCrossSer
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PKCrossEntryUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Image skin="png.comp.image" x="239" y="204" centerX="0" centerY="0" var="img_bg" autoSize="true"/>
			  <Image skin="png.uiPKCrossSer.entry.img_bg" x="5" y="103"/>
			  <Image skin="png.uiPKCrossSer.entry.img_title" x="62" y="-11"/>
			  <Label text="普通说明" autoSize="none" x="23" y="110" style="普通说明" width="595" height="317" multiline="true" align="left" var="txt_info" size="12" wordWrap="true" leading="-3"/>
			  <Label text="23:00:00" autoSize="none" x="23" y="437" style="渐变1" width="595" height="30" align="center" var="txt_countdown" size="25"/>
			  <Label text="\l999001127" autoSize="none" x="23" y="27" style="渐变2" width="595" height="30" align="center" size="25"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var txt_info:Label = null;
      
      public var txt_countdown:Label = null;
      
      public function PKCrossEntryUI()
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
