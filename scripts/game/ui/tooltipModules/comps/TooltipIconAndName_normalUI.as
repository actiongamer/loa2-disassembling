package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TooltipIconAndName_normalUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="62">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="12" y="0" var="img_quality" width="58" height="58" sizeGrid="8,8,8,8"/>
			  <Image skin="png.a5.comps.img_block" x="15" y="3" width="52" height="52" var="img_icon"/>
			  <Label text="名称" autoSize="none" x="82" y="0" bold="false" size="14" var="txt_name" align="left" width="120" style="随品质变化" multiline="true" wordWrap="true"/>
			  <Label text="类型" autoSize="none" x="166" y="0" bold="false" var="txt_kind" size="12" width="130" align="right" isHtml="true" style="普通说明" height="20"/>
			  <Label text="使用等级" autoSize="none" x="82" y="28" bold="false" size="12" var="txt2" align="left" width="182" height="25" style="不足禁止红" language="en" lgx="82,82" lgy="38,28"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_kind:Label = null;
      
      public var txt2:Label = null;
      
      public function TooltipIconAndName_normalUI()
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
