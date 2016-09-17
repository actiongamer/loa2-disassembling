package game.ui.roleTeam
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import game.ui.commons.props.FightValueBoxUI;
   import game.ui.roleTeam.render.TeamHeroListRenderUI;
   
   public class RoleTeamModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="554">
			  <PanelBg width="803" height="554"/>
			  <Image skin="png.a5.comps.img_block" x="3" y="33" var="img_funBg" autoSize="true" width="797" height="517"/>
			  <Image skin="png.uiRoleTeam.选中框" x="24" y="40" var="img_arrow"/>
			  <List x="28" y="44" repeatY="5" spaceY="7" var="list_team">
			    <TeamHeroListRender name="render" runtime="game.ui.roleTeam.render.TeamHeroListRenderUI"/>
			  </List>
			  <Box x="27" y="388" var="box_opBtn" width="61" height="127">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_5" x="1" y="70" width="62" height="62" sizeGrid="6,6,6,6"/>
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_5" x="1" y="1" width="62" height="62" sizeGrid="6,6,6,6"/>
			    <Button skin="png.uiRoleTeam.btn_buzhen" y="69" stateNum="1" var="btn_buzhen" x="1"/>
			    <Button skin="png.uiRoleTeam.btn_yuanjun" stateNum="1" var="btn_yuanjun" x="0" y="-1"/>
			    <Image skin="png.a5.commonImgs.img_redPoint" x="53" y="-4" var="img_YjRedPoint" visible="false" width="14" height="14"/>
			    <Label text="援军" autoSize="none" x="-28" y="41" style="渐变4" width="120" height="20" align="center" size="14" mouseEnabled="false" mouseChildren="false"/>
			    <Label text="\l9040100" autoSize="none" x="-20" y="111" style="渐变4" width="104" height="20" align="center" size="14" mouseEnabled="false" mouseChildren="false"/>
			  </Box>
			  <Image skin="png.a5.commonImgs.img_crown" x="20" y="42" var="img_crown"/>
			  <Box x="602" y="66" var="box_fightValue">
			    <Image skin="png.a5.commonImgs.img_powerBg"/>
			    <FightValueBox x="15" var="fightValueBox" y="21" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  </Box>
			</PopModuleView>;
       
      
      public var img_funBg:Image = null;
      
      public var img_arrow:Image = null;
      
      public var list_team:List = null;
      
      public var box_opBtn:Box = null;
      
      public var btn_buzhen:Button = null;
      
      public var btn_yuanjun:Button = null;
      
      public var img_YjRedPoint:Image = null;
      
      public var img_crown:Image = null;
      
      public var box_fightValue:Box = null;
      
      public var fightValueBox:FightValueBoxUI = null;
      
      public function RoleTeamModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.roleTeam.render.TeamHeroListRenderUI"] = TeamHeroListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
