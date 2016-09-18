package game.ui.battleResults
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class BattleWinWordUI extends View
   {
      
      protected static var uiView:XML = <View width="269" height="225">
			  <Image skin="png.a5.commonImgs.img_win" x="0" y="36"/>
			  <Image skin="png.a5.commonImgs.img_win1" x="0" y="0" var="img_light" width="269"/>
			</View>;
       
      
      public var img_light:Image = null;
      
      public function BattleWinWordUI()
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
