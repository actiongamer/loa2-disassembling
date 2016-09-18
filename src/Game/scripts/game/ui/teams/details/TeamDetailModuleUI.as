package game.ui.teams.details
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class TeamDetailModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="804" height="517">
			  <PanelBg x="0" y="0" width="804" height="520" showTabLine="false"/>
			  <Image skin="png.uiTeams.bg" x="4" y="30" var="img_bg"/>
			  <Label text="8999" autoSize="none" x="90" y="59" style="普通说明" width="74" height="18" var="txt_no"/>
			  <Label text="队伍编号:" autoSize="none" x="27" y="59" style="小标题" width="64" height="22" var="txt_noTip"/>
			  <Label text="3/3" autoSize="none" x="90" y="80" style="普通说明" width="74" height="18" var="txt_count"/>
			  <Label text="队伍人数:" autoSize="none" x="27" y="80" style="小标题" width="64" height="22" var="txt_countTip"/>
			  <Label autoSize="none" x="27" y="103" style="小标题" width="249" height="18" var="txt_tip" text="组队可额外获得队友收益的20%"/>
			  <TeamDetailRender x="510" y="355" var="render2" runtime="game.ui.teams.details.TeamDetailRenderUI"/>
			  <TeamDetailRender x="151" y="355" var="render1" runtime="game.ui.teams.details.TeamDetailRenderUI"/>
			  <Button label="申请列表" style="按钮中绿" var="btn_applyList" x="186" y="459"/>
			  <Button label="设置自动批准" style="按钮中绿" var="btn_setting" x="302" y="459"/>
			  <Button label="邀请" style="按钮中绿" var="btn_invite" x="423" y="459"/>
			  <Button label="退出队伍" x="546" style="按钮中红" var="btn_quit" y="459"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var txt_no:Label = null;
      
      public var txt_noTip:Label = null;
      
      public var txt_count:Label = null;
      
      public var txt_countTip:Label = null;
      
      public var txt_tip:Label = null;
      
      public var render2:game.ui.teams.details.TeamDetailRenderUI = null;
      
      public var render1:game.ui.teams.details.TeamDetailRenderUI = null;
      
      public var btn_applyList:Button = null;
      
      public var btn_setting:Button = null;
      
      public var btn_invite:Button = null;
      
      public var btn_quit:Button = null;
      
      public function TeamDetailModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.teams.details.TeamDetailRenderUI"] = game.ui.teams.details.TeamDetailRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
