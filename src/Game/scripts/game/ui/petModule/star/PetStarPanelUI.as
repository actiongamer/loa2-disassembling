package game.ui.petModule.star
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.PetPosBuffViewUI;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   import game.ui.petModule.comps.PetComposeCostRenderUI;
   import game.ui.roleInfos.equipPanels.BasePropRenderUI;
   import game.ui.roleInfos.tupos.RoleUpRenderUI;
   
   public class PetStarPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView name="render" width="770" height="472">
			  <List repeatX="10" var="list_stars" spaceX="-6" x="244" y="313">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Image skin="png.uiPet.bg3" x="96" y="39"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="121" y="40"/>
			  <Image skin="png.uiPet.bgstar" x="150" y="343"/>
			  <Label text="\l32000047" autoSize="none" x="127" y="44" style="普通说明暗色深" width="142" height="18" align="center"/>
			  <Label text="1星" autoSize="none" x="124" y="18" style="普通绿色" width="142" height="18" align="center" var="txt_nowStar"/>
			  <List x="136" y="67" repeatY="5" var="list_crtProp">
			    <BasePropRender name="render" runtime="game.ui.roleInfos.equipPanels.BasePropRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_yellow" x="121" y="159"/>
			  <Label text="\l32000011" autoSize="none" x="127" y="162" style="普通说明暗色深" width="142" align="center" height="20"/>
			  <PetPosBuffView y="186" var="posBuffView" x="136" runtime="game.ui.commons.comps.others.PetPosBuffViewUI"/>
			  <Button label="\l32000003" stateNum="1" buttonMode="true" x="367" y="428" labelBold="false" var="btn_startUp" style="按钮大绿"/>
			  <Box x="561" y="16" var="box_nextLvl" width="228" height="301">
			    <Image skin="png.uiPet.bg3" y="23" x="5"/>
			    <Image skin="png.a5.commonImgs.img_yellow" x="30.5" y="24"/>
			    <Label text="\l32000047" autoSize="none" x="36" y="28" style="普通说明暗色深" width="142" height="18" align="center"/>
			    <Label text="2星" autoSize="none" x="34" style="普通绿色" width="142" height="18" align="center" var="txt_nextStar" y="3"/>
			    <List x="48" y="50" repeatY="5" var="list_nextProp">
			      <BasePropRender name="render" runtime="game.ui.roleInfos.equipPanels.BasePropRenderUI"/>
			    </List>
			    <Box x="36" y="143">
			      <Image skin="png.a5.commonImgs.img_yellow"/>
			      <Label text="\l32000011" autoSize="none" y="3" style="普通说明暗色深" width="142" align="center"/>
			      <PetPosBuffView y="27" var="posBuffViewNext" x="13" runtime="game.ui.commons.comps.others.PetPosBuffViewUI"/>
			    </Box>
			    <List x="164" y="47" repeatY="5" spaceY="0" var="list_up">
			      <RoleUpRender name="render" runtime="game.ui.roleInfos.tupos.RoleUpRenderUI"/>
			    </List>
			  </Box>
			  <Button skin="png.a5.commonImgs.btn_tujian" x="687" y="395" stateNum="1" var="btn_tj"/>
			  <Label stroke="0xffffff" mouseEnabled="false" backgroundColor="0xcfbeaf" autoSize="left" x="675" y="446" letterSpacing="1" width="94" height="18" align="center" style="普通说明" text="\l32000012" mouseChildren="false"/>
			  <Label stroke="0xffffff" mouseEnabled="false" backgroundColor="0xcfbeaf" autoSize="left" x="160" y="436" letterSpacing="1" width="193" height="18" align="right" style="普通说明" text="需要战宠20级" var="txt_lvlLimit"/>
			  <Box x="206" y="362" var="box_op">
			    <Label stroke="0xffffff" mouseEnabled="false" backgroundColor="0xcfbeaf" autoSize="left" y="2" letterSpacing="1" width="106" height="18" align="right" style="普通说明" text="\l32000039"/>
			    <List x="115" repeatX="2" spaceX="30" var="list_cost">
			      <PetComposeCostRender name="render" runtime="game.ui.petModule.comps.PetComposeCostRenderUI"/>
			    </List>
			  </Box>
			  <List repeatX="5" var="list_stars2" spaceX="-6" x="339" y="277">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			</FadeView>;
       
      
      public var list_stars:List = null;
      
      public var txt_nowStar:Label = null;
      
      public var list_crtProp:List = null;
      
      public var posBuffView:PetPosBuffViewUI = null;
      
      public var btn_startUp:Button = null;
      
      public var box_nextLvl:Box = null;
      
      public var txt_nextStar:Label = null;
      
      public var list_nextProp:List = null;
      
      public var posBuffViewNext:PetPosBuffViewUI = null;
      
      public var list_up:List = null;
      
      public var btn_tj:Button = null;
      
      public var txt_lvlLimit:Label = null;
      
      public var box_op:Box = null;
      
      public var list_cost:List = null;
      
      public var list_stars2:List = null;
      
      public function PetStarPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.EquipStarRenderUI"] = EquipStarRenderUI;
         viewClassMap["game.ui.commons.comps.others.PetPosBuffViewUI"] = PetPosBuffViewUI;
         viewClassMap["game.ui.petModule.comps.PetComposeCostRenderUI"] = PetComposeCostRenderUI;
         viewClassMap["game.ui.roleInfos.equipPanels.BasePropRenderUI"] = BasePropRenderUI;
         viewClassMap["game.ui.roleInfos.tupos.RoleUpRenderUI"] = RoleUpRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
