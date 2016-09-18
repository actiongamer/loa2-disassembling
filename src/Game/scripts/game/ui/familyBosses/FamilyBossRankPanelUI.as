package game.ui.familyBosses
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.familyBosses.render.FamilyBossDmgRankRenderUI;
   
   public class FamilyBossRankPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="230" height="262">
			  <Image skin="png.uiFamilyBosses.上海排行底" sizeGrid="10,10,10,10" width="217" height="265" x="0" y="0"/>
			  <Image skin="png.uiFamilyBosses.透明底-橙" x="1" y="239" width="210" height="20"/>
			  <List x="0" y="28" repeatY="5" spaceY="22">
			    <Box name="render" width="188" height="20" x="0" y="0">
			      <Image skin="png.uiFamilyBosses.透明底" x="0" y="0" width="212" height="20"/>
			    </Box>
			  </List>
			  <List x="2" y="30" var="list_rank" repeatY="10" spaceY="3">
			    <FamilyBossDmgRankRender name="render" runtime="game.ui.familyBosses.render.FamilyBossDmgRankRenderUI"/>
			  </List>
			  <Label text="\l40740002" autoSize="none" x="1" y="8" color="0xf7d739" width="210" height="25" style="渐变1" size="14" align="center"/>
			  <Label text="\l40740004" autoSize="none" x="15" y="240" width="122" height="26" style="普通绿色" mouseEnabled="false" align="right"/>
			  <Label text="1000000000" autoSize="left" x="141" y="240" width="68" height="20" var="txt_myDamage" style="普通绿色" mouseEnabled="false"/>
			  <Label text="\l40740003" autoSize="none" x="10" y="116" width="187" height="26" style="普通说明" mouseEnabled="false" align="center" var="txt_empty"/>
			</View>;
       
      
      public var list_rank:List = null;
      
      public var txt_myDamage:Label = null;
      
      public var txt_empty:Label = null;
      
      public function FamilyBossRankPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.familyBosses.render.FamilyBossDmgRankRenderUI"] = FamilyBossDmgRankRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
