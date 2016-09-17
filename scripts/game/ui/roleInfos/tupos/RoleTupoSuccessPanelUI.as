package game.ui.roleInfos.tupos
{
   import morn.customs.components.PanelView;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.SkillRenderS9UI;
   import game.ui.commons.props.RolePropBaseRenderS2UI;
   
   public class RoleTupoSuccessPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="291" height="149">
			  <Box x="0" y="-249" var="box_main">
			    <Image skin="png.a5.bgs.panelBgs.img_baseBgS2" x="56" sizeGrid="40,99,40,99" y="42"/>
			    <Label text="（伤害减免提高15%）" bold="false" stroke="0x0" var="txt_desc2" y="246" x="60" align="center" width="170" style="普通绿色"/>
			    <List var="list_propNext" repeatX="1" repeatY="5" y="102" x="100">
			      <RolePropBaseRenderS2 name="render" runtime="game.ui.commons.props.RolePropBaseRenderS2UI"/>
			    </List>
			    <List x="181" y="101" repeatY="5" var="list_up" spaceY="-2">
			      <RoleUpRender name="render" runtime="game.ui.roleInfos.tupos.RoleUpRenderUI"/>
			    </List>
			    <SkillRenderS9 y="321" var="render_unlockSkill" x="117" runtime="game.ui.commons.icons.SkillRenderS9UI"/>
			    <Label text="无新技能解锁" bold="false" stroke="0x0" var="txt_desc3" letterSpacing="1" width="291" style="不足禁止红" align="center" y="326"/>
			    <Box x="9" y="65" var="box_title1">
			      <Image skin="png.a5.commonImgs.img_yellow" x="60"/>
			      <Label text="\l30100014" bold="false" stroke="0x0" var="txt_npcName" letterSpacing="1" width="273" style="加底标题" align="center" y="5"/>
			    </Box>
			    <Box x="9" y="210" var="box_title2">
			      <Image skin="png.a5.commonImgs.img_yellow" x="60"/>
			      <Label text="\l30100014" bold="false" stroke="0x0" letterSpacing="1" width="273" style="加底标题" align="center" y="6"/>
			    </Box>
			    <Box y="283" var="box_title3">
			      <Image skin="png.a5.commonImgs.img_yellow" x="69"/>
			      <Label text="解锁技能" bold="false" stroke="0x0" letterSpacing="1" width="291" style="加底标题" align="center" y="6"/>
			    </Box>
			  </Box>
			</PanelView>;
       
      
      public var box_main:Box = null;
      
      public var txt_desc2:Label = null;
      
      public var list_propNext:List = null;
      
      public var list_up:List = null;
      
      public var render_unlockSkill:SkillRenderS9UI = null;
      
      public var txt_desc3:Label = null;
      
      public var box_title1:Box = null;
      
      public var txt_npcName:Label = null;
      
      public var box_title2:Box = null;
      
      public var box_title3:Box = null;
      
      public function RoleTupoSuccessPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.SkillRenderS9UI"] = SkillRenderS9UI;
         viewClassMap["game.ui.commons.props.RolePropBaseRenderS2UI"] = RolePropBaseRenderS2UI;
         viewClassMap["game.ui.roleInfos.tupos.RoleUpRenderUI"] = RoleUpRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
