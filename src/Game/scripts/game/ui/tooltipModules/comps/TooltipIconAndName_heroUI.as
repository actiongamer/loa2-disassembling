package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.props.FightValueBoxUI;
   
   public class TooltipIconAndName_heroUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="62">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="15" y="-1" var="img_quality" width="58" height="58" sizeGrid="8,8,8,8"/>
			  <Image skin="png.a5.comps.img_block" x="18" y="2" width="52" height="52" var="img_icon"/>
			  <Label text="名称" autoSize="none" x="79" y="-2" bold="false" size="14" var="txt_name" align="left" width="174" style="随品质变化" multiline="true" wordWrap="true"/>
			  <Label text="类型" autoSize="none" x="231" y="33" bold="false" var="txt_kind" size="12" width="62" align="right" isHtml="true" style="普通说明"/>
			  <FightValueBox x="80" y="32" var="fightValueBox" language="en" lgx="80,80" lgy="42,32" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <Image skin="png.a5.comps.img_block" x="234" y="14" width="52" height="52" var="img_group" anchorX="0.5" anchorY="0.5" autoSize="true"/>
			  <Label autoSize="none" x="250" y="1" bold="false" size="12" width="90" align="left" isHtml="true" style="普通说明" var="txt_group" multiline="true" wordWrap="true"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_kind:Label = null;
      
      public var fightValueBox:FightValueBoxUI = null;
      
      public var img_group:Image = null;
      
      public var txt_group:Label = null;
      
      public function TooltipIconAndName_heroUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
