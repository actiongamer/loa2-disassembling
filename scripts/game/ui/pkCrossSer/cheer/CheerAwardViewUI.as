package game.ui.pkCrossSer.cheer
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   
   public class CheerAwardViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="392" height="460">
			  <List x="0" y="0" repeatY="5" spaceY="8" var="list_award">
			    <CheerAwardRender name="render" runtime="game.ui.pkCrossSer.cheer.CheerAwardRenderUI"/>
			  </List>
			</FadeView>;
       
      
      public var list_award:List = null;
      
      public function CheerAwardViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.pkCrossSer.cheer.CheerAwardRenderUI"] = CheerAwardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
