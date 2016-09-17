package game.ui.groupon
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import game.ui.groupon.render.GrouponListRenderUI;
   
   public class GrouponViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="600" height="400">
			  <Image skin="png.uiGroupon.bg" x="-20" y="-39"/>
			  <Image skin="png.uiGroupon.bh1" x="612" y="13" width="55" height="52" sizeGrid="4,4,4,4"/>
			  <GrouponDetialView x="168" y="2" runtime="game.ui.groupon.GrouponDetialViewUI"/>
			  <List x="-7" y="5" repeatY="8" spaceY="6" var="list_activity">
			    <GrouponListRender name="render" runtime="game.ui.groupon.render.GrouponListRenderUI"/>
			  </List>
			  <PageBarS1 x="31" y="428" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			</FadeView>;
       
      
      public var list_activity:List = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public function GrouponViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.groupon.GrouponDetialViewUI"] = GrouponDetialViewUI;
         viewClassMap["game.ui.groupon.render.GrouponListRenderUI"] = GrouponListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
