package game.ui.championship
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.championship.comp.RewardListRenderUI;
   
   public class ChampionShipRewardPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="388" height="526">
			  <PanelBgS3 width="388" height="526"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.底板一级二级底九宫格" left="15" right="15" top="36" bottom="62"/>
			  <Label text="第一名" autoSize="none" x="17" y="483" style="普通说明" var="txt_refreshTime" align="left" width="131" height="18"/>
			  <Button label="领  取" x="158" y="472" style="按钮中绿" var="btn_get"/>
			  <Image skin="png.uiArenas.选中框" x="47.5" y="39" width="293" height="25"/>
			  <Label text="昨日积分:" autoSize="none" x="131" y="43" style="普通说明" var="txt_tip" align="left" width="195" height="18"/>
			  <Label text="139" autoSize="none" x="210" y="42" style="渐变2" var="txt_myRank" align="left" width="78" height="18"/>
			  <List x="15" y="65" var="list" repeatY="6">
			    <RewardListRender name="render" runtime="game.ui.championship.comp.RewardListRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var txt_refreshTime:Label = null;
      
      public var btn_get:Button = null;
      
      public var txt_tip:Label = null;
      
      public var txt_myRank:Label = null;
      
      public var list:List = null;
      
      public function ChampionShipRewardPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.championship.comp.RewardListRenderUI"] = RewardListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
