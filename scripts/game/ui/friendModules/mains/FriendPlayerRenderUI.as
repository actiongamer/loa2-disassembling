package game.ui.friendModules.mains
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class FriendPlayerRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="180" height="48">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="48" height="48"/>
			  <Image skin="png.comp.image" x="4" y="4" var="img_icon" width="40" height="40"/>
			  <Label text="人名" autoSize="left" x="48" y="4" width="125" height="18" var="txt_name" style="人名1不随品质变化"/>
			  <Label text="Lv.78" autoSize="none" x="170" y="4" var="txt_lv" style="普通说明" align="right"/>
			</PlayerRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_lv:Label = null;
      
      public function FriendPlayerRenderUI()
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
