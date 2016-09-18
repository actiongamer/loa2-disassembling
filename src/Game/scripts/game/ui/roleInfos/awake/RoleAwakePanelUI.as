package game.ui.roleInfos.awake
{
   import morn.customs.components.FadeView;
   import morn.core.components.Image;
   import game.ui.roleInfos.awake.render.RoleAwakePropRenderUI;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import game.ui.commons.icons.PlayerTitleRenderUI;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.customs.components.GCircle;
   import morn.customs.components.GRect;
   import game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI;
   import game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS3UI;
   
   public class RoleAwakePanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="800" height="492">
			  <Image skin="png.uiRoleInfo.awake.img_star" x="118" y="89" var="img_star"/>
			  <Image skin="png.uiRoleInfo.awake.img_hexagram" x="118" y="86" var="img_hexagram"/>
			  <RoleAwakePropRender x="243" y="10" var="prop_render1" runtime="game.ui.roleInfos.awake.render.RoleAwakePropRenderUI"/>
			  <RoleAwakePropRender x="48" y="104" var="prop_render2" name="render" runtime="game.ui.roleInfos.awake.render.RoleAwakePropRenderUI"/>
			  <RoleAwakePropRender x="433" y="103" var="prop_render3" runtime="game.ui.roleInfos.awake.render.RoleAwakePropRenderUI"/>
			  <RoleAwakePropRender x="49" y="332" var="prop_render4" runtime="game.ui.roleInfos.awake.render.RoleAwakePropRenderUI"/>
			  <RoleAwakePropRender x="243" y="422" var="prop_render6" runtime="game.ui.roleInfos.awake.render.RoleAwakePropRenderUI"/>
			  <RoleAwakePropRender x="434" y="332" var="prop_render5" runtime="game.ui.roleInfos.awake.render.RoleAwakePropRenderUI"/>
			  <Box x="133" y="86" var="hexagram_lines" width="272" height="316">
			    <Image skin="png.uiRoleInfo.awake.hex_1" x="83" var="hex_1"/>
			    <Image skin="png.uiRoleInfo.awake.hex_2" x="171" y="77" var="hex_3"/>
			    <Image skin="png.uiRoleInfo.awake.hex_3" x="172" y="156" var="hex_5"/>
			    <Image skin="png.uiRoleInfo.awake.hex_4" x="82" y="217" var="hex_6"/>
			    <Image skin="png.uiRoleInfo.awake.hex_5" y="157" var="hex_4"/>
			    <Image skin="png.uiRoleInfo.awake.hex_6" y="75" var="hex_2"/>
			  </Box>
			  <Button label="\l30120001" x="536" y="413" style="按钮中棕" var="btn_prev"/>
			  <Button label="\l30120002" x="646" y="413" style="按钮中棕" var="btn_next"/>
			  <Image skin="png.a5.bgs.panelBgs.img_baseBg" x="511" y="44" sizeGrid="40,24,40,24" width="238" height="347"/>
			  <PlayerTitleRender x="483" y="71" var="playerTitleRenderUI" runtime="game.ui.commons.icons.PlayerTitleRenderUI"/>
			  <List x="521" y="117" repeatY="5" var="list_prop" width="205" height="115" spaceY="10" repeatX="2" spaceX="10">
			    <RolePropPhaseUpRenderS3 x="-70" y="9" name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS3UI"/>
			  </List>
			  <Box x="118" y="101" var="star_lines">
			    <Image skin="png.uiRoleInfo.awake.star_1" x="108" var="star_1"/>
			    <Image skin="png.uiRoleInfo.awake.star_2" x="174" y="101" var="star_3"/>
			    <Image skin="png.uiRoleInfo.awake.star_3" x="147" y="172" var="star_5"/>
			    <Image skin="png.uiRoleInfo.awake.star_4" x="54" y="172" var="star_4"/>
			    <Image skin="png.uiRoleInfo.awake.star_5" y="100" var="star_2"/>
			  </Box>
			  <Label text="渐变1" autoSize="none" x="5" y="8" style="渐变1" width="212" height="29" align="center" var="label_current"/>
			  <Label text="\l30120026" autoSize="none" x="5.5" y="40" style="普通绿色" width="211" align="center" var="label_link" underline="true" height="20"/>
			  <List x="521" y="272" repeatY="3" var="list_prop2" width="205" height="69" spaceY="10" repeatX="2" spaceX="10">
			    <RolePropPhaseUpRenderS3 x="-70" y="9" name="render" runtime="game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS3UI"/>
			  </List>
			  <Image skin="png.a5.prefabs.img_tipsLine" x="521" y="259" sizeGrid="4,0,4,0" width="215" var="imgAbilityCLine"/>
			  <Box x="203" y="175" var="box_buff">
			    <Image skin="png.uiRoleInfo.awake.英雄-觉醒-生命bj1"/>
			    <Image skin="png.uiRoleInfo.awake.英雄-觉醒-生命bj5" smoothing="true"/>
			    <Label text="渐变1" autoSize="none" x="5" y="42" style="渐变1" width="124" height="30" align="center" var="label_midAttr" size="19"/>
			    <GCircle fillAlpha="0.5" lineAlpha="0" x="16" y="16" width="102" height="102" var="mask_water"/>
			    <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" y="118" width="102" height="102" var="img_mask" scaleY="-0.2" x="16"/>
			  </Box>
			  <Label text="+3%" autoSize="none" x="233" y="236" style="渐变绿" width="77" height="54" align="center" size="20" var="label_buffdesc" mouseChildren="false" mouseEnabled="false"/>
			  <Box x="95" y="66" var="box_nodes">
			    <RoleAwakeNeedRender x="203" y="225" var="render_item10" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			    <RoleAwakeNeedRender y="226" var="render_item8" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			    <RoleAwakeNeedRender y="80" var="render_item2" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			    <RoleAwakeNeedRender x="296" y="80" var="render_item5" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			    <RoleAwakeNeedRender x="99" y="225" var="render_item9" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			    <RoleAwakeNeedRender x="98" y="80" var="render_item3" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			    <RoleAwakeNeedRender x="203" y="80" var="render_item4" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			    <RoleAwakeNeedRender x="57" y="153" var="render_item6" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			    <RoleAwakeNeedRender x="241" y="153" var="render_item7" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			    <RoleAwakeNeedRender x="296" y="225" var="render_item11" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			    <RoleAwakeNeedRender x="150" y="303" var="render_item12" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			    <RoleAwakeNeedRender x="150" y="0" var="render_item1" runtime="game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"/>
			  </Box>
			</FadeView>;
       
      
      public var img_star:Image = null;
      
      public var img_hexagram:Image = null;
      
      public var prop_render1:RoleAwakePropRenderUI = null;
      
      public var prop_render2:RoleAwakePropRenderUI = null;
      
      public var prop_render3:RoleAwakePropRenderUI = null;
      
      public var prop_render4:RoleAwakePropRenderUI = null;
      
      public var prop_render6:RoleAwakePropRenderUI = null;
      
      public var prop_render5:RoleAwakePropRenderUI = null;
      
      public var hexagram_lines:Box = null;
      
      public var hex_1:Image = null;
      
      public var hex_3:Image = null;
      
      public var hex_5:Image = null;
      
      public var hex_6:Image = null;
      
      public var hex_4:Image = null;
      
      public var hex_2:Image = null;
      
      public var btn_prev:Button = null;
      
      public var btn_next:Button = null;
      
      public var playerTitleRenderUI:PlayerTitleRenderUI = null;
      
      public var list_prop:List = null;
      
      public var star_lines:Box = null;
      
      public var star_1:Image = null;
      
      public var star_3:Image = null;
      
      public var star_5:Image = null;
      
      public var star_4:Image = null;
      
      public var star_2:Image = null;
      
      public var label_current:Label = null;
      
      public var label_link:Label = null;
      
      public var list_prop2:List = null;
      
      public var imgAbilityCLine:Image = null;
      
      public var box_buff:Box = null;
      
      public var label_midAttr:Label = null;
      
      public var mask_water:GCircle = null;
      
      public var img_mask:GRect = null;
      
      public var label_buffdesc:Label = null;
      
      public var box_nodes:Box = null;
      
      public var render_item10:RoleAwakeNeedRenderUI = null;
      
      public var render_item8:RoleAwakeNeedRenderUI = null;
      
      public var render_item2:RoleAwakeNeedRenderUI = null;
      
      public var render_item5:RoleAwakeNeedRenderUI = null;
      
      public var render_item9:RoleAwakeNeedRenderUI = null;
      
      public var render_item3:RoleAwakeNeedRenderUI = null;
      
      public var render_item4:RoleAwakeNeedRenderUI = null;
      
      public var render_item6:RoleAwakeNeedRenderUI = null;
      
      public var render_item7:RoleAwakeNeedRenderUI = null;
      
      public var render_item11:RoleAwakeNeedRenderUI = null;
      
      public var render_item12:RoleAwakeNeedRenderUI = null;
      
      public var render_item1:RoleAwakeNeedRenderUI = null;
      
      public function RoleAwakePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.PlayerTitleRenderUI"] = PlayerTitleRenderUI;
         viewClassMap["game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI"] = RoleAwakeNeedRenderUI;
         viewClassMap["game.ui.roleInfos.awake.render.RoleAwakePropRenderUI"] = RoleAwakePropRenderUI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePropPhaseUpRenderS3UI"] = RolePropPhaseUpRenderS3UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
