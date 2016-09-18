package game.ui.friendModules.mains
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Label;
   
   public class FriendBlockListRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="125" height="18">
			  <Label text="Lv.98" autoSize="left" x="129" y="0" width="46" var="txt_lv" style="普通说明"/>
			  <Label text="人名" autoSize="left" x="20" y="0" width="80" var="txt_name" style="人名1不随品质变化"/>
			</PlayerRender>;
       
      
      public var txt_lv:Label = null;
      
      public var txt_name:Label = null;
      
      public function FriendBlockListRenderUI()
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
