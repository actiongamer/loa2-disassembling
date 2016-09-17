package game.ui.otherRoleInfos
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import game.ui.commons.props.FightValueBoxUI;
   import game.ui.otherRoleInfos.render.OtherRoleListPetRenderUI;
   import game.ui.otherRoleInfos.render.OtherRoleListRenderUI;
   
   public class OtherRoleInfoModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="554">
			  <PanelBg width="803" height="554" x="0" y="0"/>
			  <Image skin="png.a5.comps.img_block" x="3" y="33" var="img_funBg" width="797" height="517"/>
			  <Image skin="png.uiRoleTeam.选中框" x="22" y="248" var="img_arrow"/>
			  <List x="26" y="45" repeatY="5" spaceY="7" var="list_team">
			    <OtherRoleListRender name="render" runtime="game.ui.otherRoleInfos.render.OtherRoleListRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_crown" x="20" y="42" var="img_crown"/>
			  <Label text="渐变1" autoSize="none" x="135" y="49" style="渐变1" width="221" height="22" align="left" var="txt_otherFightValue"/>
			  <Box x="25" y="395" var="box_opBtn" width="61" height="127">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_5" x="1" y="1" width="62" height="62" sizeGrid="6,6,6,6"/>
			    <Button skin="png.uiRoleTeam.btn_yuanjun" stateNum="1" var="btn_yuanjun" x="0" y="-1"/>
			    <Label text="援军" autoSize="none" x="-22" y="41" style="渐变4" width="108" height="20" align="center" size="14" mouseEnabled="false" mouseChildren="false"/>
			  </Box>
			  <Box x="602" y="66" var="box_fightValue">
			    <Image skin="png.a5.commonImgs.img_powerBg"/>
			    <FightValueBox x="15" var="fightValueBox" y="21" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  </Box>
			  <OtherRoleListPetRender x="26" y="467" var="petRenderUI" runtime="game.ui.otherRoleInfos.render.OtherRoleListPetRenderUI"/>
			</PopModuleView>;
       
      
      public var img_funBg:Image = null;
      
      public var img_arrow:Image = null;
      
      public var list_team:List = null;
      
      public var img_crown:Image = null;
      
      public var txt_otherFightValue:Label = null;
      
      public var box_opBtn:Box = null;
      
      public var btn_yuanjun:Button = null;
      
      public var box_fightValue:Box = null;
      
      public var fightValueBox:FightValueBoxUI = null;
      
      public var petRenderUI:OtherRoleListPetRenderUI = null;
      
      public function OtherRoleInfoModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.otherRoleInfos.render.OtherRoleListPetRenderUI"] = OtherRoleListPetRenderUI;
         viewClassMap["game.ui.otherRoleInfos.render.OtherRoleListRenderUI"] = OtherRoleListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
