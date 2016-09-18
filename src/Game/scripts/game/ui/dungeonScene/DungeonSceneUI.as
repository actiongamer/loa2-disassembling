package game.ui.dungeonScene
{
   import morn.customs.components.FadeView;
   import game.ui.fightPlayers.RightHeaderUI;
   import morn.core.components.Box;
   import morn.customs.components.ClipList;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.HBox;
   import nslm2.modules.battles.battle.BattleHeadPortrait;
   
   public class DungeonSceneUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="900" height="600">
			  <RightHeader x="897" y="1" right="4" top="4" var="rightHeaderUI" runtime="game.ui.fightPlayers.RightHeaderUI"/>
			  <Box centerX="0" var="ui_up" top="4" x="-22" y="-1">
			    <Image skin="png.uiDungeonScene.img_turn_bg" x="22" y="1"/>
			    <ClipList value="0" clipWidth="18" align="center" url="png.a5.comps.clipList.clipList_S11" x="219" y="23" var="txt_turn"/>
			    <Box x="266" y="8" var="box_bo">
			      <ClipList value="3" clipWidth="11" align="left" url="png.a5.comps.clipList.clipList_S10" gapX="1" var="num_bo" width="11" height="16" y="2"/>
			      <ClipList value="3" clipWidth="11" align="left" url="png.a5.comps.clipList.clipList_S10" x="21" gapX="1" var="num_bo_all" y="2"/>
			      <Image skin="png.uiDungeonScene.img_xg" x="11" width="11" height="18" y="2"/>
			      <Label text="\l999902559" autoSize="left" x="31" color="0xfad455" style="渐变1" width="61" height="27" var="icon_bo" size="16" y="0"/>
			    </Box>
			    <Box var="box_res">
			      <Image skin="png.uiDungeonScene.img_item" x="122" var="icon_item" y="2"/>
			      <Label text="1" autoSize="left" x="158" y="10" stroke="0x996600" backgroundColor="0xffffff" width="24" height="19" color="0xffe0a3" var="txt_item" align="left"/>
			      <Label text="1" autoSize="left" x="97" y="10" stroke="0x996600" backgroundColor="0xffffff" width="24" height="19" color="0xffe0a3" var="txt_hero_piece" align="left"/>
			      <Image skin="png.uiDungeonScene.img_yxsp" x="61" var="icon_hero_piece"/>
			      <Image skin="png.uiDungeonScene.img_zbsp" var="icon_equip_piece" width="35" height="35" y="2"/>
			      <Label text="0" autoSize="left" x="36" y="10" stroke="0x996600" backgroundColor="0xffffff" width="24" height="19" color="0xffe0a3" var="txt_equip_piece" align="left"/>
			    </Box>
			    <Label text="\l999902560" autoSize="left" x="148" color="0xfad455" size="14" style="渐变1" width="139" height="32" y="3" align="center" var="txt_turn_title"/>
			    <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.uiDungeonScene.btn_pause" x="333" y="4" var="btn_pause" language="en" lgx="353,333" lgy="4,4"/>
			  </Box>
			  <HBox x="246" y="488" centerX="0" bottom="0" space="10" var="ui_down">
			    <BattleHeadPortrait var="battleHeadPortrait" runtime="nslm2.modules.battles.battle.BattleHeadPortrait"/>
			    <Box x="7" y="30">
			      <Box var="box_speed" x="-15" y="0">
			        <Button skin="png.uiDungeonScene.btn_speed" stateNum="3" var="btn_speed" toggle="true" x="55" y="0"/>
			        <Label text="加速" autoSize="none" y="6" style="渐变1" width="53" height="22" align="right" size="16"/>
			      </Box>
			      <Box y="35" var="box_auto" x="-15">
			        <Label text="自动" autoSize="none" y="14" style="渐变1" width="53" height="22" align="right" size="16"/>
			        <Button skin="png.uiDungeonScene.btn_auto" x="55" y="8" var="btn_auto" stateNum="3" toggle="true"/>
			        <Image skin="png.a5.commonImgs.img_autoLock" x="82" visible="true" mouseEnabled="false" mouseChildren="false" var="img_autoLock" y="0"/>
			      </Box>
			    </Box>
			  </HBox>
			  <Box x="2" var="ui_left" top="20" left="40" y="10">
			    <Image skin="png.uiDungeonScene.img_star" x="113" var="star0" width="40" height="40" smoothing="false" language="en" lgx="133,113" lgy="-2,-2"/>
			    <Image skin="png.uiDungeonScene.img_star" x="149" var="star1" width="40" height="40" language="en" lgx="169,149" lgy="-2,-2"/>
			    <Image skin="png.uiDungeonScene.img_star" x="185" var="star2" width="40" height="40" language="en" lgx="205,185" lgy="-2,-2"/>
			    <Image skin="png.uiDungeonScene.img_star" x="221" var="star3" width="40" height="40" language="en" lgx="241,221" lgy="-2,-2"/>
			    <Image skin="png.uiDungeonScene.img_star" x="257" var="star4" width="40" height="40" language="en" lgx="277,257" lgy="-2,-2"/>
			    <ClipList value="3" clipWidth="11" align="left" url="png.a5.comps.clipList.clipList_S10" x="77" y="14" gapX="1" var="num_live" width="11" height="16" language="en" lgx="97,77" lgy="12,12"/>
			    <ClipList value="3" clipWidth="11" align="left" url="png.a5.comps.clipList.clipList_S10" x="98" y="14" gapX="1" var="num_all" language="en" lgx="118,98" lgy="12,12"/>
			    <Image skin="png.uiDungeonScene.img_xg" x="88" y="14" width="11" height="18" language="en" lgx="108,88" lgy="12,12"/>
			    <Image skin="png.uiDungeonScene.img_hero" y="2"/>
			    <Label text="\l999902561" autoSize="left" x="7" color="0xfad455" style="渐变1" width="111" height="29" y="11" align="center" size="14" var="txt_survive"/>
			  </Box>
			  <Button stateNum="1" var="btn_return" x="839" y="535" bottom="4" right="4" skin="png.uiDungeonScene.btn_pause"/>
			</FadeView>;
       
      
      public var rightHeaderUI:RightHeaderUI = null;
      
      public var ui_up:Box = null;
      
      public var txt_turn:ClipList = null;
      
      public var box_bo:Box = null;
      
      public var num_bo:ClipList = null;
      
      public var num_bo_all:ClipList = null;
      
      public var icon_bo:Label = null;
      
      public var box_res:Box = null;
      
      public var icon_item:Image = null;
      
      public var txt_item:Label = null;
      
      public var txt_hero_piece:Label = null;
      
      public var icon_hero_piece:Image = null;
      
      public var icon_equip_piece:Image = null;
      
      public var txt_equip_piece:Label = null;
      
      public var txt_turn_title:Label = null;
      
      public var btn_pause:Button = null;
      
      public var ui_down:HBox = null;
      
      public var battleHeadPortrait:BattleHeadPortrait = null;
      
      public var box_speed:Box = null;
      
      public var btn_speed:Button = null;
      
      public var box_auto:Box = null;
      
      public var btn_auto:Button = null;
      
      public var img_autoLock:Image = null;
      
      public var ui_left:Box = null;
      
      public var star0:Image = null;
      
      public var star1:Image = null;
      
      public var star2:Image = null;
      
      public var star3:Image = null;
      
      public var star4:Image = null;
      
      public var num_live:ClipList = null;
      
      public var num_all:ClipList = null;
      
      public var txt_survive:Label = null;
      
      public var btn_return:Button = null;
      
      public function DungeonSceneUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.fightPlayers.RightHeaderUI"] = RightHeaderUI;
         viewClassMap["nslm2.modules.battles.battle.BattleHeadPortrait"] = BattleHeadPortrait;
         super.createChildren();
         createView(uiView);
      }
   }
}
