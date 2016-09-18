package game.ui.busyActivity.dragonBoats.funnys
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.CheckBox;
   import game.ui.commons.icons.WealthRenderSize24UI;
   
   public class DragonBoatFunnyMakeConfirmUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="374" height="356">
			  <PanelBgS3 x="0" y="0" width="335" height="168" showLightBottom="true" frameStyle="1" frameVisible="true" left="0" right="0" top="0" bottom="0"/>
			  <Image skin="png.uiDragonBoat.pops.img_bg" x="12" y="30" var="img_bg1"/>
			  <Label text="选择购买精力的数量(每份10" autoSize="none" x="-2" y="41" style="普通说明" var="txt_tip1" width="379" height="20" align="center" size="13"/>
			  <Label text="购买份数" autoSize="none" x="20" y="189" style="普通说明" width="116" height="20" var="txt_tip2" align="right" size="13"/>
			  <NumBarS1 x="142" y="188" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <List x="84" y="74" spaceX="28" repeatX="3" var="list_meterial" centerX="0">
			    <DragonBoatFunnyMaterialRender name="render" runtime="game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialRenderUI"/>
			  </List>
			  <Button label="按钮" x="127.5" style="按钮大绿" y="308" var="btn_get"/>
			  <CheckBox label="多选多选多选多选" x="80" y="255" selected="true" style="CheckBox普通" var="cb_autoBuy"/>
			  <Label text="购买份数数:" autoSize="none" x="79" y="223" style="普通说明" width="124" height="20" var="txt_tip3" align="left" size="13"/>
			  <WealthRenderSize24 x="148" y="312" var="render_cost" runtime="game.ui.commons.icons.WealthRenderSize24UI"/>
			  <Label text="消耗\n消耗\n消耗" autoSize="none" x="204" y="224" style="普通说明" width="160" height="78" var="txt_cost" align="left" size="13" multiline="true" wordWrap="true"/>
			</PopModuleView>;
       
      
      public var img_bg1:Image = null;
      
      public var txt_tip1:Label = null;
      
      public var txt_tip2:Label = null;
      
      public var numBarUI:NumBarS1UI = null;
      
      public var list_meterial:List = null;
      
      public var btn_get:Button = null;
      
      public var cb_autoBuy:CheckBox = null;
      
      public var txt_tip3:Label = null;
      
      public var render_cost:WealthRenderSize24UI = null;
      
      public var txt_cost:Label = null;
      
      public function DragonBoatFunnyMakeConfirmUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialRenderUI"] = DragonBoatFunnyMaterialRenderUI;
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderSize24UI"] = WealthRenderSize24UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
