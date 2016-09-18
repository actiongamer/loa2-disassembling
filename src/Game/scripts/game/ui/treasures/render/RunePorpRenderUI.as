package game.ui.treasures.render
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class RunePorpRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="99" height="20">
			  <Label text="当前强化：" autoSize="none" color="0xf9bd77" var="txt_name" x="1" y="2" height="18" style="二级框标题" size="12"/>
			  <Label text="+99999" autoSize="left" color="0x3cff00" x="59" y="2" var="txt_value"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function RunePorpRenderUI()
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
