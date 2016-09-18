package game.ui.equipGrows.upStars
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   
   public class EquipUpStarMannalPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="400" height="458">
			  <PanelBgS3 x="5" y="3" width="388" height="453"/>
			  <List x="20" y="41" repeatY="3" spaceY="6" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="358" height="396" var="list_mannal">
			    <EquipUpStarMannalRender name="render" y="0" x="0" runtime="game.ui.equipGrows.upStars.EquipUpStarMannalRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var list_mannal:List = null;
      
      public function EquipUpStarMannalPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.equipGrows.upStars.EquipUpStarMannalRenderUI"] = EquipUpStarMannalRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
