package game.ui.commons.comps.numBar
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.TextInput;
   
   public class NumBarS1UI extends View
   {
      
      protected static var uiView:XML = <View width="153" height="22">
			  <Button buttonMode="true" labelFont="SSZH" skin="png.a5.comps.numBars.btn_max" x="113" y="0" var="btn_max" stateNum="1" width="40" height="21"/>
			  <Button buttonMode="true" labelFont="SSZH" skin="png.a5.comps.numBars.btn_minus" x="0" y="0" var="btn_minus" stateNum="1"/>
			  <Button buttonMode="true" labelFont="SSZH" skin="png.a5.comps.numBars.btn_plus" x="89" y="0" var="btn_plus" stateNum="1"/>
			  <Image skin="png.a5.comps.numBars.img_numBg" x="24" y="-1" var="img_bg"/>
			  <TextInput text="10" x="25" y="1" width="61" height="19" align="center" backgroundColor="0x0" var="txt_input" restrict="0-9" style="普通说明"/>
			</View>;
       
      
      public var btn_max:Button = null;
      
      public var btn_minus:Button = null;
      
      public var btn_plus:Button = null;
      
      public var img_bg:Image = null;
      
      public var txt_input:TextInput = null;
      
      public function NumBarS1UI()
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
