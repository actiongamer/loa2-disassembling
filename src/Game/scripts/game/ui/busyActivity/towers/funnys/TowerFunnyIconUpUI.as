package game.ui.busyActivity.towers.funnys
{
   import morn.core.components.View;
   
   public class TowerFunnyIconUpUI extends View
   {
      
      protected static var uiView:XML = <View width="34" height="34">
			  <Image skin="png.uiTower.img_2" x="-4" y="-8"/>
			</View>;
       
      
      public function TowerFunnyIconUpUI()
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
