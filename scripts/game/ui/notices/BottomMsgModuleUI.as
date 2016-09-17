package game.ui.notices
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.List;
   
   public class BottomMsgModuleUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="280" height="33">
			  <List x="0" y="0" var="listMsg" repeatX="6" spaceX="16">
			    <BottomMsgRender name="render" runtime="game.ui.notices.BottomMsgRenderUI"/>
			  </List>
			</StaticModuleView>;
       
      
      public var listMsg:List = null;
      
      public function BottomMsgModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.notices.BottomMsgRenderUI"] = BottomMsgRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
