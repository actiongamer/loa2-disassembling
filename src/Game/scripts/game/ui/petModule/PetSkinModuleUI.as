package game.ui.petModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.petModule.comps.PetSelectPanelUI;
   import game.ui.petModule.skin.PetSkinEquipRenderUI;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.fashionModules.FashionPropTwoRenderUI;
   import game.ui.petModule.skin.PetSkinListRenderUI;
   
   public class PetSkinModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="555" mouseChildren="true" mouseEnabled="true">
			  <PanelBg width="803" height="554" x="3" y="3"/>
			  <Image skin="png.uiPet.bg" x="4" y="28" var="img_bg" width="800" height="521"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="19" y="40" sizeGrid="14,18,14,14" width="771" height="500" mouseEnabled="false" mouseChildren="false" var="img_grid"/>
			  <Image skin="png.uiPet.leftBg" x="22" y="43" width="83" height="493"/>
			  <Image skin="png.uiPet.战宠-皮肤bj001" x="525" y="45"/>
			  <List x="566" y="48" repeatY="3" var="list_suit" spaceY="10" selectEnable="false" width="208" height="382">
			    <PetSkinListRender name="render" runtime="game.ui.petModule.skin.PetSkinListRenderUI"/>
			  </List>
			  <PetSelectPanel x="26" y="63" var="petSelectPanel" runtime="game.ui.petModule.comps.PetSelectPanelUI"/>
			  <PetSkinEquipRender x="470" y="349" var="skinRenderRef" runtime="game.ui.petModule.skin.PetSkinEquipRenderUI"/>
			  <Image skin="png.uiPet.img_downbg" x="33" y="442" mouseChildren="false" mouseEnabled="false"/>
			  <Box x="109" y="457" var="box_bottom">
			    <List y="36" repeatX="3" repeatY="2" spaceX="20" var="list_fashionProp">
			      <FashionPropTwoRender name="render" runtime="game.ui.fashionModules.FashionPropTwoRenderUI"/>
			    </List>
			    <Box x="134" var="box_propTitle" buttonMode="true">
			      <Image skin="png.a5.commonImgs.img_yellow"/>
			      <Label text="皮肤加成(2件)" x="5.5" y="7" width="142" height="18" align="center" bold="true" style="加底标题" var="txt_propTitle"/>
			    </Box>
			  </Box>
			  <Box x="219" y="46" var="box_title">
			    <Image skin="png.uiPet.bg4"/>
			    <Label text="Lv.3" stroke="0xffffff" mouseEnabled="false" var="txt_level" backgroundColor="0xcfbeaf" autoSize="left" x="11" y="19" letterSpacing="1" width="64" height="18" align="right" style="普通说明"/>
			    <Label text="激活条件：" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" autoSize="left" x="80" y="16" letterSpacing="1" width="141" height="25" align="left" style="二级框标题" size="14"/>
			    <Label text="激活条件：" stroke="0xffffff" mouseEnabled="false" var="txt_jinjie" backgroundColor="0xcfbeaf" autoSize="left" x="24" y="43" letterSpacing="1" width="159" height="18" align="center" style="普通说明"/>
			  </Box>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_grid:Image = null;
      
      public var list_suit:List = null;
      
      public var petSelectPanel:PetSelectPanelUI = null;
      
      public var skinRenderRef:PetSkinEquipRenderUI = null;
      
      public var box_bottom:Box = null;
      
      public var list_fashionProp:List = null;
      
      public var box_propTitle:Box = null;
      
      public var txt_propTitle:Label = null;
      
      public var box_title:Box = null;
      
      public var txt_level:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_jinjie:Label = null;
      
      public function PetSkinModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.fashionModules.FashionPropTwoRenderUI"] = FashionPropTwoRenderUI;
         viewClassMap["game.ui.petModule.comps.PetSelectPanelUI"] = PetSelectPanelUI;
         viewClassMap["game.ui.petModule.skin.PetSkinEquipRenderUI"] = PetSkinEquipRenderUI;
         viewClassMap["game.ui.petModule.skin.PetSkinListRenderUI"] = PetSkinListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
