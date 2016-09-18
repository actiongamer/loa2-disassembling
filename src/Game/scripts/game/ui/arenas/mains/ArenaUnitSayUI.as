package game.ui.arenas.mains
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ArenaUnitSayUI extends View
   {
      
      protected static var uiView:XML = <View width="160" height="70">
			  <Image skin="png.a5.commonImgs.气泡" x="0" y="0" sizeGrid="10,10,60,40" width="157" height="69" var="bgImage"/>
			  <Label text="小标题小标题小标题小标题小标题小标题小标" autoSize="none" x="4" y="5" style="小标题" width="142" multiline="true" wordWrap="true" align="center" var="txt_content"/>
			</View>;
       
      
      public var bgImage:Image = null;
      
      public var txt_content:Label = null;
      
      public function ArenaUnitSayUI()
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
