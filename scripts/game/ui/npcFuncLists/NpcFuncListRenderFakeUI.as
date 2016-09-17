package game.ui.npcFuncLists
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   
   public class NpcFuncListRenderFakeUI extends View
   {
      
      protected static var uiView:XML = <View width="330" height="90">
			  <GRect fillAlpha="0.5" radius="12,12,12,12" lineAlpha="0.8" x="1" var="img_icon_mask" width="330" height="90" lineThickness="4" lineColor="0x9900FF"/>
			</View>;
       
      
      public var img_icon_mask:GRect = null;
      
      public function NpcFuncListRenderFakeUI()
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
