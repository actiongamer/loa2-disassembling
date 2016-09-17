package game.ui.fightPlayers
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import morn.core.components.List;
   
   public class UnitView2DUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Image skin="png.uiFightPlayer.bg_hp" x="-35" y="-2"/>
			  <Label text="名称" x="-54" y="-21" backgroundColor="0x-1" color="0xffff00" stroke="0x66ff" autoSize="none" align="center" width="110" bold="false" var="txt_name" size="12"/>
			  <ProgressBar skin="png.uiFightPlayer.progress_hp" x="-33" y="0" var="bar_hp" value="1"/>
			  <List x="-34" y="11" repeatX="6" repeatY="2" spaceX="1" var="list_icon" spaceY="1">
			    <BattleBuffIcon name="render" runtime="game.ui.fightPlayers.BattleBuffIconUI"/>
			  </List>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var bar_hp:ProgressBar = null;
      
      public var list_icon:List = null;
      
      public function UnitView2DUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.fightPlayers.BattleBuffIconUI"] = BattleBuffIconUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
