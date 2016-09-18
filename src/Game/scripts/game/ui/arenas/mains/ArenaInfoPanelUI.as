package game.ui.arenas.mains
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.TreasureBoxBaseRenderUI;
   import morn.core.components.Button;
   import game.ui.commons.comps.others.RedPointUI;
   import morn.core.components.CheckBox;
   
   public class ArenaInfoPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="145" height="330">
			  <Image skin="png.uiArenas.底框" x="0" y="0" width="145" height="330"/>
			  <Box x="-18" y="119" var="box_reward">
			    <Image skin="png.uiArenas.宝箱底框" right="0" var="img_treasureBg"/>
			    <Image skin="png.uiArenas.宝箱名底框" x="11" y="106" right="30"/>
			    <Label text="\l50200018" autoSize="none" y="107" style="小标题" width="146" height="16" align="center" mouseEnabled="false" mouseChildren="false" right="10" x="8"/>
			    <Label text="12:13:13" autoSize="none" x="9" y="127" style="普通说明" width="146" height="16" align="center" var="txt_rewardCD" right="10"/>
			    <TreasureBoxBaseRender y="59" var="btn_rewardIcon" right="62" x="64" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			    <Image skin="png.a5_tw.commonImgs.img_gotReward" x="48" y="38" var="img_rewarded" right="40" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			  <Button skin="png.uiArenas.女神2封神界面_19" x="85" y="69" var="btn_getSwap" stateNum="1"/>
			  <Button skin="png.uiArenas.女神2封神界面_06" x="92" y="10" var="btn_rank" stateNum="1"/>
			  <Label text="\l50200001" autoSize="left" x="8" y="8" style="小标题"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" letterSpacing="2" skin="png.a5.btns.btn_addGreen" x="94" y="128" var="btn_buyTimes"/>
			  <Label text="\l50200003" autoSize="left" x="8" y="61" style="小标题"/>
			  <Label text="\l50200002" autoSize="left" x="8" y="110" style="小标题"/>
			  <Label text="\l50200005" autoSize="left" x="8" y="157" style="小标题" var="txt_cdTitle"/>
			  <Label text="1313" autoSize="none" x="4" y="81" style="渐变1" var="txt_scoreValue" align="center" width="73"/>
			  <Label text="47/99" autoSize="none" x="6.5" y="130" style="普通说明" var="txt_times" width="69" height="18" align="center"/>
			  <Label text="12:12:20" autoSize="none" x="5" y="176" style="普通绿色" width="74" height="16" var="txt_cd" align="center"/>
			  <Label text="排行榜" autoSize="left" x="81" y="34" style="小标题" align="center" var="txt_rankTip" width="55" height="18"/>
			  <Label text="兑换" autoSize="left" x="48.5" y="90" style="小标题" align="center" var="txt_scoreSwapTip" width="110" height="18"/>
			  <Label text="99999" autoSize="none" x="6" y="28" style="渐变1" var="txt_rank" align="center" width="68"/>
			  <Button label="加速" x="77" y="173" style="按钮小绿" var="btn_clearCD" width="56" height="22"/>
			  <RedPoint x="110" y="68" var="scoreSwapRedPoi" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <CheckBox x="23" y="268" selected="false" style="CheckBox普通" var="checkBox_simple" label="\l40740006"/>
			  <Label text="点击查看详情" autoSize="left" x="7" y="296" style="技能名标题" var="txt_more" width="126" height="20" align="center"/>
			</View>;
       
      
      public var box_reward:Box = null;
      
      public var img_treasureBg:Image = null;
      
      public var txt_rewardCD:Label = null;
      
      public var btn_rewardIcon:TreasureBoxBaseRenderUI = null;
      
      public var img_rewarded:Image = null;
      
      public var btn_getSwap:Button = null;
      
      public var btn_rank:Button = null;
      
      public var btn_buyTimes:Button = null;
      
      public var txt_cdTitle:Label = null;
      
      public var txt_scoreValue:Label = null;
      
      public var txt_times:Label = null;
      
      public var txt_cd:Label = null;
      
      public var txt_rankTip:Label = null;
      
      public var txt_scoreSwapTip:Label = null;
      
      public var txt_rank:Label = null;
      
      public var btn_clearCD:Button = null;
      
      public var scoreSwapRedPoi:RedPointUI = null;
      
      public var checkBox_simple:CheckBox = null;
      
      public var txt_more:Label = null;
      
      public function ArenaInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         viewClassMap["game.ui.commons.comps.others.TreasureBoxBaseRenderUI"] = TreasureBoxBaseRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
