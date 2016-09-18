package game.ui.friendModules.mains
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class FriendListTileRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="320" height="23">
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="0" y="0" width="320" height="23" var="g_bg"/>
			  <Label text="[0/0]" autoSize="none" x="233" width="72" height="18" var="txt_count" style="普通说明" y="1" align="right"/>
			  <Label text="人名" autoSize="left" x="24" width="240" height="18" var="txt_name" style="人名1不随品质变化" y="1"/>
			  <Image skin="png.uiFriend.mains.箭头" x="18" y="9" anchorX="0.5" anchorY="0.5" var="img_arrow" width="14" height="9"/>
			  <Image skin="png.uiFriend.分割线" x="10" y="18" width="300"/>
			</View>;
       
      
      public var g_bg:GRect = null;
      
      public var txt_count:Label = null;
      
      public var txt_name:Label = null;
      
      public var img_arrow:Image = null;
      
      public function FriendListTileRenderUI()
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
