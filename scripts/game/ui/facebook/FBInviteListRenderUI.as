package game.ui.facebook
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.CheckBox;
   
   public class FBInviteListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="86" height="121">
			  <Image skin="png.uiFacebook.kuang" x="0" y="0"/>
			  <Label text="搜索好友" autoSize="none" x="0" y="74" bold="false" width="86" var="friendNameTxt" height="18" align="center" mouseChildren="false" mouseEnabled="false" style="普通说明" selectable="false"/>
			  <Image x="8" y="8" var="headImage" width="69" height="63" smoothing="true"/>
			  <CheckBox x="32.5" y="101" selected="false" style="CheckBox普通" var="checkBoxBtn"/>
			</View>;
       
      
      public var friendNameTxt:Label = null;
      
      public var headImage:Image = null;
      
      public var checkBoxBtn:CheckBox = null;
      
      public function FBInviteListRenderUI()
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
