package morn.customs.components
{
   public class PanelBgS4 extends PanelBg
   {
      
      protected static var uiXML:XML = <View width="427" height="186">
			  <Image skin="png.a5.bgs.panelBgs.raw.底板四级" var="img_rimBg" sizeGrid="200,100,200,60" left="0" right="0" top="0" bottom="0"/>
			</View>;
       
      
      public function PanelBgS4()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         createView(uiXML);
      }
      
      override protected function initialize() : void
      {
         super.initialize();
      }
   }
}
