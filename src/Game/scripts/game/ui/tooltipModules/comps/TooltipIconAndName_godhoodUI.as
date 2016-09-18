package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TooltipIconAndName_godhoodUI extends View
   {
      
      protected static var uiView:XML = <View width="320" height="61">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="10" y="0" var="img_quality" width="58" height="58" sizeGrid="8,8,8,8"/>
			  <Image skin="png.a5.comps.img_block" x="13" y="3" width="52" height="52" var="img_icon"/>
			  <Label text="名称" autoSize="none" x="80" y="-1" bold="false" var="txt_name" align="left" width="182" style="随品质变化"/>
			  <Label text="类型" autoSize="none" x="211" y="-1" bold="false" var="txt_kind" width="81" align="right" isHtml="true" style="普通说明" height="20"/>
			  <Label text="名称" autoSize="none" x="80" y="19" bold="false" var="txt_has" align="left" width="182" style="普通说明"/>
			  <Label text="名称" autoSize="none" x="80" y="38" bold="false" var="txt_needCnt" align="left" width="182" style="普通说明"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_kind:Label = null;
      
      public var txt_has:Label = null;
      
      public var txt_needCnt:Label = null;
      
      public function TooltipIconAndName_godhoodUI()
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
