package game.ui.fashionModules.panels
{
   import morn.customs.components.PanelView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.Button;
   import game.ui.fashionModules.FashionEquipRenderUI;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RedPointUI;
   import game.ui.fashionModules.FashionListRenderUI;
   import game.ui.fashionModules.FashionPropTwoRenderUI;
   
   public class FashionPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="800" height="485">
			  <Image skin="png.uiFashion.img_listBg" x="560" y="-68"/>
			  <PageBarS2 x="606" y="374" var="pageBarRef" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="572" y="-31" repeatY="3" var="list_suit" spaceY="10" selectEnable="false">
			    <FashionListRender name="render" runtime="game.ui.fashionModules.FashionListRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_fightPowerBg" x="379" y="-33"/>
			  <FightValueBox x="413" y="-27" var="fightValueBox" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <Image skin="png.uiFashion.img_listLine" x="569" y="354"/>
			  <Button skin="png.a5.commonImgs.btn_skill" x="418" y="284" var="btn_skill" stateNum="1" label="\l30300017" labelMargin="0,20"/>
			  <Image skin="png.a5.commonImgs.分割透明底" x="46" y="359" width="474" height="82"/>
			  <List x="87" y="395" repeatX="3" repeatY="2" spaceX="10" var="list_fashionProp">
			    <FashionPropTwoRender name="render" runtime="game.ui.fashionModules.FashionPropTwoRenderUI"/>
			  </List>
			  <FashionEquipRender x="151" y="159" var="clothRenderRef" runtime="game.ui.fashionModules.FashionEquipRenderUI"/>
			  <FashionEquipRender x="365" y="159" var="wingRenderRef" runtime="game.ui.fashionModules.FashionEquipRenderUI"/>
			  <Box x="209" y="360" var="box_propTitle" buttonMode="true">
			    <Image skin="png.a5.commonImgs.img_yellow"/>
			    <Label text="时装加成(2件)" x="5.5" y="7" width="142" height="18" align="center" bold="true" style="加底标题" var="txt_propTitle"/>
			  </Box>
			  <RedPoint x="458" y="282" var="changeSkillRedPoint" runtime="game.ui.commons.comps.others.RedPointUI"/>
			</PanelView>;
       
      
      public var pageBarRef:PageBarS2UI = null;
      
      public var list_suit:List = null;
      
      public var fightValueBox:FightValueBoxUI = null;
      
      public var btn_skill:Button = null;
      
      public var list_fashionProp:List = null;
      
      public var clothRenderRef:FashionEquipRenderUI = null;
      
      public var wingRenderRef:FashionEquipRenderUI = null;
      
      public var box_propTitle:Box = null;
      
      public var txt_propTitle:Label = null;
      
      public var changeSkillRedPoint:RedPointUI = null;
      
      public function FashionPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.fashionModules.FashionEquipRenderUI"] = FashionEquipRenderUI;
         viewClassMap["game.ui.fashionModules.FashionListRenderUI"] = FashionListRenderUI;
         viewClassMap["game.ui.fashionModules.FashionPropTwoRenderUI"] = FashionPropTwoRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
