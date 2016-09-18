package game.ui.MailModules
{
   import morn.customs.components.PanelView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS10UI;
   import morn.core.components.TextInput;
   import morn.core.components.TextArea;
   
   public class WriteMailPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="390" height="546">
			  <PanelBgS3 x="0" y="0" width="390" height="546" btnCloseStyle="1" panelDragEnabled="false" showTabLine="false" style="标题普通"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="13" y="40" width="368" height="444" sizeGrid="20,20,20,20"/>
			  <Image skin="png.uiMail.写信" x="15" y="42"/>
			  <Button label="发送" x="150" y="499" style="按钮中绿" var="btnSend" mouseChildren="true" labelMargin="48" width="100" height="28"/>
			  <Label text="收件人：" autoSize="left" x="45" y="77" style="人名2" bold="true" size="14" var="lableRecv"/>
			  <Label text="标  题：" autoSize="left" x="45" y="107" style="人名2" bold="true" size="14" var="lableTitle"/>
			  <WealthRenderS10 x="155" y="502" var="renderGold" mouseEnabled="false" buttonMode="true" scale="0.85" mouseChildren="false" runtime="game.ui.commons.icons.WealthRenderS10UI"/>
			  <TextInput x="111" y="79" align="left" autoSize="left" color="0xffffff" var="txtRecvName" maxChars="12" width="205" height="21" style="普通说明"/>
			  <TextInput x="105" y="109" align="left" autoSize="left" color="0xffffff" var="txtTitle" maxChars="20" width="248" height="22" style="普通说明" text="二十个字二十个字二十个字二十个字二十个字"/>
			  <Label text="晨" autoSize="left" x="254" y="399" style="普通说明" bold="false" var="txtSenderName" width="93" height="22"/>
			  <Label text="2015-08-08" autoSize="left" x="255" y="436" style="普通说明" bold="false" var="txtSenderTm" width="79" height="18"/>
			  <Label text="字数限制  100/100" autoSize="left" x="46" y="397" style="普通说明" bold="false" var="txtWriteNum" width="107" height="22" visible="true"/>
			  <TextArea leading="15" var="txtContent" autoSize="left" x="34" y="147" multiline="true" style="普通说明" width="326" height="248" maxChars="100"/>
			</PanelView>;
       
      
      public var btnSend:Button = null;
      
      public var lableRecv:Label = null;
      
      public var lableTitle:Label = null;
      
      public var renderGold:WealthRenderS10UI = null;
      
      public var txtRecvName:TextInput = null;
      
      public var txtTitle:TextInput = null;
      
      public var txtSenderName:Label = null;
      
      public var txtSenderTm:Label = null;
      
      public var txtWriteNum:Label = null;
      
      public var txtContent:TextArea = null;
      
      public function WriteMailPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS10UI"] = WealthRenderS10UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
