package game.ui.guildTechs
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS13UI;
   import morn.core.components.Button;
   
   public class GuildTechModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg y="0" x="0" showTabLine="true" width="800" height="550"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="4" y="67" width="792" height="480" sizeGrid="20,20,20,20" var="bgInner"/>
			  <List x="25" y="83" repeatX="4" repeatY="2" var="list" spaceX="12" spaceY="11">
			    <GuildTechRender name="render" runtime="game.ui.guildTechs.GuildTechRenderUI"/>
			  </List>
			  <PageBarS2 x="329.5" y="504" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Label text="倒计时" autoSize="none" x="20" y="39" style="普通说明" width="417" height="20" align="left" var="txt_doing"/>
			  <WealthRenderS13 x="52" y="510" var="renderMy" runtime="game.ui.commons.icons.WealthRenderS13UI"/>
			  <Button label="研  究" x="698" y="34" style="按钮中黄" var="btn_researchOpen"/>
			</PopModuleView>;
       
      
      public var bgInner:Image = null;
      
      public var list:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var txt_doing:Label = null;
      
      public var renderMy:WealthRenderS13UI = null;
      
      public var btn_researchOpen:Button = null;
      
      public function GuildTechModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS13UI"] = WealthRenderS13UI;
         viewClassMap["game.ui.guildTechs.GuildTechRenderUI"] = GuildTechRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
