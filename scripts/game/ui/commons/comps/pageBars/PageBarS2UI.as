package game.ui.commons.comps.pageBars
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PageBarS2UI extends View
   {
      
      protected static var uiView:XML = <View width="140" height="25">
			  <Button label="" stateNum="1" buttonMode="true" skin="png.a5.comps.pageBars.btn_page_next2" x="95" y="2.5" var="btn_next"/>
			  <Button label="" stateNum="1" buttonMode="true" skin="png.a5.comps.pageBars.btn_page_prev2" x="25" y="2.5" var="btn_prev"/>
			  <Image skin="png.a5.comps.pageBars.img_pageNumBg1" x="50" y="1.5" var="img_pageNumBg"/>
			  <Label text="99/99" autoSize="none" x="45" y="4" var="txt_pageNum" align="center" width="52" style="普通说明" height="16"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.comps.pageBars.btn_page_first2" x="0" y="2.5" var="btn_first"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.comps.pageBars.btn_page_last2" x="120" y="2.5" var="btn_last"/>
			</View>;
       
      
      public var btn_next:Button = null;
      
      public var btn_prev:Button = null;
      
      public var img_pageNumBg:Image = null;
      
      public var txt_pageNum:Label = null;
      
      public var btn_first:Button = null;
      
      public var btn_last:Button = null;
      
      public function PageBarS2UI()
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
