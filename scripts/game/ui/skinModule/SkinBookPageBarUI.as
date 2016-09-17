package game.ui.skinModule
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class SkinBookPageBarUI extends View
   {
      
      protected static var uiView:XML = <View width="36" height="463">
			  <Button skin="png.uiSkin.img_uparrow" x="0" y="0" var="btn_up" stateNum="1"/>
			  <Button skin="png.uiSkin.img_downarrow" y="444" x="0" var="btn_down" stateNum="1"/>
			</View>;
       
      
      public var btn_up:Button = null;
      
      public var btn_down:Button = null;
      
      public function SkinBookPageBarUI()
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
