package game.ui.statistic
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Tab;
   
   public class StatisticPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="550" height="485">
			  <PanelBgS3 x="0" y="0" width="550" height="430" top="0" bottom="0" frameMargin="11,69,11,11" frameStyle="2"/>
			  <Image skin="png.uiStatistic.img_vs" x="24" y="75"/>
			  <List x="15" y="111" width="252" repeatX="0" var="list_left" repeatY="6">
			    <LeftHead name="render" x="1" y="0" runtime="game.ui.statistic.LeftHeadUI"/>
			  </List>
			  <List x="297" y="109" var="list_right" repeatX="0" width="235" repeatY="6">
			    <RightHead name="render" runtime="game.ui.statistic.RightHeadUI"/>
			  </List>
			  <Label text="我方输出伤害" autoSize="left" x="22" y="84" bold="true" color="0xf1c373" var="title0" width="194" height="20"/>
			  <Label text="敌方输出伤害" autoSize="left" x="335" y="84" bold="true" color="0xf1c373" var="title1" align="right" width="187" height="20"/>
			  <Tab labels="输出伤害,承受伤害,治疗量" x="18" y="46" style="TAB暗红色" var="tab_type"/>
			</PopModuleView>;
       
      
      public var list_left:List = null;
      
      public var list_right:List = null;
      
      public var title0:Label = null;
      
      public var title1:Label = null;
      
      public var tab_type:Tab = null;
      
      public function StatisticPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.statistic.LeftHeadUI"] = LeftHeadUI;
         viewClassMap["game.ui.statistic.RightHeadUI"] = RightHeadUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
