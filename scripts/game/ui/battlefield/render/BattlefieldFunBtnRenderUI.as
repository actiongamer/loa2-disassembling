package game.ui.battlefield.render
{
   import morn.core.components.View;
   import game.ui.commons.comps.others.TaskAlertRenderS3UI;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.RedPointNumUI;
   import morn.core.components.Label;
   import morn.core.components.Box;
   
   public class BattlefieldFunBtnRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="84" height="64">
			  <TaskAlertRenderS3 x="40" y="-19" var="box_alert" runtime="game.ui.commons.comps.others.TaskAlertRenderS3UI"/>
			  <Image skin="png.a5.commonImgs.img_bg" x="18.75" y="8.35" centerX="0" centerY="0" scale="0.8" smoothing="true"/>
			  <Image skin="png.a5.comps.img_block" var="img_bg" autoSize="true" width="64" height="64" anchorX="0.5" anchorY="1" x="42" y="58" scale="0.8" smoothing="true"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="58" y="2" var="img_redPoi"/>
			  <RedPointNum x="53" y="-1" var="countPoint" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			  <Label text="渐变渐变" autoSize="none" x="-31" y="44" style="渐变4" align="center" var="txt_names" mouseChildren="false" mouseEnabled="false" height="20" width="148" size="14"/>
			  <Box x="-3" y="-17" var="box_wealth">
			    <Image skin="png.a5.commonImgs.文字底" width="91" height="17"/>
			  </Box>
			</View>;
       
      
      public var box_alert:TaskAlertRenderS3UI = null;
      
      public var img_bg:Image = null;
      
      public var img_redPoi:Image = null;
      
      public var countPoint:RedPointNumUI = null;
      
      public var txt_names:Label = null;
      
      public var box_wealth:Box = null;
      
      public function BattlefieldFunBtnRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         viewClassMap["game.ui.commons.comps.others.TaskAlertRenderS3UI"] = TaskAlertRenderS3UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
