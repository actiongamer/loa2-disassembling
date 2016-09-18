package game.ui.renzhengs.weiXinAndPhones
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.TextInput;
   
   public class RenZhengXunLeiPhonePanelUI extends View
   {
      
      protected static var uiView:XML = <View width="500" height="200">
			  <Button label="按钮" x="280" style="按钮大绿" y="150" var="btn_get"/>
			  <Label text="普通说明" autoSize="none" x="106" y="8" style="小标题" width="228" height="22" align="left" var="txt_tip0" size="14"/>
			  <Button label="按钮" x="130" style="按钮大绿" y="150" var="btn_phone"/>
			  <Label text="普通\n说\n明" autoSize="none" x="145" y="37" style="普通说明" width="309" height="63" align="left" var="txt_tip1" size="14"/>
			  <Label text="加底标题" autoSize="none" x="134" y="108" style="加底标题" width="69" height="20" align="right" var="txt_checkCodeLab" bold="false" size="13"/>
			  <Image skin="png.uiRenZhengWeiXinAndPhones.img_input_bg" x="208" y="102"/>
			  <Label text="加底标题" autoSize="none" x="213" y="108" style="普通灰色" width="166" height="20" align="left" var="txt_checkCodePrompt" bold="false"/>
			  <TextInput text="TextInput" x="211" y="107" var="txt_checkCodeInput" style="普通说明" width="169" height="22"/>
			</View>;
       
      
      public var btn_get:Button = null;
      
      public var txt_tip0:Label = null;
      
      public var btn_phone:Button = null;
      
      public var txt_tip1:Label = null;
      
      public var txt_checkCodeLab:Label = null;
      
      public var txt_checkCodePrompt:Label = null;
      
      public var txt_checkCodeInput:TextInput = null;
      
      public function RenZhengXunLeiPhonePanelUI()
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
