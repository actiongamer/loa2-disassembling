package game.ui.roleInfos.equipPanels
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class YuanFenRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="75" height="18">
			  <Image skin="png.a5.commonImgs.img_dot" x="0" y="1.5" var="img_dot" disabled="false"/>
			  <Label text="上兵伐谋" autoSize="left" x="13" y="-1" height="18" var="txt_name" style="重要提示橘黄"/>
			</View>;
       
      
      public var img_dot:Image = null;
      
      public var txt_name:Label = null;
      
      public function YuanFenRenderUI()
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
