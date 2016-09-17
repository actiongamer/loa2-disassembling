package game.ui.horseModules.comps
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class HorsePropRenderPlayerUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="109" height="18">
			  <Label text="9999" autoSize="left" x="60" y="0" width="49" height="18" var="txt_value" style="普通说明" language="en" lgx="97,60" lgy="0,0"/>
			  <Label text="攻击攻击:" autoSize="left" x="0" y="0" height="18" var="txt_name" style="普通说明"/>
			  <Image skin="png.a5.commonImgs.img_arrowupS1" x="95" y="1" var="img_arrow" language="en" lgx="143,95" lgy="1,1"/>
			</NpcPropRender>;
       
      
      public var txt_value:Label = null;
      
      public var txt_name:Label = null;
      
      public var img_arrow:Image = null;
      
      public function HorsePropRenderPlayerUI()
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
