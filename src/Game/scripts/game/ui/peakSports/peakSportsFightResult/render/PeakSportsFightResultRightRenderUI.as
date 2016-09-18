package game.ui.peakSports.peakSportsFightResult.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import morn.core.components.List;
   import game.ui.commons.props.FightValueBoxS4UI;
   
   public class PeakSportsFightResultRightRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="400" height="550">
			  <Image skin="png.uiPeakSports.img_bg2" x="185" y="97" anchorX="0.5" anchorY="0.5" var="img_bg" scaleX="-1"/>
			  <Label text="游族联运.S1232.名字六个字啊" autoSize="none" x="106" y="47" style="普通说明" var="txt_name" height="20" align="right" width="154"/>
			  <Label text="lv.123" autoSize="none" x="60" y="47" style="普通说明" var="txt_level" width="44" align="right" height="20"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S11" x="260" y="66" sizeGrid="5,0,18,0" var="progressBar_hp" scaleX="-1"/>
			  <Label text="80%" autoSize="none" x="113" y="69" style="普通说明" var="txt_progressValue" width="92" align="center" size="14"/>
			  <Image skin="png.uiPeakSports.img_fightBg2" x="138" y="122" anchorX="0.5" anchorY="0.5" var="img_fightValueBg"/>
			  <List x="150" y="170" var="list_heroes">
			    <PeakSportsFightResultHeroRender x="124" y="0" name="item3" runtime="game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeroRenderUI"/>
			    <PeakSportsFightResultHeroRender x="124" y="125" name="item4" runtime="game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeroRenderUI"/>
			    <PeakSportsFightResultHeroRender x="124" y="248" name="item5" runtime="game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeroRenderUI"/>
			    <PeakSportsFightResultHeroRender x="0" y="0" name="item0" runtime="game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeroRenderUI"/>
			    <PeakSportsFightResultHeroRender x="0" y="124" name="item1" runtime="game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeroRenderUI"/>
			    <PeakSportsFightResultHeroRender x="0" y="248" name="item2" runtime="game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeroRenderUI"/>
			  </List>
			  <FightValueBoxS4 x="95" y="110" var="fight_value" runtime="game.ui.commons.props.FightValueBoxS4UI"/>
			  <Image skin="png.a5.comps.img_block" x="361" y="120" width="35" height="36" var="buff_icon" mouseChildren="true"/>
			  <PeakSportsFightResultHeadRender x="296" y="45" var="headRender" runtime="game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeadRenderUI"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_level:Label = null;
      
      public var progressBar_hp:ProgressBar = null;
      
      public var txt_progressValue:Label = null;
      
      public var img_fightValueBg:Image = null;
      
      public var list_heroes:List = null;
      
      public var fight_value:FightValueBoxS4UI = null;
      
      public var buff_icon:Image = null;
      
      public var headRender:game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeadRenderUI = null;
      
      public function PeakSportsFightResultRightRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.FightValueBoxS4UI"] = FightValueBoxS4UI;
         viewClassMap["game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeadRenderUI"] = game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeadRenderUI;
         viewClassMap["game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeroRenderUI"] = PeakSportsFightResultHeroRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
