package game.ui.horseModules.horseMaster
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class HorsePropNextRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="106" height="18">
			  <Label autoSize="left" x="0" width="40" stroke="0x0" var="txt_value" style="普通绿色" align="left" text="999" height="18" y="0" lgx="100,66" lgy="0,0" language="en"/>
			  <Label text="全队生命:" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" autoSize="none" x="2" letterSpacing="1" height="18" align="left" style="普通说明" language="en" lgx="-12,2" lgy="0,0"/>
			  <Image skin="png.a5.commonImgs.img_arrowupS1" x="0" y="0" var="arrowUp" lgx="143,105" lgy="2,2" width="8" height="13" language="en"/>
			  <Image skin="png.a5.commonImgs.角色-属性条" x="5.5" y="17"/>
			</NpcPropRender>;
       
      
      public var txt_value:Label = null;
      
      public var txt_name:Label = null;
      
      public var arrowUp:Image = null;
      
      public function HorsePropNextRenderUI()
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
