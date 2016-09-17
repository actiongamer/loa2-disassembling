package game.ui.roleInfos
{
   import morn.core.components.View;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   
   public class RoleSelectListPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="176" height="477">
			  <Image skin="png.a5.bgs.panelBgs.img_bgS1" sizeGrid="18,18,18,18" width="215" height="471" x="-0.5" y="-1"/>
			  <Image skin="png.uiRoleInfo.角色-左框长条" x="6" y="420" mouseEnabled="false"/>
			  <List repeatY="6" var="list_role" x="6.5" y="6" spaceY="2">
			    <RoleSelectRender name="render" runtime="game.ui.roleInfos.RoleSelectRenderUI"/>
			  </List>
			  <PageBarS1 x="60" y="436" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			</View>;
       
      
      public var list_role:List = null;
      
      public var pageBar:PageBarS1UI = null;
      
      public function RoleSelectListPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.roleInfos.RoleSelectRenderUI"] = RoleSelectRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
