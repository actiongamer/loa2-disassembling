package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class ToolTipHeroInfoDetailPropUI extends View
   {
      
      protected static var uiView:XML = <View width="330" height="20">
			  <Label text="属性名称:" bold="false" var="txt_title2" style="普通说明" autoSize="left" align="left" x="168" y="2" isHtml="true"/>
			  <Label text="属性名称:" bold="false" var="txt_title" style="普通说明" autoSize="left" align="left" x="36" y="2" isHtml="true"/>
			  <Label text="value" bold="false" var="txt_value2" style="普通说明" autoSize="left" align="left" x="228" y="2" isHtml="true"/>
			  <Label text="value" bold="false" var="txt_value" style="普通说明" autoSize="left" align="left" x="96" y="2" isHtml="true"/>
			</View>;
       
      
      public var txt_title2:Label = null;
      
      public var txt_title:Label = null;
      
      public var txt_value2:Label = null;
      
      public var txt_value:Label = null;
      
      public function ToolTipHeroInfoDetailPropUI()
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
