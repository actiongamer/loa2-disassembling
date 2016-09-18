package game.ui.miniMaps
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.customs.components.GRect;
   
   public class BattlefieldMiniMapUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="205" height="205" buttonMode="true">
			  <Image skin="png.uiMiniMap.地图框" x="-1" y="-1" width="205" height="205"/>
			  <Label text="当前路线: 3线" autoSize="none" x="-1" var="txt_cityname" style="普通说明" y="0" width="200" height="20" align="center"/>
			  <Label text="21:39" autoSize="left" x="155" y="0" var="txt_systemTime" style="普通说明"/>
			  <Box x="2" y="19" var="box_map">
			    <Image skin="png.a5.comps.img_block" width="200" height="182" var="img_map"/>
			    <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="0" y="0" width="76" height="72" var="layer_pois"/>
			    <Image skin="png.uiMiniMap.路标" x="175" y="18" var="img_role" anchorY="0.5" anchorX="0.1"/>
			    <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="0" y="0" width="76" height="72" var="layer_avatars" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			</StaticModuleView>;
       
      
      public var txt_cityname:Label = null;
      
      public var txt_systemTime:Label = null;
      
      public var box_map:Box = null;
      
      public var img_map:Image = null;
      
      public var layer_pois:GRect = null;
      
      public var img_role:Image = null;
      
      public var layer_avatars:GRect = null;
      
      public function BattlefieldMiniMapUI()
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
