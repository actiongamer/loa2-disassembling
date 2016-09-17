package game.ui.noticeModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class NoticeTypeBarUI extends View
   {
      
      protected static var uiView:XML = <View width="344" height="34">
			  <Image skin="png.uiNotice.标题渐变底" x="0" y="0"/>
			  <Label text="二级框标题" autoSize="none" x="46" y="5" style="二级框标题" width="262" height="22" var="txt_name"/>
			  <Image skin="png.a5.commonImgs.新获得" x="11" y="8" var="img_icon"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var img_icon:Image = null;
      
      public function NoticeTypeBarUI()
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
