package game.ui.heroAwakenRoad
{
   import morn.customs.components.PanelView;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Image;
   import game.ui.commons.icons.LotteryRenderS3UI;
   
   public class HeroAwakenMonsterInfoPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="414" height="411">
			  <Box x="0" var="box_main">
			    <PanelBgS3 width="404" height="409" panelDragEnabled="true" x="0" y="0" frameStyle="2"/>
			    <Image skin="png.uiHeroAwakenRoad.img_infoBg" x="11" y="33"/>
			    <Label text="\l40400003" x="31" y="177" align="left" width="126" height="18" style="普通说明" var="txt_clear"/>
			    <Label x="96" y="49" align="left" width="284" height="53" wordWrap="true" var="txt_des" bold="false" style="重要提示橘黄"/>
			    <Box x="53" y="349" var="box_canFight">
			      <Button label="\l40400014" stateNum="1" buttonMode="true" var="btn_saoDangTen" style="按钮小黄" x="89" y="7" labelMargin="-10,-10,-10,-10"/>
			      <Button stateNum="1" buttonMode="true" var="btn_fight" x="179" style="按钮大绿" label="\l30121025"/>
			      <Button label="\l40400014" stateNum="1" buttonMode="true" var="btn_saoDangOnce" style="按钮小黄" y="7"/>
			      <Button label="\l40400016" stateNum="1" buttonMode="true" var="btn_stop" style="按钮大黄" x="86" y="0"/>
			    </Box>
			    <Label text="\l40400004" x="34" y="233" align="left" width="97" height="18" style="普通说明" var="txt_drops"/>
			    <List x="125" y="222" repeatX="4" spaceX="8" var="list_item">
			      <HeroAwakenItemRender x="0" y="0" name="render" runtime="game.ui.heroAwakenRoad.HeroAwakenItemRenderUI"/>
			    </List>
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_4" x="26" y="48" var="img_quality" sizeGrid="6,6,6,6" width="60" height="60"/>
			    <Image skin="png.comp.image" x="28" y="50" var="img_icon" width="56" height="56"/>
			    <List x="28" y="94" repeatX="3" spaceX="-11" var="list_star" width="62" height="27">
			      <HeroAwakenStarRender name="render" scale="0.8" runtime="game.ui.heroAwakenRoad.HeroAwakenStarRenderUI"/>
			    </List>
			    <Box x="90" y="105" var="box_shousha">
			      <Button label="\l9040100" skin="png.a5.commonImgs.btn_buzhen" x="243" stateNum="1" labelMargin="2,11" var="btn_buzhen"/>
			      <Box var="box_shoushaExcBuzhen">
			        <Label text="\l40400042" width="121" height="18" style="普通说明" align="right" var="txt_shoushaDes" y="7"/>
			        <Label text="低调的优雅" autoSize="left" x="121" width="74" height="18" underline="false" style="随品质变化" var="txt_shoushaName" mouseChildren="true" isHtml="true" y="7"/>
			        <Button label="\l40710406" skin="png.a5.commonImgs.btn_video" x="197" stateNum="1" labelMargin="2,11" var="btn_video" y="0" width="36" height="36"/>
			      </Box>
			    </Box>
			    <Label text="来自深渊恶魔" width="110" mouseEnabled="true" var="txt_npcName" buttonMode="false" wordWrap="true" multiline="true" style="随品质变化" x="0" y="109" align="center"/>
			    <LotteryRenderS3 x="127" y="175" var="render_exp" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			    <Label text="推荐战力：" x="240" y="177" align="left" style="普通说明" var="txt_fightValue"/>
			  </Box>
			  <Label text="\l30120019 " autoSize="left" x="55" y="307" style="下划线黄色" width="294" height="19" align="center" var="txt_tip"/>
			</PanelView>;
       
      
      public var box_main:Box = null;
      
      public var txt_clear:Label = null;
      
      public var txt_des:Label = null;
      
      public var box_canFight:Box = null;
      
      public var btn_saoDangTen:Button = null;
      
      public var btn_fight:Button = null;
      
      public var btn_saoDangOnce:Button = null;
      
      public var btn_stop:Button = null;
      
      public var txt_drops:Label = null;
      
      public var list_item:List = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var list_star:List = null;
      
      public var box_shousha:Box = null;
      
      public var btn_buzhen:Button = null;
      
      public var box_shoushaExcBuzhen:Box = null;
      
      public var txt_shoushaDes:Label = null;
      
      public var txt_shoushaName:Label = null;
      
      public var btn_video:Button = null;
      
      public var txt_npcName:Label = null;
      
      public var render_exp:LotteryRenderS3UI = null;
      
      public var txt_fightValue:Label = null;
      
      public var txt_tip:Label = null;
      
      public function HeroAwakenMonsterInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.heroAwakenRoad.HeroAwakenItemRenderUI"] = HeroAwakenItemRenderUI;
         viewClassMap["game.ui.heroAwakenRoad.HeroAwakenStarRenderUI"] = HeroAwakenStarRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
