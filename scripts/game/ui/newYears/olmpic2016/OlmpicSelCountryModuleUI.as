package game.ui.newYears.olmpic2016
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class OlmpicSelCountryModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="480" height="400">
			  <PanelBg width="480" height="400"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="23" y="45" width="434" height="278" sizeGrid="20,20,20,20"/>
			  <List x="33" y="55" repeatX="4" repeatY="3" spaceX="20" spaceY="10" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="419" height="260" var="list">
			    <OlmpicSelCountryRender name="render" runtime="game.ui.newYears.olmpic2016.OlmpicSelCountryRenderUI"/>
			  </List>
			  <Label text="普通绿色" x="25" y="329" style="普通绿色" width="430" height="20" var="txt_desc" align="center"/>
			  <Button label="\l10000013" y="356" style="按钮中红" x="265" var="btn_cancel"/>
			  <Button label="\l10000012" x="138" y="356" style="按钮中绿" var="btn_ok"/>
			  <Button skin="png.a5.commonImgs.img_rule" x="410" y="3" var="btn_rule" stateNum="1"/>
			</PopModuleView>;
       
      
      public var list:List = null;
      
      public var txt_desc:Label = null;
      
      public var btn_cancel:Button = null;
      
      public var btn_ok:Button = null;
      
      public var btn_rule:Button = null;
      
      public function OlmpicSelCountryModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.olmpic2016.OlmpicSelCountryRenderUI"] = OlmpicSelCountryRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
