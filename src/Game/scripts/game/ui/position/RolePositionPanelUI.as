package game.ui.position
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.customs.components.ClipList;
   import game.ui.commons.icons.SkillRenderS9UI;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.icons.PetRenderUI;
   
   public class RolePositionPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="554">
			  <PanelBg width="803" height="554" panelDragEnabled="true"/>
			  <Image skin="jpg.uiPosition.img_bg" x="4" y="26" var="img_bg"/>
			  <Image skin="png.uiPosition.img_posOver" x="-100" y="100" var="img_pos_over"/>
			  <Image skin="png.uiPosition.img_cirGreen" x="-192" y="209" var="img_posPet"/>
			  <Image skin="png.uiPosition.光圈02" x="-183" y="6" var="img_posOri"/>
			  <Box x="58" y="54" width="687" height="473" var="posView">
			    <Image skin="png.uiPosition.光圈02" x="496" y="178" var="pos0" scale="1"/>
			    <Image skin="png.uiPosition.光圈02" x="396" y="276" var="pos1" scale="1.1"/>
			    <Image skin="png.uiPosition.光圈02" x="286" y="374" var="pos2" scale="1.2"/>
			    <Image skin="png.uiPosition.光圈02" x="233" var="pos3" y="178" scale="1"/>
			    <Image skin="png.uiPosition.光圈02" x="133" y="276" var="pos4" scale="1.1"/>
			    <Image skin="png.uiPosition.光圈02" y="374" var="pos5" x="23" scale="1.2"/>
			  </Box>
			  <List x="99" y="268" var="list_buffs" mouseEnabled="false" mouseChildren="false">
			    <RolePetPropRender x="212" name="item3" runtime="game.ui.position.RolePetPropRenderUI"/>
			    <RolePetPropRender x="477" name="item0" runtime="game.ui.position.RolePetPropRenderUI"/>
			    <RolePetPropRender x="110" y="105" name="item4" runtime="game.ui.position.RolePetPropRenderUI"/>
			    <RolePetPropRender x="375" name="item1" y="105" runtime="game.ui.position.RolePetPropRenderUI"/>
			    <RolePetPropRender y="213" name="item5" runtime="game.ui.position.RolePetPropRenderUI"/>
			    <RolePetPropRender x="265" name="item2" y="213" runtime="game.ui.position.RolePetPropRenderUI"/>
			  </List>
			  <Image skin="png.uiPosition.灰色" x="-139" y="320" var="img_pos_lock"/>
			  <Box x="237" y="23">
			    <Image skin="png.uiPosition.战力透明底" x="38" y="0"/>
			    <ClipList value="739" align="left" url="png.a5.comps.clipList.clipList_S9" clipWidth="19" var="clip_fightValue" language="en" lgx="144,142,144,144,144,144,144,144" lgy="6,6,6,6,6,6,6,6"/>
			    <Label text="\l11000810" stroke="0xffffff" mouseEnabled="false" backgroundColor="0xcfbeaf" autoSize="none" align="right" width="126" height="24" style="渐变1" y="7" x="12" size="22"/>
			  </Box>
			  <SkillRenderS9 x="715.5" y="420" var="render_skill" runtime="game.ui.commons.icons.SkillRenderS9UI"/>
			  <Label text="当前坐骑技能" stroke="0xffffff" mouseEnabled="false" var="txt_state" backgroundColor="0xcfbeaf" autoSize="none" align="center" x="684" width="120" height="16" style="重要提示绿" y="398"/>
			  <Button label="\l40100002" x="703" style="按钮中绿" y="501" var="btn_skill" mouseChildren="true" buttonMode="true"/>
			  <Box x="606" y="398" var="box_pet">
			    <Label text="\l32000335" stroke="0xffffff" mouseEnabled="false" backgroundColor="0xcfbeaf" autoSize="none" align="center" width="84" height="16" style="重要提示绿"/>
			    <Button label="\l32000336" x="1" style="按钮中绿" y="103" var="btn_pet" mouseChildren="true" buttonMode="true"/>
			    <PetRender x="12" y="22" var="render_pet" runtime="game.ui.commons.icons.PetRenderUI"/>
			  </Box>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_pos_over:Image = null;
      
      public var img_posPet:Image = null;
      
      public var img_posOri:Image = null;
      
      public var posView:Box = null;
      
      public var pos0:Image = null;
      
      public var pos1:Image = null;
      
      public var pos2:Image = null;
      
      public var pos3:Image = null;
      
      public var pos4:Image = null;
      
      public var pos5:Image = null;
      
      public var list_buffs:List = null;
      
      public var img_pos_lock:Image = null;
      
      public var clip_fightValue:ClipList = null;
      
      public var render_skill:SkillRenderS9UI = null;
      
      public var txt_state:Label = null;
      
      public var btn_skill:Button = null;
      
      public var box_pet:Box = null;
      
      public var btn_pet:Button = null;
      
      public var render_pet:PetRenderUI = null;
      
      public function RolePositionPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.PetRenderUI"] = PetRenderUI;
         viewClassMap["game.ui.commons.icons.SkillRenderS9UI"] = SkillRenderS9UI;
         viewClassMap["game.ui.position.RolePetPropRenderUI"] = RolePetPropRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
