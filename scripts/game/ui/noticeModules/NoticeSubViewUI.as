package game.ui.noticeModules
{
   import morn.customs.components.FadeView;
   import morn.core.components.Panel;
   
   public class NoticeSubViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="356" height="407">
			  <Panel y="0" width="366" height="398" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="panel_content" x="0"/>
			</FadeView>;
       
      
      public var panel_content:Panel = null;
      
      public function NoticeSubViewUI()
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
