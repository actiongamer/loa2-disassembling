package game.ui.equipGrows
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.RecycleAlertRenderUI;
   import morn.core.components.Tab;
   import morn.customs.components.Accordion;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.equipGrows.equipSelectors.EquipSelectHeroRenderUI;
   import game.ui.equipGrows.equipSelectors.EquipSelectorRenderUI;
   
   public class EquipGrowPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="799" height="552" visible="true">
			  <PanelBg width="799" height="552" x="0" y="0" showTabLine="true"/>
			  <Image skin="jpg.uiEquipGrow.new.img_funBgStr" x="227" y="69" var="img_funBg" width="560" height="470" smoothing="true"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="227" y="70" sizeGrid="14,18,14,14" width="561" height="471"/>
			  <Image skin="png.a5.bgs.panelBgs.img_bgS1" x="11" y="70" sizeGrid="18,18,18,18" width="215" height="471"/>
			  <RecycleAlertRender x="596" y="77" var="render_recycle" runtime="game.ui.commons.comps.others.RecycleAlertRenderUI"/>
			  <Tab labels="强化,精炼,升星" x="24" y="40" selectedIndex="0" var="tabBar" style="TAB长"/>
			  <Accordion x="17" y="78" repeatY="5" var="equipSelector" width="203" height="459" selectedIndex="1" spaceY="1" subTop="0" subBottom="0">
			    <EquipSelectHeroRender x="1" name="render" runtime="game.ui.equipGrows.equipSelectors.EquipSelectHeroRenderUI"/>
			    <List y="41" repeatY="4" name="subRender" x="0" selectedIndex="-1" spaceY="-1">
			      <EquipSelectorRender name="render" runtime="game.ui.equipGrows.equipSelectors.EquipSelectorRenderUI"/>
			    </List>
			    <Image skin="png.a5.commonImgs.img_crown" x="0" y="0" scale=".7"/>
			  </Accordion>
			  <Box x="407" y="91" var="box_equipName">
			    <Image skin="png.a5.commonImgs.img_NameBg" x="11"/>
			    <Label text="精铁铠甲" autoSize="none" y="3" multiline="true" wordWrap="true" width="200" var="txt_equipName" leading="6" letterSpacing="1" align="center" height="21" style="加底标题" x="0" size="14" font="Microsoft YaHei"/>
			  </Box>
			</PopModuleView>;
       
      
      public var img_funBg:Image = null;
      
      public var render_recycle:RecycleAlertRenderUI = null;
      
      public var tabBar:Tab = null;
      
      public var equipSelector:Accordion = null;
      
      public var box_equipName:Box = null;
      
      public var txt_equipName:Label = null;
      
      public function EquipGrowPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RecycleAlertRenderUI"] = RecycleAlertRenderUI;
         viewClassMap["game.ui.equipGrows.equipSelectors.EquipSelectHeroRenderUI"] = EquipSelectHeroRenderUI;
         viewClassMap["game.ui.equipGrows.equipSelectors.EquipSelectorRenderUI"] = EquipSelectorRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
