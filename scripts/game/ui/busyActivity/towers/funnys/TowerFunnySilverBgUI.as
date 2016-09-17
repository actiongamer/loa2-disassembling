package game.ui.busyActivity.towers.funnys
{
   import morn.core.components.View;
   
   public class TowerFunnySilverBgUI extends View
   {
      
      protected static var uiView:XML = <View width="596" height="423">
			  <Image skin="png.uiTower.img_10" x="15" y="4"/>
			  <Image skin="png.uiTower.img_11" x="333" y="111"/>
			  <Image skin="png.uiTower.img_3" x="233" y="0"/>
			  <Image skin="png.uiTower.img_12" x="75" y="120"/>
			  <Image skin="png.uiTower.img_15" y="127" x="0"/>
			</View>;
       
      
      public function TowerFunnySilverBgUI()
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
