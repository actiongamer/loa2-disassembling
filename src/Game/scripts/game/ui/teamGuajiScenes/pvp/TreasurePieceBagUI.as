package game.ui.teamGuajiScenes.pvp
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   
   public class TreasurePieceBagUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="393" height="496">
			  <PanelBgS3 width="391" height="493" x="0" y="0"/>
			  <List y="40" repeatY="4" spaceY="8" var="list_piece" x="17.5">
			    <TreasurePieceListRender name="render" runtime="game.ui.teamGuajiScenes.pvp.TreasurePieceListRenderUI"/>
			  </List>
			  <PageBarS2 x="126" y="448" var="pageBarUI" centerX="0" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Label text="\l41300245" autoSize="none" style="二级框标题" var="txt_empty" width="336" height="52" align="center" centerX="0" size="14" y="235" x="25.5" multiline="true" wordWrap="true"/>
			</PopModuleView>;
       
      
      public var list_piece:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var txt_empty:Label = null;
      
      public function TreasurePieceBagUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.teamGuajiScenes.pvp.TreasurePieceListRenderUI"] = TreasurePieceListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
