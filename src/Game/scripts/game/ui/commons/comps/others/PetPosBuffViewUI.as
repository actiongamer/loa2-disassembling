package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.List;
   
   public class PetPosBuffViewUI extends View
   {
      
      protected static var uiView:XML = <View width="130" height="100">
			  <List x="0" y="0" var="list_petBuff" repeatY="5">
			    <PetPosBuffListRender name="render" runtime="game.ui.commons.comps.others.PetPosBuffListRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_petBuff:List = null;
      
      public function PetPosBuffViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.PetPosBuffListRenderUI"] = PetPosBuffListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
