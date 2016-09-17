package game.ui.worldMap
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WorldMapUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="1010" height="630">
			  <PanelBg x="0" y="0" width="1009" height="633"/>
			  <Image skin="jpg.uiWorldMap.bg" x="5" y="28" var="img_bg"/>
			  <Image skin="png.uiWorldMap.5" y="315" var="map_0" buttonMode="true" x="40"/>
			  <Image skin="png.uiWorldMap.1" mouseEnabled="false" mouseChildren="false" var="map_1" x="110" y="84"/>
			  <Image skin="png.uiWorldMap.2" x="547" mouseEnabled="false" mouseChildren="false" var="map_3" y="65"/>
			  <Image skin="png.uiWorldMap.3" x="381" var="map_2" buttonMode="true" y="231"/>
			  <Image skin="png.uiWorldMap.4" x="708" mouseEnabled="false" mouseChildren="false" var="map_4" y="329"/>
			  <Label text="妖精之乡" autoSize="none" x="34" y="465" style="渐变1" width="380" height="26" align="center" var="txt_cityName_0" size="20"/>
			  <Label text="不落王城" autoSize="none" x="127" y="239" style="渐变1" width="282" height="26" align="center" var="txt_cityName_1" size="20"/>
			  <Image skin="png.a5.commonImgs.img_lock" x="252" y="190" var="img_lock"/>
			  <Label text="通过 第五章 后开启" autoSize="none" x="149" y="268" style="普通说明" width="255" height="44" align="center" var="txt_openTxt_1" multiline="true" wordWrap="true"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var map_0:Image = null;
      
      public var map_1:Image = null;
      
      public var map_3:Image = null;
      
      public var map_2:Image = null;
      
      public var map_4:Image = null;
      
      public var txt_cityName_0:Label = null;
      
      public var txt_cityName_1:Label = null;
      
      public var img_lock:Image = null;
      
      public var txt_openTxt_1:Label = null;
      
      public function WorldMapUI()
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
