package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class NpcGroupRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="200" height="40">
			  <Image skin="png.a5.commonImgs.选中效果（小）" x="25" y="-7" var="img_selected"/>
			  <Image skin="png.comp.image" x="25" y="17" anchorX=".5" anchorY=".5" var="img_icon" scaleX=".7" scaleY=".7" smoothing="true"/>
			  <Label text="阵容" autoSize="none" x="55" y="8.5" bold="false" var="txt_des" align="left" width="136" height="25" isHtml="true" style="内容数字" lgx="55,55,55,55,55,55,55,50" lgy="8.5,8.5,8.5,8.5,8.5,8.5,8.5,8.5" language="ru"/>
			</View>;
       
      
      public var img_selected:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_des:Label = null;
      
      public function NpcGroupRenderUI()
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
