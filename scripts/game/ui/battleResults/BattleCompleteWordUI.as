package game.ui.battleResults
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class BattleCompleteWordUI extends View
   {
      
      protected static var uiView:XML = <View width="269" height="225">
			  <Image skin="png.a5.commonImgs.img_win1" var="img_light"/>
			  <Image skin="png.a5.commonImgs.img_fightEnd" centerY="0" centerX="0" x="-41.5" y="59.5"/>
			</View>;
       
      
      public var img_light:Image = null;
      
      public function BattleCompleteWordUI()
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
