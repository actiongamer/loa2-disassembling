package game.ui.fashionModules.panels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.List;
   import game.ui.fashionModules.FashionEquipRenderUI;
   import morn.core.components.Button;
   import game.ui.fashionModules.FashionPropTwoRenderUI;
   import game.ui.fashionModules.FashionRenderUI;
   
   public class FashionAccPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="800" height="485">
			  <Image skin="png.a5.commonImgs.分割透明底" x="46" y="359" width="474" height="82"/>
			  <Box x="209" y="360" var="box_propTitle" buttonMode="true">
			    <Image skin="png.a5.commonImgs.img_yellow"/>
			    <Label text="时装加成(2件)" x="5.5" y="7" width="142" height="18" align="center" bold="true" style="加底标题" var="txt_propTitle"/>
			  </Box>
			  <Image skin="png.uiFashion.img_listBg" x="560" y="-68"/>
			  <PageBarS2 x="606" y="374" var="pageBarRef" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Image skin="png.a5.commonImgs.img_fightPowerBg" x="379" y="-33"/>
			  <FightValueBox x="413" y="-27" var="fightValueBox" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <Image skin="png.uiFashion.img_listLine" x="569" y="354"/>
			  <List x="87" y="395" repeatX="3" repeatY="2" spaceX="10" var="list_fashionProp">
			    <FashionPropTwoRender name="render" runtime="game.ui.fashionModules.FashionPropTwoRenderUI"/>
			  </List>
			  <List x="574" y="-10" width="209" height="357" repeatX="3" repeatY="6" spaceX="20" var="list_acc" spaceY="5">
			    <FashionRender name="render" runtime="game.ui.fashionModules.FashionRenderUI"/>
			  </List>
			  <FashionEquipRender x="151" y="159" var="clothRenderRef" runtime="game.ui.fashionModules.FashionEquipRenderUI"/>
			  <FashionEquipRender x="365" y="159" var="wingRenderRef" runtime="game.ui.fashionModules.FashionEquipRenderUI"/>
			  <Label text="\l31210010" autoSize="none" x="144" y="219" style="普通说明" var="txt_acc1" align="center" width="68" height="21"/>
			  <Label text="\l31210011" autoSize="none" x="359" y="219" style="普通说明" var="txt_acc2" align="center" width="68" height="21"/>
			  <Button skin="png.a5.commonImgs.btn_skill" x="418" y="284" var="btn_skill" stateNum="1" label="\l30300017" labelMargin="0,20"/>
			</PanelView>;
       
      
      public var box_propTitle:Box = null;
      
      public var txt_propTitle:Label = null;
      
      public var pageBarRef:PageBarS2UI = null;
      
      public var fightValueBox:FightValueBoxUI = null;
      
      public var list_fashionProp:List = null;
      
      public var list_acc:List = null;
      
      public var clothRenderRef:FashionEquipRenderUI = null;
      
      public var wingRenderRef:FashionEquipRenderUI = null;
      
      public var txt_acc1:Label = null;
      
      public var txt_acc2:Label = null;
      
      public var btn_skill:Button = null;
      
      public function FashionAccPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.fashionModules.FashionEquipRenderUI"] = FashionEquipRenderUI;
         viewClassMap["game.ui.fashionModules.FashionPropTwoRenderUI"] = FashionPropTwoRenderUI;
         viewClassMap["game.ui.fashionModules.FashionRenderUI"] = FashionRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
