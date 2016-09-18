package game.ui.BagModules.equipComposes
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   
   public class EquipComposeUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="382" height="270">
			  <Box var="box1">
			    <PanelBgS3 x="0" y="0" btnCloseStyle="1" width="382" height="270"/>
			    <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="12.5" y="36" width="357" height="144" sizeGrid="20,20,20,20" left="14" right="14" bottom="56" top="36"/>
			    <Button label="取消取消" style="按钮中绿" var="btn_ok" x="144" y="227" labelMargin="28"/>
			    <Image skin="png.a5.comps.img_block" x="164" y="243" autoSize="true" width="24" height="24" anchorX="0.5" anchorY="0.5" var="img_btn_icon"/>
			    <EquipComposeRender x="75" y="44" var="renderFrom" runtime="game.ui.BagModules.equipComposes.EquipComposeRenderUI"/>
			    <EquipComposeRenderTo x="257" y="44" var="renderTo" runtime="game.ui.BagModules.equipComposes.EquipComposeRenderToUI"/>
			    <NumBarS1 x="132" y="169" var="numBar" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			    <Image skin="png.a5.commonImgs.img_arrowRight" x="168.5" y="87"/>
			  </Box>
			</PopModuleView>;
       
      
      public var box1:Box = null;
      
      public var btn_ok:Button = null;
      
      public var img_btn_icon:Image = null;
      
      public var renderFrom:game.ui.BagModules.equipComposes.EquipComposeRenderUI = null;
      
      public var renderTo:game.ui.BagModules.equipComposes.EquipComposeRenderToUI = null;
      
      public var numBar:NumBarS1UI = null;
      
      public function EquipComposeUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.BagModules.equipComposes.EquipComposeRenderToUI"] = game.ui.BagModules.equipComposes.EquipComposeRenderToUI;
         viewClassMap["game.ui.BagModules.equipComposes.EquipComposeRenderUI"] = game.ui.BagModules.equipComposes.EquipComposeRenderUI;
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
