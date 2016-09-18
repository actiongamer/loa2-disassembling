package game.ui.miniMaps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Clip;
   
   public class MiniMapLineRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="103" height="20">
			  <Image skin="png.a5.bgs.tooltipBgs.img_tipMenuSelectBoxBg" y="0" sizeGrid="8,8,8,8" x="15" width="88" height="20" name="selectBox0"/>
			  <Label text="当前路线: 6线" autoSize="left" x="16" var="txt_line" style="内容数字" y="2"/>
			  <Clip skin="png.uiMiniMap.clip_point" x="1" y="3" clipHeight="13" index="1" var="img_icon"/>
			</View>;
       
      
      public var txt_line:Label = null;
      
      public var img_icon:Clip = null;
      
      public function MiniMapLineRenderUI()
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
