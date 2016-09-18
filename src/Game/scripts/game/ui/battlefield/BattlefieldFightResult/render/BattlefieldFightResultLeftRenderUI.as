package game.ui.battlefield.BattlefieldFightResult.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.List;
   
   public class BattlefieldFightResultLeftRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="400" height="550">
			  <Image skin="png.uiBattlefieldScenes.battlefieldFightResultModule.img_bg1" x="217" y="97" anchorX="0.5" anchorY="0.5" var="img_bg"/>
			  <Label text="普通说明普通说明普通说明" autoSize="none" x="145" y="47" style="普通说明" var="txt_name" width="154" align="left" height="20"/>
			  <Label text="Lv.123" autoSize="none" x="300" y="47" style="普通说明" var="txt_level" width="58" align="left" height="20"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S11" x="144" y="67" sizeGrid="5,0,18,0" var="progressBar_hp"/>
			  <Label text="80%" autoSize="none" x="191" y="70" style="普通说明" var="txt_progressValue" width="92" align="center" size="14"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldFightResultModule.img_fightBg1" x="268" y="123" anchorX="0.5" anchorY="0.5" var="img_fightValueBg"/>
			  <FightValueBox x="191" y="110" var="fight_value" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <List x="2" y="170" var="list_heroes">
			    <BattlefieldFightResultHeroRender name="item3" x="100" y="0" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="125" name="item4" x="100" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender x="200" y="125" name="item1" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender x="200" y="250" name="item2" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender x="200" name="item0" y="0" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="250" name="item5" x="100" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="0" name="item6" x="0" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="125" name="item7" x="0" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			    <BattlefieldFightResultHeroRender y="242" name="item8" x="1" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"/>
			  </List>
			  <BattlefieldFightResultHeadRender x="22" y="45" left="22" var="headRender" runtime="game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeadRenderUI"/>
			  <Image skin="png.a5.comps.img_block" x="5" y="120" width="35" height="36" var="buff_icon" mouseChildren="true"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_level:Label = null;
      
      public var progressBar_hp:ProgressBar = null;
      
      public var txt_progressValue:Label = null;
      
      public var img_fightValueBg:Image = null;
      
      public var fight_value:FightValueBoxUI = null;
      
      public var list_heroes:List = null;
      
      public var headRender:game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeadRenderUI = null;
      
      public var buff_icon:Image = null;
      
      public function BattlefieldFightResultLeftRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeadRenderUI"] = game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeadRenderUI;
         viewClassMap["game.ui.battlefield.BattlefieldFightResult.render.BattlefieldFightResultHeroRenderUI"] = BattlefieldFightResultHeroRenderUI;
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
