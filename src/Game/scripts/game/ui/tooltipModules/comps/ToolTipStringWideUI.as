package game.ui.tooltipModules.comps
{
   import morn.customs.components.FadeView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ToolTipStringWideUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="360" height="400">
			  <Image skin="png.a5.bgs.tooltipBgs.img_tooltipBgS1_1" sizeGrid="20,20,20,20" var="img_bg" left="0" right="0" top="0" bottom="0"/>
			  <Label text="段落内容一般文字文字段落内容一般文字文字段落内容一般文字文字段落内容一般文字文字段落内容一般文字文字段落内容一般文字文字段落内容一般文字文字段落内容一般文字文字" autoSize="left" x="15" y="25" multiline="true" wordWrap="true" width="329" var="txt_content" leading="6" letterSpacing="1" style="普通说明"/>
			</FadeView>;
       
      
      public var img_bg:Image = null;
      
      public var txt_content:Label = null;
      
      public function ToolTipStringWideUI()
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
