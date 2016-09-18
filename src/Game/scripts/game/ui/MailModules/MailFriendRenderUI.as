package game.ui.MailModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class MailFriendRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="130" height="27">
			  <Image skin="png.a5.bgs.tooltipBgs.img_tipMenuSelectBoxBg" x="1" y="0" name="selectBox0" width="130" height="27" alpha="0"/>
			  <Image skin="png.a5.bgs.tooltipBgs.img_tipMenuSelectBoxBg" x="0" y="0" name="selectBox0" width="130" height="27"/>
			  <Label text="名字名字名字" autoSize="left" x="5" y="5" var="txtFriendName" style="普通说明"/>
			  <Label text="Lv.100" autoSize="left" x="88" y="5" var="txtFriendLv" style="普通说明"/>
			</View>;
       
      
      public var txtFriendName:Label = null;
      
      public var txtFriendLv:Label = null;
      
      public function MailFriendRenderUI()
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
