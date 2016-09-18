package game.ui.MailModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RedPointNumUI;
   import morn.core.components.Button;
   
   public class FMailMainModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="390" height="546">
			  <PanelBg width="388" height="548" x="1" y="0" showTabLine="true"/>
			  <Box x="18" y="31" var="boxMain">
			    <Tab labels="\l999000557,\l999000558" y="10" style="TAB短" var="tabGroup" space="5" selectedIndex="0"/>
			    <List y="53" repeatY="6" repeatX="0" spaceY="0" var="listMails" mouseEnabled="true" mouseChildren="true">
			      <MailListRender name="render" runtime="game.ui.MailModules.MailListRenderUI"/>
			    </List>
			    <PageBarS2 x="94" y="469" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			    <Label text="写邮件" autoSize="left" x="286" y="7" style="下划线黄色" underline="true" var="txtWriteMail" buttonMode="true" mouseChildren="false"/>
			    <Image skin="png.uiMail.写邮件 小icon" x="259" y="4" width="28" height="21"/>
			    <RedPointNum x="53" var="imgRedPointUnread" y="0" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			    <Button label="一键领取" x="265" y="469" style="按钮小绿" var="btnAllGet" width="70" height="24"/>
			    <RedPointNum x="322" y="462" var="imgRedPointReward" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			    <Button label="\l999000560" x="265" y="469" style="按钮小绿" var="btnAllDelete" width="70" height="24"/>
			    <Button label="\l999000559" x="3" y="468" style="按钮小绿" var="btnDeleteReaded" width="70" height="24" lgx="3"/>
			  </Box>
			  <List x="206" y="94" repeatX="5" var="listAllGet" spaceX="10" visible="false" alpha="0 ">
			    <MailRewardRender name="render" runtime="game.ui.MailModules.MailRewardRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var boxMain:Box = null;
      
      public var tabGroup:Tab = null;
      
      public var listMails:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var txtWriteMail:Label = null;
      
      public var imgRedPointUnread:RedPointNumUI = null;
      
      public var btnAllGet:Button = null;
      
      public var imgRedPointReward:RedPointNumUI = null;
      
      public var btnAllDelete:Button = null;
      
      public var btnDeleteReaded:Button = null;
      
      public var listAllGet:List = null;
      
      public function FMailMainModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.MailModules.MailListRenderUI"] = MailListRenderUI;
         viewClassMap["game.ui.MailModules.MailRewardRenderUI"] = MailRewardRenderUI;
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
