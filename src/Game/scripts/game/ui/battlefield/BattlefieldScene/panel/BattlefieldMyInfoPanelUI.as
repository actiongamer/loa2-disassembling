package game.ui.battlefield.BattlefieldScene.panel
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RuleDescriptionUI;
   
   public class BattlefieldMyInfoPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="185" height="144" mouseEnabled="false">
			  <Image skin="png.uiBattlefieldScenes.battlefieldSceneModule.img_situationBg" x="5" y="0" width="175" height="144"/>
			  <Label text="\l50500066" autoSize="none" x="40.5" y="5" style="加底标题" width="104" align="center" size="14"/>
			  <Label text="击杀数" autoSize="none" x="63.5" y="27" style="普通说明" width="254" align="left" height="20" var="txt_killed"/>
			  <Label text="助攻数" autoSize="none" x="63.5" y="47" style="普通说明" width="254" align="left" height="20" var="txt_assisted"/>
			  <Label text="采矿数" autoSize="none" x="63.5" y="65" style="普通说明" width="254" align="left" height="20" var="txt_gathered"/>
			  <Label text="荣誉点" autoSize="none" x="63.5" y="83" style="普通说明" width="254" align="left" height="20" var="txt_honor"/>
			  <RuleDescription x="11" y="-39" var="rule_desc" mouseChildren="false" runtime="game.ui.commons.comps.others.RuleDescriptionUI"/>
			</View>;
       
      
      public var txt_killed:Label = null;
      
      public var txt_assisted:Label = null;
      
      public var txt_gathered:Label = null;
      
      public var txt_honor:Label = null;
      
      public var rule_desc:RuleDescriptionUI = null;
      
      public function BattlefieldMyInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RuleDescriptionUI"] = RuleDescriptionUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
