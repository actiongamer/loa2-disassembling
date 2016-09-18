package game.ui.friendModules.activities
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Image;
   
   public class FriendLogRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="640" height="27">
			  <Label text="[15-12-59 00:00:00]" x="10" y="7" var="txt_time" width="129" height="18" align="center" style="普通说明暗色"/>
			  <Label text="内容" x="149" y="7" var="txt_content" width="484" height="18" style="普通说明"/>
			  <Button label="祝贺" buttonMode="true" labelFont="FZZHB" x="524" var="btn_do" style="按钮小蓝" y="3"/>
			  <Image skin="png.a5.commonImgs.小框分割线" y="0" width="640" x="0" var="img_line"/>
			  <Label text="已祝贺" x="525" y="7" var="txt_done" width="67" height="18" style="普通灰色" align="center"/>
			</View>;
       
      
      public var txt_time:Label = null;
      
      public var txt_content:Label = null;
      
      public var btn_do:Button = null;
      
      public var img_line:Image = null;
      
      public var txt_done:Label = null;
      
      public function FriendLogRenderUI()
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
