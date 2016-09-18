package game.ui.alerts
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.HBox;
   import game.ui.commons.comps.btns.BtnOkUI;
   import game.ui.commons.comps.btns.BtnCancelUI;
   import morn.core.components.CheckBox;
   
   public class SimpleAlertUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="374" height="256">
			  <PanelBgS3 x="0" y="0" btnCloseStyle="0" width="374" height="256"/>
			  <Label text="重置次数重置次数重置次数重置次数重置次数重置次数重置次数重置次数重置2次数重置" autoSize="none" y="53" var="txt_content" align="center" size="14" multiline="true" wordWrap="true" x="28" centerX="0" style="普通说明" leading="6" width="317" height="138"/>
			  <HBox x="95.5" y="211" var="box_btns" align="top" space="20" centerX="0.5">
			    <BtnOk var="box_ok" y="0" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			    <BtnCancel x="105" var="box_canel" y="0" runtime="game.ui.commons.comps.btns.BtnCancelUI"/>
			  </HBox>
			  <CheckBox label="  不再显示" x="151" y="158" style="CheckBox普通" var="cb_noShow"/>
			</PopModuleView>;
       
      
      public var txt_content:Label = null;
      
      public var box_btns:HBox = null;
      
      public var box_ok:BtnOkUI = null;
      
      public var box_canel:BtnCancelUI = null;
      
      public var cb_noShow:CheckBox = null;
      
      public function SimpleAlertUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnCancelUI"] = BtnCancelUI;
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
