package game.ui.teamGuajiScenes.pvp
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class PlayerStatusUI extends View
   {
      
      protected static var uiView:XML = <View width="151" height="23">
			  <Image skin="png.uiTeamGuajiPvP.透明底1" x="-1" y="0"/>
			  <Label text="普通说明" autoSize="none" x="-1" y="2" style="普通说明" width="175" height="20" align="center" centerX="0" var="txt_status"/>
			</View>;
       
      
      public var txt_status:Label = null;
      
      public function PlayerStatusUI()
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
