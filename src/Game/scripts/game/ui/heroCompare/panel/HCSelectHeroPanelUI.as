package game.ui.heroCompare.panel
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.heroCompare.render.HCHeroListRenderUI;
   
   public class HCSelectHeroPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="370" height="267">
			  <PanelBgS3 x="-1" y="0" width="370" height="267"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="16" y="38" width="338" height="211" sizeGrid="20,20,20,20"/>
			  <List x="33" y="51" var="heroList">
			    <HCHeroListRender name="item0" runtime="game.ui.heroCompare.render.HCHeroListRenderUI"/>
			    <HCHeroListRender x="102" name="item1" runtime="game.ui.heroCompare.render.HCHeroListRenderUI"/>
			    <HCHeroListRender x="202" name="item2" runtime="game.ui.heroCompare.render.HCHeroListRenderUI"/>
			    <HCHeroListRender x="52" y="91" name="item3" runtime="game.ui.heroCompare.render.HCHeroListRenderUI"/>
			    <HCHeroListRender x="152" y="91" name="item4" runtime="game.ui.heroCompare.render.HCHeroListRenderUI"/>
			  </List>
			  <Label x="86" y="75" var="txt_desc" width="200" height="30" align="center" autoSize="none" text="1111" size="16"/>
			</PopModuleView>;
       
      
      public var heroList:List = null;
      
      public var txt_desc:Label = null;
      
      public function HCSelectHeroPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.heroCompare.render.HCHeroListRenderUI"] = HCHeroListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
