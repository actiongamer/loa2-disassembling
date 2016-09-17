package game.ui.fightPlayers
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.customs.components.ClipList;
   import nslm2.modules.battles.battle.BattleHeadPortrait;
   
   public class BattleSceneUI extends View
   {
      
      protected static var uiView:XML = <View width="1000" height="800">
			  <Box centerX="0" var="ui_up" top="4" x="131" y="133">
			    <Image skin="png.uiDungeonScene.img_turn_bg"/>
			    <Label text="\l999902560" autoSize="left" x="126" color="0xfad455" size="14" style="渐变1" width="139" height="32" y="3" align="center"/>
			    <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.uiDungeonScene.btn_pause" x="244" y="3" var="btn_pause" visible="true"/>
			    <ClipList value="0" clipWidth="18" align="center" url="png.a5.comps.clipList.clipList_S11" x="197" y="22" var="txt_turn"/>
			  </Box>
			  <HBox bottom="0" centerX="0" space="10" x="0" y="-28">
			    <BattleHeadPortrait var="battleHeadPortrait" runtime="nslm2.modules.battles.battle.BattleHeadPortrait" y="28"/>
			    <Box x="0" y="53">
			      <Box var="box_speed">
			        <Label text="加速" autoSize="none" y="6" style="渐变1" width="100" height="22" align="left" size="16" x="0"/>
			        <Button skin="png.uiDungeonScene.btn_speed" stateNum="3" var="btn_speed" toggle="true" x="50" language="en" lgx="100,50" lgy="0,0" y="0"/>
			      </Box>
			      <Box y="43" var="box_auto" x="0">
			        <Label text="自动" autoSize="none" y="6" style="渐变1" width="100" height="22" align="left" size="16"/>
			        <Button skin="png.uiDungeonScene.btn_auto" x="50" var="btn_auto" stateNum="3" toggle="true" language="en" lgx="100,50" lgy="0,0" y="0"/>
			      </Box>
			    </Box>
			  </HBox>
			</View>;
       
      
      public var ui_up:Box = null;
      
      public var btn_pause:Button = null;
      
      public var txt_turn:ClipList = null;
      
      public var battleHeadPortrait:BattleHeadPortrait = null;
      
      public var box_speed:Box = null;
      
      public var btn_speed:Button = null;
      
      public var box_auto:Box = null;
      
      public var btn_auto:Button = null;
      
      public function BattleSceneUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["nslm2.modules.battles.battle.BattleHeadPortrait"] = BattleHeadPortrait;
         super.createChildren();
         createView(uiView);
      }
   }
}
