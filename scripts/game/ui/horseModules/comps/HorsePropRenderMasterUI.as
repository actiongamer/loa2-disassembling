package game.ui.horseModules.comps
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class HorsePropRenderMasterUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="109" height="18">
			  <Label text="999999" autoSize="left" x="60" y="0" color="0xffcc00" width="49" height="18" var="txt_value" style="下划线黄色" language="en" lgx="95,60" lgy="0,0"/>
			  <Label text="攻击攻击:" autoSize="left" x="0" y="0" height="18" var="txt_name" style="普通说明"/>
			</NpcPropRender>;
       
      
      public var txt_value:Label = null;
      
      public var txt_name:Label = null;
      
      public function HorsePropRenderMasterUI()
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
