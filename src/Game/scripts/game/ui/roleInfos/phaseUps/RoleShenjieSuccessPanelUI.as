package game.ui.roleInfos.phaseUps
{
   import morn.customs.components.PanelView;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class RoleShenjieSuccessPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="291" height="149">
			  <Box x="9" y="-249" var="box_main">
			    <Image skin="png.a5.bgs.panelBgs.img_baseBgS2" x="41" sizeGrid="25,25,25,25" width="190" height="405" var="img_bg" y="46"/>
			    <List x="63" y="247" var="list_skill" repeatY="3" spaceY="8">
			      <RolePhaseUpSkillRender name="render" runtime="game.ui.roleInfos.phaseUps.RolePhaseUpSkillRenderUI"/>
			    </List>
			    <List x="59" y="98" repeatY="5" spaceY="-3" var="list_propNext">
			      <RolePhaseUpTwoPropRender name="render" runtime="game.ui.roleInfos.phaseUps.RolePhaseUpTwoPropRenderUI"/>
			    </List>
			    <Box x="0" y="63" var="box_title1">
			      <Image skin="png.a5.commonImgs.img_yellow" x="60"/>
			      <Label text="\l30100014" bold="false" stroke="0x0" var="txt_npcName" letterSpacing="1" width="273" style="加底标题" align="center" y="6"/>
			    </Box>
			    <Box x="0" y="211" var="box_title2">
			      <Image skin="png.a5.commonImgs.img_yellow" x="60"/>
			      <Label text="技能升级" bold="false" stroke="0x0" letterSpacing="1" width="273" style="加底标题" align="center" y="5"/>
			    </Box>
			  </Box>
			</PanelView>;
       
      
      public var box_main:Box = null;
      
      public var img_bg:Image = null;
      
      public var list_skill:List = null;
      
      public var list_propNext:List = null;
      
      public var box_title1:Box = null;
      
      public var txt_npcName:Label = null;
      
      public var box_title2:Box = null;
      
      public function RoleShenjieSuccessPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleInfos.phaseUps.RolePhaseUpSkillRenderUI"] = RolePhaseUpSkillRenderUI;
         viewClassMap["game.ui.roleInfos.phaseUps.RolePhaseUpTwoPropRenderUI"] = RolePhaseUpTwoPropRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
