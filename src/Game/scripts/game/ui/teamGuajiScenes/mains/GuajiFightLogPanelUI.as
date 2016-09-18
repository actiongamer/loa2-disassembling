package game.ui.teamGuajiScenes.mains
{
   import morn.core.components.View;
   import morn.core.components.List;
   
   public class GuajiFightLogPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="406" height="70">
			  <Image skin="png.uiTeamGuajis.战报底" x="0" y="1"/>
			  <List x="20" y="1" repeatY="3" spaceY="0" var="list_log">
			    <GuajiFightLogRender name="render" runtime="game.ui.teamGuajiScenes.mains.GuajiFightLogRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_log:List = null;
      
      public function GuajiFightLogPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.teamGuajiScenes.mains.GuajiFightLogRenderUI"] = GuajiFightLogRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
