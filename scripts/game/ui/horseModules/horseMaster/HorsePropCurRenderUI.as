package game.ui.horseModules.horseMaster
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class HorsePropCurRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="106" height="18">
			  <Label autoSize="left" x="70" width="40" stroke="0x0" var="txt_value" style="普通说明" align="left" text="999" height="18" language="en" lgx="90,70"/>
			  <Label text="全队生命:" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" autoSize="none" x="2" letterSpacing="1" height="18" align="left" style="普通说明" language="en" lgx="-20,2" lgy="0,0"/>
			  <Image skin="png.a5.commonImgs.角色-属性条" x="5.5" y="17"/>
			</NpcPropRender>;
       
      
      public var txt_value:Label = null;
      
      public var txt_name:Label = null;
      
      public function HorsePropCurRenderUI()
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
