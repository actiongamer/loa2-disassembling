package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.props.FightValueBoxUI;
   
   public class TooltipIconAndName_playerUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="70">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="11" y="2" var="img_quality" width="58" height="58" sizeGrid="8,8,8,8" scale="1.1"/>
			  <Image skin="png.a5.comps.img_block" x="14" y="5" width="52" height="52" var="img_icon" scale="1.1"/>
			  <Label text="名称" autoSize="none" x="81" y="2" bold="false" var="txt_name" align="left" width="182" height="25" style="随品质变化" size="15"/>
			  <FightValueBox x="82" y="47" var="fightValueBox" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <Label text="等级" autoSize="none" y="25" bold="false" align="left" style="重要提示橘黄" x="82" var="txt_name2"/>
			  <Label text="VALUE" autoSize="left" x="117" bold="false" var="txt_value" align="left" style="重要提示橘黄" y="26"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var fightValueBox:FightValueBoxUI = null;
      
      public var txt_name2:Label = null;
      
      public var txt_value:Label = null;
      
      public function TooltipIconAndName_playerUI()
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
