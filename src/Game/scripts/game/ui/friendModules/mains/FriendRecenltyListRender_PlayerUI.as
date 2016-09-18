package game.ui.friendModules.mains
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class FriendRecenltyListRender_PlayerUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="299" height="60">
			  <Image skin="png.uiFriend.mains.鼠标滑过" x="0" y="0" var="img_roll"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="4" y="6" var="img_quality" sizeGrid="6,6,6,6" width="48" height="48"/>
			  <Image skin="png.comp.image" x="8" y="10" var="img_icon" width="40" height="40"/>
			  <Label text="Lv.98" autoSize="left" x="56" y="32" width="108" height="18" var="txt_lv" style="普通说明"/>
			  <Label autoSize="left" x="56" y="10" width="119" height="18" var="txt_name" style="人名1不随品质变化" text="啊啊啊啊啊啊啊啊啊"/>
			  <Label autoSize="none" x="179" y="10" width="112" height="41" var="txt_offtime" style="普通说明" align="right" text="离线时间" multiline="true" wordWrap="true"/>
			  <Image skin="png.a5.commonImgs.小框分割线" y="58" width="300"/>
			</PlayerRender>;
       
      
      public var img_roll:Image = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_lv:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_offtime:Label = null;
      
      public function FriendRecenltyListRender_PlayerUI()
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
