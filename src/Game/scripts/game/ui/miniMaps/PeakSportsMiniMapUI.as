package game.ui.miniMaps
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.customs.components.GRect;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class PeakSportsMiniMapUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="216" height="215" buttonMode="true">
			  <Box x="8" y="30" var="box_map">
			    <Image skin="png.a5.comps.img_block" width="200" height="182" var="img_map"/>
			    <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="0" y="0" width="76" height="72" var="layer_pois"/>
			    <Image skin="png.uiMiniMap.路标" x="175" y="18" var="img_role" anchorY="0.5" anchorX="0.1"/>
			    <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="0" y="0" width="76" height="72" var="layer_avatars" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			  <Image skin="png.a5.comps.img_block" width="420" height="420" var="wuImage" x="8" y="30" mouseChildren="true" mouseEnabled="true"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="8" y="30" width="200" height="184" var="wuMaskImage"/>
			  <Image skin="png.uiMiniMap.首页-底图边框" x="0" y="0" mouseChildren="false" mouseEnabled="false"/>
			  <Label text="当前路线: 3线" autoSize="none" x="8" var="txt_cityname" style="普通说明" y="15" width="200" height="20" align="center" centerX="0"/>
			  <Label text="21:39" autoSize="left" x="166" y="16" var="txt_systemTime" style="普通说明"/>
			  <Box x="0" y="213" toolTip="\l999600043">
			    <Image skin="png.uiMiniMap.底吧" centerX="0" width="216" height="30" x="0"/>
			    <HBox x="10" y="0">
			      <Label text="\l999600042" autoSize="none" style="小标题" height="22" align="right" size="15" y="5" x="0"/>
			      <Button skin="png.uiMiniMap.btn_speed" x="141" var="commandBtn" stateNum="3" toggle="true" y="0"/>
			    </HBox>
			  </Box>
			</StaticModuleView>;
       
      
      public var box_map:Box = null;
      
      public var img_map:Image = null;
      
      public var layer_pois:GRect = null;
      
      public var img_role:Image = null;
      
      public var layer_avatars:GRect = null;
      
      public var wuImage:Image = null;
      
      public var wuMaskImage:GRect = null;
      
      public var txt_cityname:Label = null;
      
      public var txt_systemTime:Label = null;
      
      public var commandBtn:Button = null;
      
      public function PeakSportsMiniMapUI()
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
