package game.ui.busyActivity.towers.funnys
{
   import morn.core.components.View;
   
   public class TowerFunnyIconDownUI extends View
   {
      
      protected static var uiView:XML = <View width="34" height="34">
			  <Image skin="png.uiTower.img_4" x="-4" y="-6"/>
			</View>;
       
      
      public function TowerFunnyIconDownUI()
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
