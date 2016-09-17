package game.ui.BagModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import game.ui.commons.icons.WealthRenderS8UI;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import morn.core.components.Button;
   
   public class UseBatchViewUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="370" height="262">
			  <Image skin="png.uiPreview.foundations.背包-批量使用" x="-951" y="-385" alpha="0.5"/>
			  <PanelBgS3 width="370" height="262" panelDragEnabled="true" showImgTitle1="false"/>
			  <Box x="1" y="150" var="boxCost">
			    <Image skin="png.uiBag.红色底" alpha="1"/>
			    <Label text="需要消耗:" autoSize="none" x="35" y="5" style="普通说明" size="15" width="141" height="33" align="right"/>
			    <WealthRenderS8 x="181" y="4" var="renderCost" runtime="game.ui.commons.icons.WealthRenderS8UI"/>
			  </Box>
			  <Box x="46" y="65" var="boxItem">
			    <NumBarS1 x="135" y="35" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			    <UseBatchItemRender var="renderItem" runtime="game.ui.BagModules.UseBatchItemRenderUI"/>
			    <Label text="使用数量:" autoSize="left" x="75" y="38" style="重要提示橘黄"/>
			  </Box>
			  <Box x="79" y="218" var="boxBtns" centerX="0" bottom="18">
			    <Button label="确 定" style="按钮中红" var="btn_ok"/>
			    <Button label="取 消" x="132" style="按钮中蓝" var="btn_cancel"/>
			  </Box>
			</PopModuleView>;
       
      
      public var boxCost:Box = null;
      
      public var renderCost:WealthRenderS8UI = null;
      
      public var boxItem:Box = null;
      
      public var numBarUI:NumBarS1UI = null;
      
      public var renderItem:game.ui.BagModules.UseBatchItemRenderUI = null;
      
      public var boxBtns:Box = null;
      
      public var btn_ok:Button = null;
      
      public var btn_cancel:Button = null;
      
      public function UseBatchViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.BagModules.UseBatchItemRenderUI"] = game.ui.BagModules.UseBatchItemRenderUI;
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS8UI"] = WealthRenderS8UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
