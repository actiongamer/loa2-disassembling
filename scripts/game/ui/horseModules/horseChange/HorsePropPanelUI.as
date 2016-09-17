package game.ui.horseModules.horseChange
{
   import morn.customs.components.FadeView;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.SkillRenderS2UI;
   import game.ui.horseModules.comps.HorsePropRenderPropUI;
   
   public class HorsePropPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="115" height="256" var="horse_aura">
			  <Image skin="png.uiHorse.changeHorse.黄光" x="-2.5" y="82"/>
			  <Image skin="png.uiHorse.changeHorse.透明底03" x="0" y="0"/>
			  <Image skin="png.uiHorse.changeHorse.黄光" x="-2.5" y="8"/>
			  <Label text="\l30300001" autoSize="none" x="-10" y="88" style="普通说明暗色深" width="142" height="18" align="center" var="txt_titleProp"/>
			  <Label text="\l30300002" autoSize="none" x="-13" y="14" style="普通说明暗色深" width="142" height="18" align="center" var="txt_titleSkill"/>
			  <List x="6" y="119" repeatY="5" var="list_playerProp">
			    <HorsePropRenderProp name="render" runtime="game.ui.horseModules.comps.HorsePropRenderPropUI"/>
			  </List>
			  <SkillRenderS2 x="31" y="34" var="icon_skill" runtime="game.ui.commons.icons.SkillRenderS2UI"/>
			  <Label text="未激活" autoSize="none" x="8" y="226" style="随品质变化" width="99" height="24" align="center" var="txt_state" size="14"/>
			</FadeView>;
       
      
      public var horse_aura:FadeView = null;
      
      public var txt_titleProp:Label = null;
      
      public var txt_titleSkill:Label = null;
      
      public var list_playerProp:List = null;
      
      public var icon_skill:SkillRenderS2UI = null;
      
      public var txt_state:Label = null;
      
      public function HorsePropPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.SkillRenderS2UI"] = SkillRenderS2UI;
         viewClassMap["game.ui.horseModules.comps.HorsePropRenderPropUI"] = HorsePropRenderPropUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
