package game.ui.MailModules
{
   import morn.customs.components.PanelView;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Panel;
   
   public class ReadMailPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="390" height="546">
			  <Label text="哈哈哈" autoSize="left" x="274" y="300" size="12" width="68" height="18" var="txtName"/>
			  <Label text="2015-08-15" autoSize="left" x="275" y="324" size="12" width="68" height="18" var="txtTime"/>
			  <PanelBgS3 width="390" height="546" btnCloseStyle="1" panelDragEnabled="false" x="0" y="0"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="12" y="38" width="368" height="331" sizeGrid="20,20,20,20"/>
			  <Image skin="png.uiMail.读信" x="12" y="41"/>
			  <Image skin="png.a5.bgs.panelBgs.底框01" x="16" y="378" sizeGrid="16,16,16,16" width="362" height="106"/>
			  <Image skin="png.uiMail.非系统邮件" x="282" y="50" var="imgCaution"/>
			  <Button label="领取附件" x="147" y="498" style="按钮中绿" var="btnGet"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="119" y="382"/>
			  <Label text="附件" autoSize="left" x="123" y="383" bold="true" style="加底标题" size="15" width="153" height="22" var="txtAttachment" align="center"/>
			  <Label text="恭喜入围恭喜入围恭喜入围恭喜入围恭喜入围" autoSize="left" x="45" y="90" width="300" height="23" var="txtTitle" style="普通说明" size="14" align="center"/>
			  <List x="38" y="408" repeatX="5" spaceX="10" scale="1.1" var="listRewarded">
			    <Box name="render">
			      <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" var="img_quality" sizeGrid="6,6,6,6" width="50" height="50"/>
			    </Box>
			  </List>
			  <List x="38" y="408" var="listReward" repeatX="5" spaceX="16">
			    <MailRewardRender scale="1.1" name="render" runtime="game.ui.MailModules.MailRewardRenderUI"/>
			  </List>
			  <Button x="148" style="按钮中蓝" y="499" var="btnReturn"/>
			  <Label text="没事没事没事" x="191" y="308" style="普通说明" bold="false" var="txtSenderName" align="center" width="198" height="20"/>
			  <Label text="2015-08-08 19:00:00" autoSize="left" x="227" y="339" style="普通说明" bold="false" var="txtSenderTm" width="126" height="18"/>
			  <Panel x="31" y="144" width="326" height="157" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="panel_content">
			    <Label text="没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事没事" autoSize="left" width="309" multiline="true" wordWrap="true" leading="15" var="txtContent" x="0" y="0" style="普通说明"/>
			  </Panel>
			  <Button label="\l999000561" x="154" y="500" style="按钮小绿" var="btnDelete" width="70" height="24"/>
			  <Button skin="png.a5.btns.btn_longBar" x="354" y="409" stateNum="3" var="btn_right" visible="true" disabled="true"/>
			  <Button skin="png.a5.btns.btn_longBar" x="38" y="412" stateNum="3" scaleX="-1" var="btn_left" visible="true" disabled="true"/>
			</PanelView>;
       
      
      public var txtName:Label = null;
      
      public var txtTime:Label = null;
      
      public var imgCaution:Image = null;
      
      public var btnGet:Button = null;
      
      public var txtAttachment:Label = null;
      
      public var txtTitle:Label = null;
      
      public var listRewarded:List = null;
      
      public var img_quality:Image = null;
      
      public var listReward:List = null;
      
      public var btnReturn:Button = null;
      
      public var txtSenderName:Label = null;
      
      public var txtSenderTm:Label = null;
      
      public var panel_content:Panel = null;
      
      public var txtContent:Label = null;
      
      public var btnDelete:Button = null;
      
      public var btn_right:Button = null;
      
      public var btn_left:Button = null;
      
      public function ReadMailPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.MailModules.MailRewardRenderUI"] = MailRewardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
