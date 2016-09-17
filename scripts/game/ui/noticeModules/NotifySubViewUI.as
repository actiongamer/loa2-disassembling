package game.ui.noticeModules
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   
   public class NotifySubViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="344" height="420">
			  <List repeatY="4" var="list_content" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" x="0" y="0" width="366" height="398">
			    <NoticeContentRender name="render" runtime="game.ui.noticeModules.NoticeContentRenderUI"/>
			  </List>
			</FadeView>;
       
      
      public var list_content:List = null;
      
      public function NotifySubViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.noticeModules.NoticeContentRenderUI"] = NoticeContentRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
