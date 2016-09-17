package game.ui.vipModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.vipModule.render.QQChargeRenderUI;
   
   public class QQChargeModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="820" height="514">
			  <PanelBg width="820" height="514"/>
			  <Image skin="png.uiVip.上底部" x="14" y="27" var="img_line" width="792" height="95"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="36" y="121" sizeGrid="14,18,14,14" width="748" height="360" var="img_grid"/>
			  <List x="40" y="125" repeatX="3" repeatY="2" var="list_items" spaceX="4" spaceY="8">
			    <QQChargeRender name="render" runtime="game.ui.vipModule.render.QQChargeRenderUI"/>
			  </List>
			  <Image skin="png.a5.comps.img_block" x="309" y="37" var="img_tip1" width="201" height="72"/>
			  <Image skin="png.a5.comps.img_block" x="16" y="-74" width="237" height="195" var="img_role"/>
			  <Button skin="png.uiVip.btn_reCharge" x="587" y="46" stateNum="1" var="btn_beVip" style="按钮中红"/>
			</PopModuleView>;
       
      
      public var img_line:Image = null;
      
      public var img_grid:Image = null;
      
      public var list_items:List = null;
      
      public var img_tip1:Image = null;
      
      public var img_role:Image = null;
      
      public var btn_beVip:Button = null;
      
      public function QQChargeModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.vipModule.render.QQChargeRenderUI"] = QQChargeRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
