package game.ui.worldBoss
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.worldBoss.render.WorldBossDmgRankRenderUI;
   
   public class WorldBossRankPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="230" height="262">
			  <Image skin="png.uiWorldBoss.上海排行底" sizeGrid="10,10,10,10" width="217" height="265" x="0" y="0"/>
			  <Image skin="png.uiWorldBoss.透明底-橙" x="1" y="239" width="210" height="20"/>
			  <List x="0" y="28" repeatY="5" spaceY="22">
			    <Box name="render" width="188" height="20" x="0" y="0">
			      <Image skin="png.uiWorldBoss.透明底" x="0" y="0" width="212" height="20"/>
			    </Box>
			  </List>
			  <List x="2" y="30" var="list_rank" repeatY="10" spaceY="3">
			    <WorldBossDmgRankRender name="render" runtime="game.ui.worldBoss.render.WorldBossDmgRankRenderUI"/>
			  </List>
			  <Label text="\l40740002" autoSize="none" x="30" y="8" color="0xf7d739" width="178" height="25" style="渐变1" size="14" align="center"/>
			  <Label text="\l40740004" autoSize="none" x="-25" y="240" width="122" height="26" style="普通绿色" mouseEnabled="false" align="right"/>
			  <Label text="1000000000" autoSize="left" x="101" y="240" width="68" height="20" var="txt_myDamage" style="普通绿色" mouseEnabled="false"/>
			  <Label text="\l40740003" autoSize="none" x="10" y="116" width="187" height="26" style="普通说明" mouseEnabled="false" align="center" var="txt_empty"/>
			  <Label text="\l40740005" autoSize="left" var="txt_getReward" style="下划线黄色" mouseEnabled="false" underline="true" lgx="170,174,170,170,170,170,170,150" lgy="239,239,239,239,239,239,239,239" x="170" y="239"/>
			</View>;
       
      
      public var list_rank:List = null;
      
      public var txt_myDamage:Label = null;
      
      public var txt_empty:Label = null;
      
      public var txt_getReward:Label = null;
      
      public function WorldBossRankPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.worldBoss.render.WorldBossDmgRankRenderUI"] = WorldBossDmgRankRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
