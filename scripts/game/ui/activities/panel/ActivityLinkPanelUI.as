package game.ui.activities.panel
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class ActivityLinkPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="593" height="467">
			  <Image skin="png.uiActivity.img_titleInitBg" x="299" y="144" var="img_bg" anchorX="0.5" anchorY="0.5" width="597" height="288"/>
			  <Image skin="png.uiActivity.蓝光" x="-16" y="22"/>
			  <Image skin="png.uiActivity.img_bg" x="2" y="148"/>
			  <Label autoSize="none" x="12" y="10" style="渐变1" width="532" height="41" align="left" size="28" var="txt_activityName"/>
			  <Label autoSize="none" x="8" y="62" style="小标题" width="374" align="left" height="20" var="txt_activityTime" text="活动时间：无"/>
			  <Label autoSize="none" x="7" y="158" style="小标题" align="left" height="17" wordWrap="true" multiline="false" width="66" text="活动公告"/>
			  <Label autoSize="none" x="380" y="73" style="普通绿色" align="center" height="17" var="txt_leftTime" wordWrap="true" multiline="false" width="164"/>
			  <Button label="点击跳转" x="404" style="按钮大绿" y="102" var="btn_urlLink"/>
			  <Label autoSize="none" x="8" y="177" style="小标题" align="left" height="271" var="txt_rule" wordWrap="true" multiline="false" width="543" indent="25"/>
			</PanelView>;
       
      
      public var img_bg:Image = null;
      
      public var txt_activityName:Label = null;
      
      public var txt_activityTime:Label = null;
      
      public var txt_leftTime:Label = null;
      
      public var btn_urlLink:Button = null;
      
      public var txt_rule:Label = null;
      
      public function ActivityLinkPanelUI()
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
