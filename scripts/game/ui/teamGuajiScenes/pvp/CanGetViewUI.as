package game.ui.teamGuajiScenes.pvp
{
   import morn.core.components.View;
   
   public class CanGetViewUI extends View
   {
      
      protected static var uiView:XML = <View width="152" height="38">
			  <Label text="\l41300251" autoSize="left" style="普通说明" align="left" height="20" y="6" x="10"/>
			  <PieceRender x="66" var="itemRender" y="2" runtime="game.ui.teamGuajiScenes.pvp.PieceRenderUI"/>
			</View>;
       
      
      public var itemRender:game.ui.teamGuajiScenes.pvp.PieceRenderUI = null;
      
      public function CanGetViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.teamGuajiScenes.pvp.PieceRenderUI"] = game.ui.teamGuajiScenes.pvp.PieceRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
