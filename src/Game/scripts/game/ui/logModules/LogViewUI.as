package game.ui.logModules
{
   import morn.core.components.View;
   import morn.core.components.TextArea;
   import morn.core.components.TextInput;
   import morn.core.components.Button;
   import morn.core.components.CheckBox;
   import morn.core.components.Label;
   
   public class LogViewUI extends View
   {
      
      protected static var uiView:XML = <View width="1200" height="600">
			  <TextArea skin="png.comp.textarea" var="txt_log" vScrollBarSkin="png.comp.vscroll" hScrollBarSkin="png.comp.hscroll" sizeGrid="2,2,2,2" isHtml="true" background="true" backgroundColor="0x333333" size="15" left="0" right="0" top="50" bottom="0" text="Log in here" color="0xff00" font="Arial" editable="false"/>
			  <TextInput skin="png.comp.textinput" x="41" y="2" var="txt_filterKey" width="421" height="22"/>
			  <Button label="清空" stateNum="3" buttonMode="true" skin="png.comp.button" x="552" y="24" var="btn_clear" labelSize="15"/>
			  <Label text="多个关键字用空格分割" autoSize="left" x="4" y="26"/>
			  <CheckBox label="只过滤类名" skin="png.comp.checkbox" x="467" y="4" selected="true" var="cb_onlyClass"/>
			  <CheckBox label="区分大小写" skin="png.comp.checkbox" x="550" y="4" selected="false" var="cb_upLow"/>
			  <Button label="暂停" stateNum="3" buttonMode="true" skin="png.comp.button" x="469" y="25" var="btn_pause" labelSize="15"/>
			  <Label text="Log数量(显示/总数):" autoSize="left" x="191" y="26" size="14"/>
			  <Label text="99/99" autoSize="left" x="328" y="26" size="14" font="Arial" align="left" var="txt_count"/>
			  <CheckBox label="滚动锁定" skin="png.comp.checkbox" x="634" y="30" selected="false" var="cb_scrollLock"/>
			  <Label text="过滤:" autoSize="left" x="4" y="2" size="14"/>
			  <Button label="x" stateNum="3" buttonMode="true" skin="png.comp.button" x="440" y="2" var="btn_clearSearch" labelSize="20" width="22" height="22" labelMargin="2,0,0,2" labelFont="Arial"/>
			</View>;
       
      
      public var txt_log:TextArea = null;
      
      public var txt_filterKey:TextInput = null;
      
      public var btn_clear:Button = null;
      
      public var cb_onlyClass:CheckBox = null;
      
      public var cb_upLow:CheckBox = null;
      
      public var btn_pause:Button = null;
      
      public var txt_count:Label = null;
      
      public var cb_scrollLock:CheckBox = null;
      
      public var btn_clearSearch:Button = null;
      
      public function LogViewUI()
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
