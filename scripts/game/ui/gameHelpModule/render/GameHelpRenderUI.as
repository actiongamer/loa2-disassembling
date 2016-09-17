package game.ui.gameHelpModule.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GameHelpRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="540" height="121">
			  <Image skin="png.uiGameHelp.GM认证-游戏助手-文字bj" x="0" y="0" width="540" height="81" sizeGrid="5,5,5,5" var="img_bg"/>
			  <Label text="如何升级" autoSize="none" x="11" y="9" style="重要提示橘黄" width="529" size="15" height="22" var="label_question"/>
			  <Label text="在游戏中，可以通过主线任务、日常任务、讨伐群雄、劫匪" autoSize="left" x="10" y="35" width="379" multiline="true" wordWrap="true" leading="1" var="label_answer"/>
			  <Button label="前往" skin="png.a5.btns.btn_big_S3" x="399" y="23" stateNum="1" style="按钮大绿" visible="false"/>
			  <Image skin="png.a5.commonImgs.img_leftArrow" x="525" y="64" rotation="-90" anchorX="0.5" anchorY="0.5" buttonMode="true" mouseChildren="true" var="img_extend"/>
			  <Label text="在游戏中，可以通过主线任务、日常任务、讨伐群雄、劫匪" autoSize="none" x="10" y="35" width="379" height="39" multiline="true" wordWrap="true" leading="1" var="label_answer2"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var label_question:Label = null;
      
      public var label_answer:Label = null;
      
      public var img_extend:Image = null;
      
      public var label_answer2:Label = null;
      
      public function GameHelpRenderUI()
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
