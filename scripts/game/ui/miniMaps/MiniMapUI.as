package game.ui.miniMaps
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Label;
   import game.ui.mainToolBar.BottomIconBarTopRightUI;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.customs.components.GRect;
   
   public class MiniMapUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="205" height="205" var="whole">
			  <Image skin="png.uiMiniMap.地图框" x="0" y="0" width="205" height="205"/>
			  <Label text="当前路线: 3线" autoSize="none" x="0" var="txt_cityname" style="内容数字" y="0" width="200" height="20" align="center"/>
			  <BottomIconBarTopRight x="-79" y="4" var="iconBar" runtime="game.ui.mainToolBar.BottomIconBarTopRightUI"/>
			  <Box x="-66" y="336" var="hint_box" buttonMode="false">
			    <Image skin="png.uiMiniMap.提示背景" height="182" width="277" var="img_hint" sizeGrid="20,48,20,4" x="0" y="0"/>
			    <List x="28" y="38" repeatY="5" var="hint_list" repeatX="1" spaceX="27">
			      <MiniMapHintRender name="render" runtime="game.ui.miniMaps.MiniMapHintRenderUI"/>
			    </List>
			    <Box x="221" y="34" var="scaleBtn">
			      <Button skin="png.a5.commonImgs.btn_small" stateNum="1" var="btn_mini"/>
			      <Image skin="png.a5.commonImgs.img_suofang" x="12" y="12" anchorX=".5" anchorY=".5" var="img_suofang" mouseEnabled="false"/>
			    </Box>
			  </Box>
			  <Label text="21:39" autoSize="left" x="156" y="2" var="txt_systemTime" style="普通说明"/>
			  <GRect fillAlpha="0.5" lineAlpha="0" x="3" y="20" fillColor="0x00FF00" var="g_mask" width="200" height="182" radius="8"/>
			  <Box x="3" y="20" var="box_map">
			    <Image skin="png.a5.comps.img_block" width="200" height="182" var="img_map"/>
			    <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="0" y="0" width="76" height="72" var="layer_pois"/>
			    <Image skin="png.uiMiniMap.路标" x="175" y="18" var="img_role" anchorY="0.5" anchorX="0.4"/>
			  </Box>
			  <MiniMapBtn x="-25" y="92" var="btn_setting" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			  <MiniMapBtn x="-25" y="120" var="btn_sound" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			  <MiniMapBtn x="-25" y="148" var="btn_see" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			  <MiniMapBtn x="-25" y="64" var="btn_language" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			  <Button skin="png.uiMiniMap.btn_gonglue" x="-24" y="57" stateNum="1" var="btn_gonglue"/>
			  <MiniMapBtn x="-25" y="176" var="btn_newVersion" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			  <MiniMapBtn x="3" y="205" var="btn_mail" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			  <MiniMapBtn x="31" y="205" var="btn_friends" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			  <MiniMapBtn x="59" y="205" var="btn_rank" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			  <MiniMapBtn x="87" y="205" var="btn_gift" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			  <Image skin="png.uiMiniMap.地图-图标" x="-51" y="-1" buttonMode="true" var="img_worldmap"/>
			  <MiniMapBtn x="115" y="205" var="btn_battlefield" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			  <Box x="-231" y="74" var="box_tips">
			    <Image skin="png.uiMiniMap.气泡" sizeGrid="10,10,40,40" width="232" height="91" scaleY="-1" y="49"/>
			    <Label text="\l41310950" autoSize="none" x="10" style="普通说明" width="215" height="56" multiline="true" wordWrap="true" y="-4" centerX="0"/>
			  </Box>
			  <MiniMapBtn x="171" y="205" var="btn_gm" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			  <MiniMapBtn x="143" y="205" var="btn_auction" runtime="game.ui.miniMaps.MiniMapBtnUI"/>
			</StaticModuleView>;
       
      
      public var whole:StaticModuleView = null;
      
      public var txt_cityname:Label = null;
      
      public var iconBar:BottomIconBarTopRightUI = null;
      
      public var hint_box:Box = null;
      
      public var img_hint:Image = null;
      
      public var hint_list:List = null;
      
      public var scaleBtn:Box = null;
      
      public var btn_mini:Button = null;
      
      public var img_suofang:Image = null;
      
      public var txt_systemTime:Label = null;
      
      public var g_mask:GRect = null;
      
      public var box_map:Box = null;
      
      public var img_map:Image = null;
      
      public var layer_pois:GRect = null;
      
      public var img_role:Image = null;
      
      public var btn_setting:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public var btn_sound:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public var btn_see:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public var btn_language:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public var btn_gonglue:Button = null;
      
      public var btn_newVersion:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public var btn_mail:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public var btn_friends:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public var btn_rank:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public var btn_gift:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public var img_worldmap:Image = null;
      
      public var btn_battlefield:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public var box_tips:Box = null;
      
      public var btn_gm:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public var btn_auction:game.ui.miniMaps.MiniMapBtnUI = null;
      
      public function MiniMapUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.mainToolBar.BottomIconBarTopRightUI"] = BottomIconBarTopRightUI;
         viewClassMap["game.ui.miniMaps.MiniMapBtnUI"] = game.ui.miniMaps.MiniMapBtnUI;
         viewClassMap["game.ui.miniMaps.MiniMapHintRenderUI"] = MiniMapHintRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
