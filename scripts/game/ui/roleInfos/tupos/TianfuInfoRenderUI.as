package game.ui.roleInfos.tupos
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TianfuInfoRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="250" height="20">
			  <Image skin="png.a5.commonImgs.img_dot" x="5" y="3" var="img_icon"/>
			  <Label text="重要信息文字" autoSize="left" x="21" y="1" var="txt_name" style="升级后加底标题" multiline="false" wordWrap="false"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public function TianfuInfoRenderUI()
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
