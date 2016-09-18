package game.ui.noticeModules
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Image;
   import morn.core.components.Button;
   
   public class NoticeModuleViewUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="416" height="654">
			  <Image skin="png.uiNotice.公告板" x="-2" y="-2"/>
			  <Tab labels="公告,通知" x="77" y="168" style="TAB棕色水晶" skin="png.a5.btns.tab_S6" space="8" var="tabBar"/>
			  <NoticeMiniBar x="26" y="566" var="miniNoticeBar" runtime="game.ui.noticeModules.NoticeMiniBarUI"/>
			  <Image skin="png.uiNotice.箭头长底" x="22" y="622" width="371" height="14" var="img_btnBar"/>
			  <Button skin="png.uiNotice.btn_up" stateNum="1" var="btn_up" x="194" y="622"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="137" x="375" var="btn_close"/>
			</StaticModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var miniNoticeBar:game.ui.noticeModules.NoticeMiniBarUI = null;
      
      public var img_btnBar:Image = null;
      
      public var btn_up:Button = null;
      
      public var btn_close:Button = null;
      
      public function NoticeModuleViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.noticeModules.NoticeMiniBarUI"] = game.ui.noticeModules.NoticeMiniBarUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
