package game.ui.mainToolBar
{
   import morn.core.components.View;
   import game.ui.commons.comps.others.TaskAlertRenderS3UI;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.RedPointNumUI;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import game.ui.commons.comps.others.RedPointNewUI;
   
   public class BottomIconRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="85" height="75">
			  <TaskAlertRenderS3 x="41" y="-31" var="box_alert" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.comps.others.TaskAlertRenderS3UI"/>
			  <Image skin="png.uiMainToolBar.img_bg" x="13.5" y="8" centerX="0" centerY="0"/>
			  <Image skin="png.a5.comps.img_block" var="img_bg" autoSize="true" width="64" height="64" anchorX="0.5" anchorY="1" x="42" y="64"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="58" y="2" var="img_redPoi"/>
			  <RedPointNum x="53" y="-1" var="countPoint" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			  <Label text="渐变渐变" autoSize="none" x="-8.5" y="47" style="渐变4" align="center" var="txt_names" mouseChildren="false" mouseEnabled="false" width="102" size="15" centerX="0"/>
			  <Box y="-30" centerX="0" var="box_wealth" x="0">
			    <Image skin="png.a5.commonImgs.文字底" width="85" height="22" centerX="0" y="2"/>
			    <ButtonWealhtRender var="wealthRender" centerX="0" x="7" runtime="game.ui.mainToolBar.ButtonWealhtRenderUI"/>
			  </Box>
			  <Image skin="png.a5.commonImgs.新获得2" x="26" y="-5" var="img_new"/>
			  <RedPointNew x="4" y="0" var="stateIcon" runtime="game.ui.commons.comps.others.RedPointNewUI"/>
			</View>;
       
      
      public var box_alert:TaskAlertRenderS3UI = null;
      
      public var img_bg:Image = null;
      
      public var img_redPoi:Image = null;
      
      public var countPoint:RedPointNumUI = null;
      
      public var txt_names:Label = null;
      
      public var box_wealth:Box = null;
      
      public var wealthRender:game.ui.mainToolBar.ButtonWealhtRenderUI = null;
      
      public var img_new:Image = null;
      
      public var stateIcon:RedPointNewUI = null;
      
      public function BottomIconRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointNewUI"] = RedPointNewUI;
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         viewClassMap["game.ui.commons.comps.others.TaskAlertRenderS3UI"] = TaskAlertRenderS3UI;
         viewClassMap["game.ui.mainToolBar.ButtonWealhtRenderUI"] = game.ui.mainToolBar.ButtonWealhtRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
