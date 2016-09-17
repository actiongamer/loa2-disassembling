package game.ui.shenYuans
{
   import morn.customs.components.SceneModuleView;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.customs.components.ClipList;
   import morn.core.components.List;
   import game.ui.commons.props.RolePropBaseRenderS2UI;
   
   public class ShenYuanModuleUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="600" height="600" name="render">
			  <Button label="挑战" stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_middle_S1" x="708" y="852" var="btn_Challenge"/>
			  <Box x="0" y="180" left="0" top="180" var="buffPanel" width="228" height="444">
			    <Image skin="png.uiShenYuan.img_bg2" height="442" sizeGrid="10,10,10,10" x="0" y="0" width="209" var="buff_bg"/>
			    <Label text="当前排名" x="9" y="15" style="渐变1" size="12" width="100"/>
			    <Label text="深渊代币" autoSize="left" x="9" y="378" style="加底标题" visible="false"/>
			    <Label text="0" autoSize="none" y="307" style="普通说明" align="left" height="18" var="txt_daibi" x="9" visible="false"/>
			    <ClipList value="0" clipWidth="13" align="center" url="png.a5.comps.clipList.clipList_S7" x="33" y="35" var="curr_rank" width="6.5" height="20"/>
			    <Label text="\l41500119 " autoSize="none" y="37" style="普通说明" align="left" height="18" var="txt_wsb" x="11"/>
			    <Label text="属性加成" autoSize="left" x="9" y="211" style="渐变1" size="12" width="100"/>
			    <List x="11" y="234" repeatY="11" var="list_buff" spaceY="0">
			      <RolePropBaseRenderS2 name="render" runtime="game.ui.commons.props.RolePropBaseRenderS2UI"/>
			    </List>
			    <HBox x="11" y="74">
			      <Label text="\l41500120" autoSize="left" x="0" y="0" style="普通说明" height="20" var="label_star"/>
			      <Image skin="png.uiShenYuan.img_star" x="0" y="0" var="icon_star" width="18" height="18"/>
			      <Label text="0" autoSize="left" x="0" y="0" style="普通说明" width="52" height="18" var="txt_star_num_all"/>
			    </HBox>
			    <HBox x="11" y="96">
			      <Label text="\l41500121 " autoSize="left" x="0" y="0" style="普通说明" height="20" var="label_star1"/>
			      <Image skin="png.uiShenYuan.img_star" x="0" y="0" var="icon_star1"/>
			      <Label text="0" autoSize="left" x="0" y="0" style="普通说明" width="52" height="18" var="txt_star_num"/>
			    </HBox>
			    <Box x="206" y="4" var="dock_con">
			      <Button skin="png.uiShenYuan.btn_dock" stateNum="1" centerY="0" var="btn_dock" width="21" height="34"/>
			      <Image skin="png.uiShenYuan.img_dock" x="10" y="17" var="img_dock" mouseEnabled="false" mouseChildren="false" anchorX=".5" anchorY=".5"/>
			    </Box>
			    <Label text="\l41500121 " autoSize="left" x="10" y="164" style="普通说明" height="20" var="label_revive"/>
			    <Label text="\l41500121 " autoSize="left" x="10" y="118" style="普通说明" height="20" var="label_getbuff"/>
			    <Button skin="png.uiShenYuan.btn_rank" x="92" y="25" stateNum="1" var="btn_rank" width="36" height="36" labelMargin="-20,0,20,0" language="ru" lgx="92,92,92,92,92,92,92,150" lgy="25,25,25,25,25,25,25,25"/>
			    <Button skin="png.uiShenYuan.btn_shop" x="92" y="381" stateNum="1" var="btn_shop"/>
			    <Label text="\l41300101" autoSize="left" x="9" y="234" style="普通说明" height="20" var="txt_no_buff"/>
			    <Label text="排行榜" autoSize="left" x="71" y="49" style="渐变1" width="75" height="20" mouseEnabled="false" selectable="false" mouseChildren="false" size="12" align="center" language="ru" lgx="71,71,71,71,71,71,71,128" lgy="49,49,49,49,49,49,49,49"/>
			  </Box>
			  <Box x="236" y="229" top="5" right="0" var="btn_rule">
			    <Image skin="png.uiShenYuan.img_rule_bg" x="13" y="1"/>
			    <Image skin="png.uiShenYuan.img_rule"/>
			    <Label text="规则说明" autoSize="left" x="33" y="8" style="普通说明"/>
			  </Box>
			  <ShenYuanHelpHead x="258" y="64" right="0" top="60" var="friend_assist" runtime="game.ui.shenYuans.ShenYuanHelpHeadUI"/>
			  <Box x="489" y="112" right="0" top="200">
			    <Button skin="png.a5.commonImgs.btn_reward2" x="17" stateNum="1" var="btn_rankReward" y="0"/>
			    <Image skin="png.uiShenYuan.img_chestBg" y="41" mouseEnabled="false" mouseChildren="false" x="-10"/>
			    <Label text="0" autoSize="center" y="59" style="普通说明" align="center" width="86" height="18" var="txt_rewardCD" x="5"/>
			    <Label text="\l41500116 " autoSize="none" y="42" style="渐变1" width="183" height="18" selectable="false" mouseChildren="false" mouseEnabled="false" x="-44" align="center" size="12"/>
			  </Box>
			  <Label text="一键通关中..." autoSize="none" x="235.5" y="448" style="渐变1" width="150" height="22" align="left" centerX="0" bottom="130" var="txt_canPass" visible="false"/>
			  <Label autoSize="none" x="386" y="170" width="209" align="right" right="5" top="170" var="txt_rebornTimes"/>
			  <Image skin="png.uiShenYuan.img_upbg" x="210" y="393" centerX="0" top="1"/>
			  <Label autoSize="none" x="220" y="5" style="二级框标题" width="160" height="20" align="center" centerX="0" top="5" var="txt_currLayer"/>
			</SceneModuleView>;
       
      
      public var btn_Challenge:Button = null;
      
      public var buffPanel:Box = null;
      
      public var buff_bg:Image = null;
      
      public var txt_daibi:Label = null;
      
      public var curr_rank:ClipList = null;
      
      public var txt_wsb:Label = null;
      
      public var list_buff:List = null;
      
      public var label_star:Label = null;
      
      public var icon_star:Image = null;
      
      public var txt_star_num_all:Label = null;
      
      public var label_star1:Label = null;
      
      public var icon_star1:Image = null;
      
      public var txt_star_num:Label = null;
      
      public var dock_con:Box = null;
      
      public var btn_dock:Button = null;
      
      public var img_dock:Image = null;
      
      public var label_revive:Label = null;
      
      public var label_getbuff:Label = null;
      
      public var btn_rank:Button = null;
      
      public var btn_shop:Button = null;
      
      public var txt_no_buff:Label = null;
      
      public var btn_rule:Box = null;
      
      public var friend_assist:game.ui.shenYuans.ShenYuanHelpHeadUI = null;
      
      public var btn_rankReward:Button = null;
      
      public var txt_rewardCD:Label = null;
      
      public var txt_canPass:Label = null;
      
      public var txt_rebornTimes:Label = null;
      
      public var txt_currLayer:Label = null;
      
      public function ShenYuanModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.RolePropBaseRenderS2UI"] = RolePropBaseRenderS2UI;
         viewClassMap["game.ui.shenYuans.ShenYuanHelpHeadUI"] = game.ui.shenYuans.ShenYuanHelpHeadUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
