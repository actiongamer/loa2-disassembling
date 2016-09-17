package game.ui.position
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class RolePetPropRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="138" height="48">
			  <Label text="辅助位加成\n攻击力" autoSize="none" style="升级后加底标题" size="14" width="138" height="48" align="center" var="txt_des"/>
			</NpcPropRender>;
       
      
      public var txt_des:Label = null;
      
      public function RolePetPropRenderUI()
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
