package game.ui.sevenDayModule.view
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class SevDaysMainTskViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="568" height="469">
			  <List x="4" y="142" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="561" height="320" spaceY="0" var="list_task">
			    <SevenDaysTaskRender x="4" y="0" name="render" runtime="game.ui.sevenDayModule.view.SevenDaysTaskRenderUI"/>
			  </List>
			  <Image skin="png.a5.comps.img_block" x="3" y="2" var="img_titleBG" width="561" height="139"/>
			  <Image x="38" y="24" var="img_title" skin="png.a5.comps.img_block"/>
			  <Label text="label" x="12" y="78" var="event_period"/>
			  <Label text="label" x="12" y="95" var="end_time"/>
			  <Label text="label" x="12" y="112" var="reward_end_time"/>
			  <Label text="渐变黄" autoSize="none" x="38" y="16" style="渐变橙" width="439" height="55" align="left" font="Microsoft YaHei" size="40" mouseChildren="false" mouseEnabled="false" var="titleTxt"/>
			</FadeView>;
       
      
      public var list_task:List = null;
      
      public var img_titleBG:Image = null;
      
      public var img_title:Image = null;
      
      public var event_period:Label = null;
      
      public var end_time:Label = null;
      
      public var reward_end_time:Label = null;
      
      public var titleTxt:Label = null;
      
      public function SevDaysMainTskViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.sevenDayModule.view.SevenDaysTaskRenderUI"] = SevenDaysTaskRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
