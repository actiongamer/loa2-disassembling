package game.ui.renzhengs.weiXinAndPhones
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.TextInput;
   
   public class RenZhengPhonePanelUI extends View
   {
      
      protected static var uiView:XML = <View width="500" height="200">
			  <Button label="按钮" x="172" style="按钮大绿" y="98" var="btn_get"/>
			  <Label text="普通说明" autoSize="none" x="16" y="153" style="普通说明" width="429" height="22" align="center" var="txt_tip1"/>
			  <Label text="加底标题" autoSize="none" x="65" y="18" style="加底标题" width="69" height="20" align="right" var="txt_phoneLab" bold="false" size="13"/>
			  <Label text="加底标题" autoSize="none" x="65" y="56" style="加底标题" width="69" height="20" align="right" var="txt_checkCodeLab" bold="false" size="13"/>
			  <Image skin="png.uiRenZhengWeiXinAndPhones.img_input_bg" x="139" y="13"/>
			  <Image skin="png.uiRenZhengWeiXinAndPhones.img_input_bg" x="139" y="50"/>
			  <Button label="按钮" x="330" style="按钮中黄" y="13" var="btn_getCheckCode"/>
			  <Label text="加底标题" autoSize="none" x="144" y="19" style="普通灰色" width="166" height="20" align="left" var="txt_phonePrompt" bold="false"/>
			  <Label text="加底标题" autoSize="none" x="144" y="56" style="普通灰色" width="166" height="20" align="left" var="txt_checkCodePrompt" bold="false"/>
			  <TextInput text="TextInput" x="142" y="18" var="txt_phoneInput" style="普通说明" width="169" height="22"/>
			  <TextInput text="TextInput" x="142" y="55" var="txt_checkCodeInput" style="普通说明" width="169" height="22"/>
			</View>;
       
      
      public var btn_get:Button = null;
      
      public var txt_tip1:Label = null;
      
      public var txt_phoneLab:Label = null;
      
      public var txt_checkCodeLab:Label = null;
      
      public var btn_getCheckCode:Button = null;
      
      public var txt_phonePrompt:Label = null;
      
      public var txt_checkCodePrompt:Label = null;
      
      public var txt_phoneInput:TextInput = null;
      
      public var txt_checkCodeInput:TextInput = null;
      
      public function RenZhengPhonePanelUI()
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
