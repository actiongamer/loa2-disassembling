package game.ui.horseModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.props.FightValueBoxUI;
   import game.ui.commons.icons.SkillRenderS9UI;
   import game.ui.horseModules.comps.HorsePropRenderMasterUI;
   import game.ui.horseModules.comps.HorsePropRenderPlayerUI;
   
   public class HorseInfoPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="178" height="462" name="render">
			  <Image skin="png.a5.bgs.panelBgs.img_baseBgS2" x="0" y="0" sizeGrid="25,25,25,25" width="178" height="462"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="12" y="76"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="12" y="200"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="12" y="312"/>
			  <Label text="\l30300001" autoSize="none" x="17" y="79" style="普通说明暗色深" width="142" align="center" var="txt_titlePlayerProp"/>
			  <Label text="\l30300002" autoSize="none" x="18" y="203" style="普通说明暗色深" width="142" align="center" var="txt_titleSkill"/>
			  <Label text="\l30300003" autoSize="none" x="16" y="317" style="普通说明暗色深" width="142" height="18" align="center" var="txt_titleTeamProp"/>
			  <List x="34.5" y="109" repeatY="5" var="list_playerProp" language="en" lgx="24.5,34.5" lgy="109,109">
			    <HorsePropRenderPlayer name="render" runtime="game.ui.horseModules.comps.HorsePropRenderPlayerUI"/>
			  </List>
			  <List x="34.5" y="347" repeatY="5" var="list_teamProp" language="en" lgx="24.5,34.5" lgy="347,347">
			    <HorsePropRenderMaster name="render" runtime="game.ui.horseModules.comps.HorsePropRenderMasterUI"/>
			  </List>
			  <Image skin="png.uiHorse.changeHorse.战力底" x="-3" y="12"/>
			  <FightValueBox x="27" y="31" var="fightValueBoxRef" scale="1.1" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <SkillRenderS9 x="60.5" y="233" var="icon_skill" runtime="game.ui.commons.icons.SkillRenderS9UI"/>
			</View>;
       
      
      public var txt_titlePlayerProp:Label = null;
      
      public var txt_titleSkill:Label = null;
      
      public var txt_titleTeamProp:Label = null;
      
      public var list_playerProp:List = null;
      
      public var list_teamProp:List = null;
      
      public var fightValueBoxRef:FightValueBoxUI = null;
      
      public var icon_skill:SkillRenderS9UI = null;
      
      public function HorseInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.SkillRenderS9UI"] = SkillRenderS9UI;
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.horseModules.comps.HorsePropRenderMasterUI"] = HorsePropRenderMasterUI;
         viewClassMap["game.ui.horseModules.comps.HorsePropRenderPlayerUI"] = HorsePropRenderPlayerUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
