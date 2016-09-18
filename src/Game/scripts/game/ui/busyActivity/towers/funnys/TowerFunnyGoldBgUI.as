package game.ui.busyActivity.towers.funnys
{
   import morn.core.components.View;
   
   public class TowerFunnyGoldBgUI extends View
   {
      
      protected static var uiView:XML = <View width="596" height="423">
			  <Image skin="png.uiTower.img_16" x="15" y="4"/>
			  <Image skin="png.uiTower.img_17" x="333" y="111"/>
			  <Image skin="png.uiTower.img_32" x="218" y="-18"/>
			  <Image skin="png.uiTower.img_18" x="75" y="120"/>
			  <Image skin="png.uiTower.img_14" y="127" x="0"/>
			</View>;
       
      
      public function TowerFunnyGoldBgUI()
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
