package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class TooltipIconAndName_equipUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="98">
			  <Label text="名称" autoSize="none" x="82" y="0" bold="false" size="14" var="txt_name" align="left" style="随品质变化" width="120" multiline="true" wordWrap="true"/>
			  <Label text="类型" autoSize="none" x="147" y="0" bold="false" var="txt_kind" size="12" width="149" align="right" style="普通说明" height="20"/>
			  <Label text="\l10220009\l" autoSize="none" y="33" bold="false" size="12" var="txt_equiped" align="left" right="4" style="普通绿色" language="en" lgy="48,33"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS2_2" x="10" y="0" var="img_quality"/>
			  <Image skin="png.a5.comps.img_block" x="39" y="49" width="57" height="98" var="img_icon" anchorX="0.5" anchorY="0.5" autoSize="true"/>
			  <FightValueBox x="82" y="30" var="fightValueBox" language="en" lgx="82,82" lgy="45,30" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <List x="79" y="64" repeatX="3" var="list_stars" scale="0.75" language="en" lgx="79,79" lgy="74,64">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_kind:Label = null;
      
      public var txt_equiped:Label = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var fightValueBox:FightValueBoxUI = null;
      
      public var list_stars:List = null;
      
      public function TooltipIconAndName_equipUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.EquipStarRenderUI"] = EquipStarRenderUI;
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
