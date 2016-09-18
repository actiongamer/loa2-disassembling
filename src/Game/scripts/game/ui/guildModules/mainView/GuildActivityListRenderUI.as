package game.ui.guildModules.mainView
{
   import morn.core.components.View;
   import game.ui.commons.comps.others.TaskAlertRenderS3UI;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GuildActivityListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="232" height="100" buttonMode="true" mouseChildren="true" mouseEnabled="false">
			  <TaskAlertRenderS3 x="112" y="11" var="box_alert" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.comps.others.TaskAlertRenderS3UI"/>
			  <Box x="12" y="35" var="box_content">
			    <Image skin="png.uiGuildModule.img_FunBg1" var="img_funBg" anchorY="1" anchorX=".5" x="105" y="64"/>
			    <Label text="普通说明普通说明普通说明普通说明普通说明" autoSize="none" y="31" style="普通说明" align="right" width="209" height="18" var="txt_info"/>
			    <Label autoSize="none" y="0" style="渐变1" align="right" width="149" var="txt_name" x="64" text="公会" height="44" multiline="true" wordWrap="true" isHtml="true"/>
			  </Box>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="216" y="17" var="img_redPoint"/>
			  <Image skin="png.uiGuildModule.首页-铁链" x="-5" y="54" var="img_lock"/>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="72" y="58" var="img_got" anchorX=".5" anchorY=".5"/>
			</View>;
       
      
      public var box_alert:TaskAlertRenderS3UI = null;
      
      public var box_content:Box = null;
      
      public var img_funBg:Image = null;
      
      public var txt_info:Label = null;
      
      public var txt_name:Label = null;
      
      public var img_redPoint:Image = null;
      
      public var img_lock:Image = null;
      
      public var img_got:Image = null;
      
      public function GuildActivityListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.TaskAlertRenderS3UI"] = TaskAlertRenderS3UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
