package game.ui.treasures.runeBag
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   
   public class RuneComposeUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="374" height="322">
			  <Box var="box1" x="1" y="0" width="372" height="322">
			    <PanelBgS3 x="0" y="0" btnCloseStyle="1" width="372" height="322" frameStyle="2"/>
			    <Button label="取消取消" style="按钮中绿" var="btn_ok" x="140" y="256" labelMargin="28"/>
			    <Image skin="png.a5.comps.img_block" x="159" y="273" autoSize="true" width="24" height="24" anchorX="0.5" anchorY="0.5" var="img_btn_icon"/>
			    <NumBarS1 x="119.5" y="214" var="numBar" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			    <RuneComposeRender x="68" y="76" var="renderFrom" runtime="game.ui.treasures.runeBag.RuneComposeRenderUI"/>
			    <RuneComposeRenderTo x="232" y="67" var="renderTo" runtime="game.ui.treasures.runeBag.RuneComposeRenderToUI"/>
			    <Image skin="png.a5.commonImgs.img_arrowRight2" x="157" y="96"/>
			  </Box>
			</PopModuleView>;
       
      
      public var box1:Box = null;
      
      public var btn_ok:Button = null;
      
      public var img_btn_icon:Image = null;
      
      public var numBar:NumBarS1UI = null;
      
      public var renderFrom:game.ui.treasures.runeBag.RuneComposeRenderUI = null;
      
      public var renderTo:game.ui.treasures.runeBag.RuneComposeRenderToUI = null;
      
      public function RuneComposeUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.treasures.runeBag.RuneComposeRenderToUI"] = game.ui.treasures.runeBag.RuneComposeRenderToUI;
         viewClassMap["game.ui.treasures.runeBag.RuneComposeRenderUI"] = game.ui.treasures.runeBag.RuneComposeRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
