package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class NpcCarrerTypeRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="412" height="40">
			  <Image skin="png.a5.commonImgs.选中底" x="23" y="-6" var="img_selected"/>
			  <Image skin="png.comp.image" x="25" y="17" anchorX=".5" anchorY=".5" var="img_icon"/>
			  <Label text="阵容" autoSize="none" x="52" y="9" bold="false" var="txt_type" align="left" width="93" height="25" isHtml="true" style="普通说明"/>
			  <Label text="阵容" autoSize="none" x="124" y="9" bold="false" var="txt_des" align="left" width="275" height="25" isHtml="true" style="普通说明" lgx="124,124,124,124,124,124,124,129" language="ru" lgy="9,9,9,9,9,9,9,9"/>
			</View>;
       
      
      public var img_selected:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_type:Label = null;
      
      public var txt_des:Label = null;
      
      public function NpcCarrerTypeRenderUI()
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
