package game.ui.busyActivity.dragonBoats.donates
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialRenderUI;
   
   public class DragonBoatDonateConfirmUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="374" height="356">
			  <PanelBgS3 x="0" y="0" width="335" height="168" showLightBottom="true" frameStyle="1" frameVisible="true" left="0" right="0" top="0" bottom="0"/>
			  <Image skin="png.uiDragonBoat.pops.img_bg" x="12" y="30" var="img_bg1"/>
			  <Label text="选择购买精力的数量(每份10" autoSize="none" x="-2" y="41" style="普通说明" var="txt_tip1" width="379" height="20" align="center" size="13"/>
			  <Label text="购买份数" autoSize="none" x="20" y="204" style="普通说明" width="116" height="20" var="txt_tip2" align="right" size="13"/>
			  <Label text="(10/20)" autoSize="none" x="142" y="242" style="重要提示绿" var="txt_score" align="left" width="154" height="20" size="13"/>
			  <NumBarS1 x="142" y="203" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <List x="84" y="74" spaceX="28" repeatX="3" var="list_meterial" centerX="0">
			    <DragonBoatFunnyMaterialRender name="render" runtime="game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialRenderUI"/>
			  </List>
			  <Button label="按钮" x="127.5" style="按钮大绿" y="308" var="btn_get"/>
			  <Label text="购买份数" autoSize="none" x="20" y="242" style="普通说明" width="116" height="20" var="txt_tip3" align="right" size="13"/>
			</PopModuleView>;
       
      
      public var img_bg1:Image = null;
      
      public var txt_tip1:Label = null;
      
      public var txt_tip2:Label = null;
      
      public var txt_score:Label = null;
      
      public var numBarUI:NumBarS1UI = null;
      
      public var list_meterial:List = null;
      
      public var btn_get:Button = null;
      
      public var txt_tip3:Label = null;
      
      public function DragonBoatDonateConfirmUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialRenderUI"] = DragonBoatFunnyMaterialRenderUI;
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
