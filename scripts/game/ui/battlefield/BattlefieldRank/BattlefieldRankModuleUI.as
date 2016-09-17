package game.ui.battlefield.BattlefieldRank
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.battlefield.BattlefieldRank.render.BattlefieldTabRenderUI;
   
   public class BattlefieldRankModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="-2" y="3" width="804" height="551"/>
			  <Image skin="png.a5.bgs.panelBgs.左底" x="16" y="42" width="772" height="497" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.a5.comps.img_block" x="13" y="42" var="img_bg" width="775" height="499" autoSize="true"/>
			  <Image skin="png.uiBattlefields.battlefieldRankModule.img_bottomBg" x="29" y="515"/>
			  <Label text="排名每小时更新一次" autoSize="none" x="24" y="519" style="普通说明" width="180" align="center" height="20"/>
			  <List x="25" y="50" repeatY="3" spaceY="7" var="list_tab">
			    <BattlefieldTabRender name="render" runtime="game.ui.battlefield.BattlefieldRank.render.BattlefieldTabRenderUI"/>
			  </List>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="13" y="40" sizeGrid="14,18,14,14" width="776" height="502" mouseChildren="false" mouseEnabled="false"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var list_tab:List = null;
      
      public function BattlefieldRankModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldRank.render.BattlefieldTabRenderUI"] = BattlefieldTabRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
