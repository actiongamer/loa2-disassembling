package game.ui.battlefield.BattlefieldFightResult.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import morn.core.components.List;
   import game.ui.commons.props.FightValueBoxS4UI;
   
   public class BattlefieldFightResultRightRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="400" height="550">
			  <Image skin="png.uiBattlefieldScenes.battlefieldFightResultModule.img_bg2" x="185" y="97" anchorX="0.5" anchorY="0.5" var="img_bg" scaleX="-1"/>
			  <Label text="游族联运.S1232.名字六个字啊" autoSize="none" x="106" y="47" style="普通说明" var="txt_name" height="20" align="right" width="154"/>
			  <Label text="lv.123" autoSize="none" x="60" y="47" style="普通说明" var="txt_level" width="44" align="right" height="20"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S11" x="260" y="66" sizeGrid="5,0,18,0" var="progressBar_hp" scaleX="-1"/>
			  <Label text="80%" autoSize="none" x="113" y="69" style="普通说明" var="txt_progressValue" width="92" align="center" size="14"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldFightResultModule.img_fightBg2" x="138" y="122" anchorX="0.5" anchorY="0.5" var="img_fightValueBg"/>
			  <List x="127" y="170" var="list_heroes">
			    <BattlefieldFightResultHeroRender y="0" name="item3" x="100" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="125" name="item4" x="100" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="124" name="item1" x="0" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="250" name="item2" x="0" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender name="item0" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="250" name="item5" x="100" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="124" name="item7" x="200" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="0" name="item6" x="200" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="250" name="item8" x="200" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			  </List>
			  <FightValueBoxS4 x="95" y="110" var="fight_value" runtime="game.ui.commons.props.FightValueBoxS4UI"/>
			  <BattlefieldFightResultHeadRender x="295" y="45" right="20" var="headRender" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeadRenderUI"/>
			  <Image skin="png.a5.comps.img_block" x="361" y="120" width="35" height="36" var="buff_icon" mouseChildren="true"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_level:Label = null;
      
      public var progressBar_hp:ProgressBar = null;
      
      public var txt_progressValue:Label = null;
      
      public var img_fightValueBg:Image = null;
      
      public var list_heroes:List = null;
      
      public var fight_value:FightValueBoxS4UI = null;
      
      public var headRender:game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeadRenderUI = null;
      
      public var buff_icon:Image = null;
      
      public function BattlefieldFightResultRightRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeadRenderUI"] = game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeadRenderUI;
         viewClassMap["game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"] = BattlefieldFightResultHeroRenderUI;
         viewClassMap["game.ui.commons.props.FightValueBoxS4UI"] = FightValueBoxS4UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
