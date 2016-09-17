package game.ui.guildPKCrossSer
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class GPKSkillRankPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="376" height="462">
			  <PanelBgS3 x="0" y="0" width="376" height="462" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <PageBarS2 x="111" y="426" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Image skin="png.uiGuildPKCrossSer.img_skill_rank_bg" x="11" y="35" width="354"/>
			  <Label text="普通说明" autoSize="none" x="70" y="47" style="普通说明" width="226" height="20" align="center"/>
			  <Label text="加底标题" autoSize="none" x="38" y="77" style="加底标题" var="t0"/>
			  <Label text="加底标题" autoSize="none" x="119" y="77" style="加底标题" var="t1"/>
			  <Label text="加底标题" autoSize="none" x="200" y="77" style="加底标题" var="t2"/>
			  <Label text="加底标题" autoSize="none" x="281" y="77" style="加底标题" var="t3"/>
			  <List x="24" y="98" repeatY="10" spaceY="2" var="list_item">
			    <GPKSkillRankRender name="render" runtime="game.ui.guildPKCrossSer.GPKSkillRankRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var t0:Label = null;
      
      public var t1:Label = null;
      
      public var t2:Label = null;
      
      public var t3:Label = null;
      
      public var list_item:List = null;
      
      public function GPKSkillRankPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.guildPKCrossSer.GPKSkillRankRenderUI"] = GPKSkillRankRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
