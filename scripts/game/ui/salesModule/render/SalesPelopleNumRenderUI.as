package game.ui.salesModule.render
{
   import morn.core.components.View;
   import morn.customs.components.ClipList;
   
   public class SalesPelopleNumRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="38" height="52">
			  <Image skin="png.uiSales.数字底"/>
			  <ClipList value="1" clipWidth="24" align="left" url="png.a5.comps.clipList.clipList_S19" x="4" y="10" gapX="14" centerX="0" centerY="0" var="clip_value"/>
			</View>;
       
      
      public var clip_value:ClipList = null;
      
      public function SalesPelopleNumRenderUI()
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
