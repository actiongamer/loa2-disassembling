package game.ui.miniMaps
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Image;
   
   public class MiniMapBtnUI extends View
   {
      
      protected static var uiView:XML = <View width="24" height="24">
			  <Button stateNum="3" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.uiMiniMap.btn_bg" var="btn_bg" width="24" height="24"/>
			  <Image skin="png.a5.comps.img_block" x="12" y="12" anchorX="0.5" anchorY="0.5" autoSize="true" var="img_icon" width="24" height="24"/>
			</View>;
       
      
      public var btn_bg:Button = null;
      
      public var img_icon:Image = null;
      
      public function MiniMapBtnUI()
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
