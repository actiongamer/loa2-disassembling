package game.ui.recycleModules
{
   import morn.customs.components.PopModuleView;
   import morn.customs.components.WealthList;
   import game.ui.commons.comps.btns.BtnCancelUI;
   import game.ui.commons.comps.btns.BtnOkUI;
   import morn.core.components.Label;
   import game.ui.recycleModules.render.RecGotItemRenderUI;
   
   public class RecycleConfirmPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="400" height="321">
			  <PanelBgS3 y="0" width="400" height="321" frameStyle="1" x="0"/>
			  <WealthList x="11" y="42" repeatX="4" repeatY="2" spaceY="2" var="list_item" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="375" height="187">
			    <RecGotItemRender name="render" runtime="game.ui.recycleModules.render.RecGotItemRenderUI"/>
			  </WealthList>
			  <Box x="80.5" y="270">
			    <BtnCancel x="130" var="btnCancel" runtime="game.ui.commons.comps.btns.BtnCancelUI"/>
			    <BtnOk var="btnOK" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			  </Box>
			  <Label text="分解获得" autoSize="none" x="26.5" y="237" style="重要提示黄" width="347" height="18" var="txt_alert" align="center" bold="false" centerX="0"/>
			</PopModuleView>;
       
      
      public var list_item:WealthList = null;
      
      public var btnCancel:BtnCancelUI = null;
      
      public var btnOK:BtnOkUI = null;
      
      public var txt_alert:Label = null;
      
      public function RecycleConfirmPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnCancelUI"] = BtnCancelUI;
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         viewClassMap["game.ui.recycleModules.render.RecGotItemRenderUI"] = RecGotItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
