package game.ui.noticeModules
{
   import morn.core.components.View;
   import morn.core.components.Box;
   
   public class NoticeGroupViewUI extends View
   {
      
      protected static var uiView:XML = <View width="344" height="219">
			  <NoticeTypeBar y="0" var="tilteBar" runtime="game.ui.noticeModules.NoticeTypeBarUI"/>
			  <Box x="0" y="34" align="right" space="2" var="contentBox"/>
			</View>;
       
      
      public var tilteBar:game.ui.noticeModules.NoticeTypeBarUI = null;
      
      public var contentBox:Box = null;
      
      public function NoticeGroupViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.noticeModules.NoticeTypeBarUI"] = game.ui.noticeModules.NoticeTypeBarUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
