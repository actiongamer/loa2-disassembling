package game.ui.treasures.runeBag
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import game.ui.commons.comps.btns.BtnCancelUI;
   import game.ui.commons.comps.btns.BtnOkUI;
   import morn.core.components.Button;
   import game.ui.treasures.render.RuneBigRenderUI;
   
   public class RuneBatchComposePreviewPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="375" height="324">
			  <PanelBgS3 x="2" y="1" btnCloseStyle="1" width="372" height="322" frameVisible="false"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="14" y="40" width="345" height="267" sizeGrid="20,20,20,20"/>
			  <List x="38" y="57" repeatX="4" repeatY="2" spaceX="20" spaceY="30" var="list_item">
			    <RuneBigRender name="render" runtime="game.ui.treasures.render.RuneBigRenderUI"/>
			  </List>
			  <BtnCancel x="206" y="257" var="cacelBtn" runtime="game.ui.commons.comps.btns.BtnCancelUI"/>
			  <BtnOk x="69" y="257" var="okBtn" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			  <Button skin="png.uiTreasure.btn_left" x="14" y="116" stateNum="1" var="btn_prev"/>
			  <Button skin="png.uiTreasure.btn_right" x="346" y="116" stateNum="1" var="btn_next"/>
			</PopModuleView>;
       
      
      public var list_item:List = null;
      
      public var cacelBtn:BtnCancelUI = null;
      
      public var okBtn:BtnOkUI = null;
      
      public var btn_prev:Button = null;
      
      public var btn_next:Button = null;
      
      public function RuneBatchComposePreviewPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnCancelUI"] = BtnCancelUI;
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         viewClassMap["game.ui.treasures.render.RuneBigRenderUI"] = RuneBigRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
