package game.ui.treasures
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Tab;
   import morn.core.components.Label;
   import morn.customs.components.Accordion;
   import morn.core.components.List;
   import game.ui.equipGrows.equipSelectors.EquipSelectHeroRenderUI;
   import game.ui.treasures.comp.TreasureSelectorRenderUI;
   import game.ui.treasures.render.RuneCategoryRenderUI;
   
   public class TreasureModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="808" height="553">
			  <PanelBg x="6" y="-3" width="804" height="553" showTabLine="false"/>
			  <Image skin="jpg.uiTreasure.img_funBg" x="233" y="61" var="img_funBg"/>
			  <Tab labels="圣物强化,圣物镶嵌" x="35" y="33" selectedIndex="1" var="tabBar" style="TAB长"/>
			  <Image skin="png.uiTreasure.左底" x="27" y="61" width="203" height="469"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="23" y="57" sizeGrid="14,18,14,14" width="771" height="477"/>
			  <Image skin="png.uiTreasure.竖线" x="230" y="61" height="469"/>
			  <Label text="\l30600320 " autoSize="none" x="454" y="34" style="下划线黄色" align="right" width="325" height="20" underline="true" mouseChildren="false" buttonMode="true" var="txt_goAuction"/>
			  <Image skin="png.uiTreasure2.重铸 洗炼.中心圆" x="432" y="138" var="img_circle"/>
			  <Accordion x="29" y="64" var="equipSelector" selectedIndex="1" spaceY="10" subTop="2" width="201" height="457" repeatY="5">
			    <EquipSelectHeroRender x="1" name="render" runtime="game.ui.equipGrows.equipSelectors.EquipSelectHeroRenderUI"/>
			    <List y="41" repeatY="2" name="subRender" x="0" selectedIndex="-1" spaceY="1">
			      <TreasureSelectorRender name="render" buttonMode="true" runtime="game.ui.treasures.comp.TreasureSelectorRenderUI"/>
			    </List>
			    <Image skin="png.a5.commonImgs.img_crown" x="4" y="0" scale=".6"/>
			  </Accordion>
			  <List x="30" y="64" repeatY="9" width="213" height="457" var="list_runeCategory" spaceY="3">
			    <RuneCategoryRender name="render" runtime="game.ui.treasures.render.RuneCategoryRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_funBg:Image = null;
      
      public var tabBar:Tab = null;
      
      public var txt_goAuction:Label = null;
      
      public var img_circle:Image = null;
      
      public var equipSelector:Accordion = null;
      
      public var list_runeCategory:List = null;
      
      public function TreasureModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.equipGrows.equipSelectors.EquipSelectHeroRenderUI"] = EquipSelectHeroRenderUI;
         viewClassMap["game.ui.treasures.comp.TreasureSelectorRenderUI"] = TreasureSelectorRenderUI;
         viewClassMap["game.ui.treasures.render.RuneCategoryRenderUI"] = RuneCategoryRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
