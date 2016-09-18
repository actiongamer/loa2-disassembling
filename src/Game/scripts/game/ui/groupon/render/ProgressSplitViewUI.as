package game.ui.groupon.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ProgressSplitViewUI extends View
   {
      
      protected static var uiView:XML = <View width="1" height="53">
			  <Image skin="png.uiGroupon.split" x="-5.5" y="14" centerX="0" var="img_split"/>
			  <Label text="1000人" autoSize="none" style="加底标题" align="center" width="54" height="20" centerX="0" var="txt_cnt" x="-26.5" y="-3"/>
			  <Label text="7折" autoSize="none" y="43" style="渐变1" align="center" width="112" height="20" centerX="0" x="-55.5" var="txt_rate" size="16"/>
			</View>;
       
      
      public var img_split:Image = null;
      
      public var txt_cnt:Label = null;
      
      public var txt_rate:Label = null;
      
      public function ProgressSplitViewUI()
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
