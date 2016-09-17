package game.ui.battlefield.BattlefieldInvited
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import game.ui.battlefield.BattlefieldInvited.render.BattlefieldInvitedRenderUI;
   
   public class BattlefieldInvitedModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="421" height="494">
			  <PanelBgS3 width="409" height="489" x="0" y="0" showTabLine="true"/>
			  <Image skin="png.a5.comps.img_block" x="13" y="36" var="img_bg" width="384" height="391"/>
			  <List x="19" y="45" repeatY="4" var="list_invited" spaceY="1">
			    <BattlefieldInvitedRender name="render" x="0" y="0" runtime="game.ui.battlefield.BattlefieldInvited.render.BattlefieldInvitedRenderUI"/>
			  </List>
			  <PageBarS2 x="133.5" y="446" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var list_invited:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public function BattlefieldInvitedModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldInvited.render.BattlefieldInvitedRenderUI"] = BattlefieldInvitedRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
