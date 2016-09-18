package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class ToolTipHeroInfoDetailTitle2UI extends View
   {
      
      protected static var uiView:XML = <View width="200" height="20">
			  <Label text="标题文字" autoSize="none" y="1" bold="false" var="txt_title" align="left" x="30" style="重要提示黄"/>
			  <Image skin="png.a5.prefabs.img_titlePoint" x="15" y="4"/>
			</View>;
       
      
      public var txt_title:Label = null;
      
      public function ToolTipHeroInfoDetailTitle2UI()
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
