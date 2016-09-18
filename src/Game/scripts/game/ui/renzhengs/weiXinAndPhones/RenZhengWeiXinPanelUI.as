package game.ui.renzhengs.weiXinAndPhones
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.TextInput;
   import morn.core.components.Image;
   import morn.core.components.Button;
   
   public class RenZhengWeiXinPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="200">
			  <Label text="加底标题" autoSize="none" x="180" y="5" style="重要提示黄" width="111" height="20" align="left" var="txt_tip1" bold="false" size="13"/>
			  <Label text="加底标题" autoSize="none" x="180" y="27" style="普通说明" width="500" height="67" align="left" var="txt_tip2" bold="false" size="13" multiline="true" wordWrap="true"/>
			  <Image skin="png.uiRenZhengWeiXinAndPhones.img_input_bg" x="239" y="98"/>
			  <Label text="加底标题" autoSize="none" x="244" y="104" style="普通灰色" width="166" height="20" align="center" var="txt_inputPrompt" bold="false"/>
			  <TextInput text="TextInput" x="242" y="103" var="txt_checkCodeInput" style="普通说明" width="169" height="22" align="center"/>
			  <Image skin="png.a5.comps.img_block" x="8" y="4" var="img_code"/>
			  <Button label="按钮" x="269" style="按钮大绿" y="135" var="btn_get"/>
			</View>;
       
      
      public var txt_tip1:Label = null;
      
      public var txt_tip2:Label = null;
      
      public var txt_inputPrompt:Label = null;
      
      public var txt_checkCodeInput:TextInput = null;
      
      public var img_code:Image = null;
      
      public var btn_get:Button = null;
      
      public function RenZhengWeiXinPanelUI()
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
