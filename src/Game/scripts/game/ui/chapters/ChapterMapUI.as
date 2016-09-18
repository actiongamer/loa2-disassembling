package game.ui.chapters
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.customs.components.GRect;
   import game.ui.chapters.maps.MapArrowUI;
   
   public class ChapterMapUI extends View
   {
      
      protected static var uiView:XML = <View width="1500" height="900">
			  <Box var="box_map" width="1500" height="900">
			    <Image skin="png.uiChapter.maps.img_big" var="mapBg" scale="1" x="-36" y="-17"/>
			    <Image skin="png.uiChapter.maps.大地图-地下王国" x="230" y="392" width="152" height="106" var="img_map4"/>
			    <Image skin="png.uiChapter.maps.大地图-妖精之乡" x="292" y="454" width="208" height="150" var="img_map2"/>
			    <Image skin="png.uiChapter.maps.大地图-幽暗密林" x="972" y="287" width="283" height="149" var="img_map15"/>
			    <Image skin="png.uiChapter.maps.大地图-异界之门" x="902" y="370" width="135" height="105" var="img_map16"/>
			    <Image skin="png.uiChapter.maps.大地图-星界回廊" x="767" y="398" width="134" height="82" var="img_map17"/>
			    <Image skin="png.uiChapter.maps.大地图-暴风要塞" x="379" y="151" width="208" height="130" var="img_map9"/>
			    <Image skin="png.uiChapter.maps.大地图-月亮神庙" x="244" y="579" width="194" height="166" var="img_map1"/>
			    <Image skin="png.uiChapter.maps.大地图-深水禁地" x="495" y="534" width="88" height="76" var="img_map6"/>
			    <Image skin="png.uiChapter.maps.大地图-不落王城" x="483" y="200" width="204" height="132" var="img_map10"/>
			    <Image skin="png.uiChapter.maps.大地图-神之国度" x="775" y="280" width="218" height="120" var="img_map12"/>
			    <Image skin="png.uiChapter.maps.大地图-精灵城市" x="429" y="614" width="120" height="85" var="img_map3"/>
			    <Image skin="png.uiChapter.maps.大地图-东部荒野" x="590" y="165" width="232" height="100" var="img_map11"/>
			    <Image skin="png.uiChapter.maps.大地图-罪恶深渊" x="1002" y="436" width="258" height="186" var="img_map18"/>
			    <Image skin="png.uiChapter.maps.大地图-至高圣殿" x="840" y="447" width="88" height="60" var="img_map19"/>
			    <Image skin="png.uiChapter.maps.大地图-诅咒海岸" x="469" y="330" width="169" height="184" var="img_map7"/>
			    <Image skin="png.uiChapter.maps.大地图-迷雾之林" x="547" y="524" width="268" height="244" var="img_map5"/>
			    <Image skin="png.uiChapter.maps.大地图-遗落之殿" x="255" y="249" width="239" height="180" var="img_map8"/>
			    <Image skin="png.uiChapter.maps.大地图-黑暗堡垒" x="857" y="152" width="262" height="179" var="img_map13"/>
			    <Image skin="png.uiChapter.maps.大地图-黑暗沼泽" x="1052" y="170" width="244" height="188" var="img_map14"/>
			  </Box>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" fillColor="0xFF00FF" right="450" top="100" bottom="50" left="10" x="58" y="0" var="visibleRect"/>
			  <MapArrow x="287" y="248" var="mapArrow" runtime="game.ui.chapters.maps.MapArrowUI"/>
			</View>;
       
      
      public var box_map:Box = null;
      
      public var mapBg:Image = null;
      
      public var img_map4:Image = null;
      
      public var img_map2:Image = null;
      
      public var img_map15:Image = null;
      
      public var img_map16:Image = null;
      
      public var img_map17:Image = null;
      
      public var img_map9:Image = null;
      
      public var img_map1:Image = null;
      
      public var img_map6:Image = null;
      
      public var img_map10:Image = null;
      
      public var img_map12:Image = null;
      
      public var img_map3:Image = null;
      
      public var img_map11:Image = null;
      
      public var img_map18:Image = null;
      
      public var img_map19:Image = null;
      
      public var img_map7:Image = null;
      
      public var img_map5:Image = null;
      
      public var img_map8:Image = null;
      
      public var img_map13:Image = null;
      
      public var img_map14:Image = null;
      
      public var visibleRect:GRect = null;
      
      public var mapArrow:MapArrowUI = null;
      
      public function ChapterMapUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chapters.maps.MapArrowUI"] = MapArrowUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
