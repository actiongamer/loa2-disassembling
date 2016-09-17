package game.ui.gameHelpModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.gameHelpModule.render.GameHelpRenderUI;
   import game.ui.gameHelpModule.render.GameHelpTitleRenderUI;
   
   public class GameHelpModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="824" height="559">
			  <PanelBg x="8" y="6" width="804" height="551"/>
			  <Image skin="png.a5.comps.img_block" x="14" y="278" width="324" height="274" var="img_bg"/>
			  <List x="19" y="37" repeatY="4" spaceY="-3" var="list_title">
			    <GameHelpTitleRender name="render" runtime="game.ui.gameHelpModule.render.GameHelpTitleRenderUI"/>
			  </List>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="225" y="41" sizeGrid="14,18,14,14" width="575" height="504"/>
			  <List x="233" y="47" spaceY="-39" var="list_help" height="492" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="560">
			    <GameHelpRender name="render" runtime="game.ui.gameHelpModule.render.GameHelpRenderUI"/>
			  </List>
			  <Label text="指导员提问" autoSize="none" x="43" y="511" style="重要提示绿" width="156" size="15" height="22" var="linkTxt" align="center" underline="true" buttonMode="true" mouseChildren="false" mouseEnabled="true"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var list_title:List = null;
      
      public var list_help:List = null;
      
      public var linkTxt:Label = null;
      
      public function GameHelpModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.gameHelpModule.render.GameHelpRenderUI"] = GameHelpRenderUI;
         viewClassMap["game.ui.gameHelpModule.render.GameHelpTitleRenderUI"] = GameHelpTitleRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
