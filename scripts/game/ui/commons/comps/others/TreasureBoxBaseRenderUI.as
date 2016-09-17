package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class TreasureBoxBaseRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="40" height="40">
			  <Button skin="png.a5.commonImgs.btn_reward0" stateNum="1" var="btn_reward" centerX="0" bottom="0"/>
			</View>;
       
      
      public var btn_reward:Button = null;
      
      public function TreasureBoxBaseRenderUI()
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
