package game.ui.teamPKCS.invite
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   
   public class TPKCInviteListUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="416" height="488" name="render">
			  <PanelBgS3 x="0" y="0" width="416" height="488" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Image skin="png.comp.image" x="14" y="38" width="387" height="390" var="img_bg_list"/>
			  <List x="19" y="44" width="376" height="380" var="list_invited">
			    <TPKCInviteRender name="render" runtime="game.ui.teamPKCS.invite.TPKCInviteRenderUI"/>
			  </List>
			  <PageBarS2 x="134.5" y="442" var="pageBarUI" centerX="0" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			</PopModuleView>;
       
      
      public var img_bg_list:Image = null;
      
      public var list_invited:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public function TPKCInviteListUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.teamPKCS.invite.TPKCInviteRenderUI"] = TPKCInviteRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
