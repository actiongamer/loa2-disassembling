package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TooltipIconAndName_horseUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="70">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="11" y="2" var="img_quality" width="58" height="58" sizeGrid="8,8,8,8" scale="1.1"/>
			  <Image skin="png.a5.comps.img_block" x="14" y="5" width="52" height="52" var="img_icon" scale="1.1"/>
			  <Label text="名称" autoSize="none" x="81" y="2" bold="false" var="txt_name" align="left" width="182" height="25" style="随品质变化" size="15"/>
			  <Label text="等级" autoSize="none" y="38" bold="false" align="left" style="重要提示橘黄" x="83" var="txt_state" size="14"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_state:Label = null;
      
      public function TooltipIconAndName_horseUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
