package game.ui.position
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class PositionLockRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="179" height="104">
			  <Label text="xx级开放" autoSize="none" x="22" y="71" style="内容数字" width="135" height="24" align="center" size="14" var="txt_prompt" bold="false"/>
			  <Image skin="png.uiPosition.布阵锁" x="73.5" y="33" var="img_icon"/>
			</View>;
       
      
      public var txt_prompt:Label = null;
      
      public var img_icon:Image = null;
      
      public function PositionLockRenderUI()
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
