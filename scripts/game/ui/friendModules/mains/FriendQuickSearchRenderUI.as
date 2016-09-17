package game.ui.friendModules.mains
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class FriendQuickSearchRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="230" height="20">
			  <Image skin="png.uiFriend.mains.鼠标滑过" width="230" height="20" name="selectBoxAll"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" var="img_quality" sizeGrid="6,6,6,6" width="20" height="20"/>
			  <Image skin="png.comp.image" x="2" y="2" var="img_icon" width="16" height="16"/>
			  <Label text="Lv.98" autoSize="left" x="112" y="1" width="46" height="18" var="txt_lv" style="普通说明"/>
			  <Label text="人名" autoSize="left" x="23" y="1" width="73" height="18" var="txt_name" style="人名1不随品质变化"/>
			  <Label autoSize="none" x="153" y="1" width="73" height="18" var="txt_offtime" style="普通说明" align="right" text="离线时间"/>
			</PlayerRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_lv:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_offtime:Label = null;
      
      public function FriendQuickSearchRenderUI()
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
