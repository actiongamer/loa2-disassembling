package game.ui.commons.comps.pageBars
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PageBarS1UI extends View
   {
      
      protected static var uiView:XML = <View width="93" height="25">
			  <Button label="" stateNum="1" buttonMode="true" skin="png.a5.comps.pageBars.btn_page_next2" x="68" y="1.5" var="btn_next"/>
			  <Button label="" stateNum="1" buttonMode="true" skin="png.a5.comps.pageBars.btn_page_prev2" x="0" y="1.5" var="btn_prev"/>
			  <Image skin="png.a5.comps.pageBars.img_pageNumBg1" x="24" y="0.5" var="img_pageNumBg"/>
			  <Label text="99/99" x="19" y="3" var="txt_pageNum" align="center" width="51" style="普通说明" autoSize="none" height="18"/>
			</View>;
       
      
      public var btn_next:Button = null;
      
      public var btn_prev:Button = null;
      
      public var img_pageNumBg:Image = null;
      
      public var txt_pageNum:Label = null;
      
      public function PageBarS1UI()
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
