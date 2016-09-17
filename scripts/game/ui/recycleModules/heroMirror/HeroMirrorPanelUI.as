package game.ui.recycleModules.heroMirror
{
   import morn.customs.components.PanelView;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.PlayerTitleRenderUI;
   import game.ui.commons.icons.LotteryRenderS7UI;
   
   public class HeroMirrorPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="778" height="476">
			  <Button label="\l109001002" x="330" style="按钮大绿" y="405" var="btn_change"/>
			  <Image skin="png.uiRecycle.img_arrow" x="313" y="127" var="img_arrow"/>
			  <Image skin="png.uiRecycle.img_recycleLeft" x="6" y="26"/>
			  <Image skin="png.uiRecycle.img_recycleRight" var="img_rightBg" x="395" y="26"/>
			  <Box x="520" y="64" var="box_reward">
			    <Image skin="png.uiRecycle.img_green"/>
			    <Button skin="png.uiRecycle.btn_plus" x="38" y="96" stateNum="1" var="btn_getHero"/>
			    <Label text="选择转换目标英雄" autoSize="left" x="21" y="2" style="重要提示绿" height="18" var="txt_109001009"/>
			  </Box>
			  <Box x="290" y="442" var="box_costWealth">
			    <Label text="本次消耗：" autoSize="left" y="5" style="普通说明" width="64" height="18" var="txt_30609005"/>
			    <List x="62" repeatX="2" var="list_cost">
			      <LotteryRenderS7 name="render" runtime="game.ui.commons.icons.LotteryRenderS7UI"/>
			    </List>
			  </Box>
			  <Box x="76" y="31" var="headItemBox">
			    <HeroHeadItemView name="item0" runtime="game.ui.recycleModules.heroMirror.HeroHeadItemViewUI"/>
			    <HeroHeadItemView name="item1" x="141" y="54" runtime="game.ui.recycleModules.heroMirror.HeroHeadItemViewUI"/>
			    <HeroHeadItemView name="item2" y="115" runtime="game.ui.recycleModules.heroMirror.HeroHeadItemViewUI"/>
			    <HeroHeadItemView name="item3" x="141" y="164" runtime="game.ui.recycleModules.heroMirror.HeroHeadItemViewUI"/>
			    <HeroHeadItemView name="item4" y="230" runtime="game.ui.recycleModules.heroMirror.HeroHeadItemViewUI"/>
			  </Box>
			  <Label text="X 5" autoSize="none" x="542" y="394" style="渐变黄" width="104" height="46" align="center" font="Microsoft YaHei" size="35" bold="true" var="countTxt"/>
			  <Image skin="png.a5.commonImgs.img_recycleAlertBg" x="48" y="405" width="253" height="26"/>
			  <Label text="\l109001017" autoSize="left" x="84" y="410" style="重要提示橘黄" height="39" var="txt_109001017" multiline="true" wordWrap="true" width="224"/>
			  <Button skin="png.uiRecycle.btn_help" x="52" y="408" stateNum="1" var="btn_help"/>
			  <PlayerTitleRender x="435" y="32" var="title_rewardHero" runtime="game.ui.commons.icons.PlayerTitleRenderUI"/>
			  <Button skin="png.uiRecycle.btn_refresh" x="713" y="30" stateNum="1" width="42" height="42" var="changeBtn"/>
			</PanelView>;
       
      
      public var btn_change:Button = null;
      
      public var img_arrow:Image = null;
      
      public var img_rightBg:Image = null;
      
      public var box_reward:Box = null;
      
      public var btn_getHero:Button = null;
      
      public var txt_109001009:Label = null;
      
      public var box_costWealth:Box = null;
      
      public var txt_30609005:Label = null;
      
      public var list_cost:List = null;
      
      public var headItemBox:Box = null;
      
      public var countTxt:Label = null;
      
      public var txt_109001017:Label = null;
      
      public var btn_help:Button = null;
      
      public var title_rewardHero:PlayerTitleRenderUI = null;
      
      public var changeBtn:Button = null;
      
      public function HeroMirrorPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS7UI"] = LotteryRenderS7UI;
         viewClassMap["game.ui.commons.icons.PlayerTitleRenderUI"] = PlayerTitleRenderUI;
         viewClassMap["game.ui.recycleModules.heroMirror.HeroHeadItemViewUI"] = HeroHeadItemViewUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
