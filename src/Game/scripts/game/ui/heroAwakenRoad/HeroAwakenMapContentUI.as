package game.ui.heroAwakenRoad
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Button;
   
   public class HeroAwakenMapContentUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="796" height="531">
			  <List var="list_map">
			    <HeroAwakenChapterRender name="render" runtime="game.ui.heroAwakenRoad.HeroAwakenChapterRenderUI"/>
			  </List>
			  <Image skin="png.uiHeroAwakenRoad.imgframe" x="0" y="-1" width="797" height="533" sizeGrid="8,8,8,8" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.uiHeroAwakenRoad.img_titleBg" x="340" y="19" centerX="0"/>
			  <Label text="第三章 深渊恶魔" autoSize="left" x="342" var="txt_title" y="22" width="320" align="center" style="普通说明" size="14" bold="true" centerX="0"/>
			  <Image skin="png.uiHeroAwakenRoad.英雄-觉醒之路-下bj" x="-1" y="372" mouseChildren="false" mouseEnabled="false"/>
			  <Box x="233" y="439" var="box_heroAwakenShop">
			    <Button skin="png.uiHeroAwakenRoad.11306" x="30" stateNum="1" var="btn_heroAwakenShop" labelMargin="0,20,0,0"/>
			    <Label text="\l999030124" autoSize="none" y="47" style="随品质变化" width="126" align="center" var="txt_name" mouseEnabled="false" mouseChildren="false" multiline="false" wordWrap="false" height="20"/>
			  </Box>
			  <HeroAwakenRoadRewardViw x="315" y="463" var="ui_top" runtime="game.ui.heroAwakenRoad.HeroAwakenRoadRewardViwUI"/>
			  <Label text="\l30121000" autoSize="none" x="29" y="457" style="重要提示黄"/>
			  <Label text="关卡挑战次数：" autoSize="left" x="44" y="483" style="普通说明" var="txt_tip"/>
			  <Label text="\l30120019 " autoSize="left" x="43" y="502" style="普通说明"/>
			  <Image skin="png.a5.commonImgs.img_diamond" x="28" y="487"/>
			  <Image skin="png.a5.commonImgs.img_diamond" x="28" y="506"/>
			  <Box x="112" y="455" language="de" lgx="112,112,112,196,196,196,196,196,196,196" lgy="455,455,455,455,455,455,455,455">
			    <Label text="222/52" autoSize="none" y="2" style="普通说明" width="50" height="20" var="txt_cnt"/>
			    <Button skin="png.a5.comps.numBars.btn_plus" x="45" stateNum="1" var="btn_addCnt"/>
			  </Box>
			</PanelView>;
       
      
      public var list_map:List = null;
      
      public var txt_title:Label = null;
      
      public var box_heroAwakenShop:Box = null;
      
      public var btn_heroAwakenShop:Button = null;
      
      public var txt_name:Label = null;
      
      public var ui_top:game.ui.heroAwakenRoad.HeroAwakenRoadRewardViwUI = null;
      
      public var txt_tip:Label = null;
      
      public var txt_cnt:Label = null;
      
      public var btn_addCnt:Button = null;
      
      public function HeroAwakenMapContentUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.heroAwakenRoad.HeroAwakenChapterRenderUI"] = HeroAwakenChapterRenderUI;
         viewClassMap["game.ui.heroAwakenRoad.HeroAwakenRoadRewardViwUI"] = game.ui.heroAwakenRoad.HeroAwakenRoadRewardViwUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
