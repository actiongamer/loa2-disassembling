package game.ui.chapters.maps
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.customs.components.GCircle;
   
   public class MapArrowUI extends View
   {
      
      protected static var uiView:XML = <View width="79" height="87">
			  <Box x="-40" y="-91" var="boxAll">
			    <Image skin="png.uiChapter.maps.img_headerBg0"/>
			    <Image skin="png.comp.image" x="7" y="7" width="65" height="65" var="img_roleHeader"/>
			    <GCircle fillAlpha="0.5" lineAlpha="0" x="7" y="7" width="65" height="65" var="headerMask"/>
			  </Box>
			</View>;
       
      
      public var boxAll:Box = null;
      
      public var img_roleHeader:Image = null;
      
      public var headerMask:GCircle = null;
      
      public function MapArrowUI()
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
