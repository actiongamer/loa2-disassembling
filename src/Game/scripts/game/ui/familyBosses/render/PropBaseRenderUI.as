package game.ui.familyBosses.render
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class PropBaseRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="107" height="20">
			  <Label text="魔法防御：" autoSize="none" x="1" y="0" height="18" var="txt_name" width="60" style="人名1不随品质变化" align="right"/>
			  <Label text="+20000" autoSize="left" height="20" var="txt_value" letterSpacing="1" align="left" x="59" y="0" style="重要提示绿" width="54"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function PropBaseRenderUI()
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
