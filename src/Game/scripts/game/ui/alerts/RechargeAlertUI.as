package game.ui.alerts
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class RechargeAlertUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="374" height="256">
			  <PanelBgS3 btnCloseStyle="0" width="374" height="256"/>
			  <Label autoSize="none" y="97" var="txt_content" align="center" size="14" multiline="true" wordWrap="true" x="30" centerX="0" style="普通说明" leading="6" width="296" text="当前钻石不足，请前往充值" height="25"/>
			  <Box x="48" y="205" centerX="0">
			    <Button label="取 消" x="166" style="按钮大黄" var="btn_cancel"/>
			    <Button label="充 值" style="按钮大蓝" var="btn_recharge"/>
			  </Box>
			</PopModuleView>;
       
      
      public var txt_content:Label = null;
      
      public var btn_cancel:Button = null;
      
      public var btn_recharge:Button = null;
      
      public function RechargeAlertUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
