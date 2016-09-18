package game.ui.battlefield.BattlefieldReport
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.battlefield.BattlefieldReport.render.BattlefieldReportRenderUI;
   import game.ui.battlefield.BattlefieldReport.render.BattlefieldReportTabRenderUI;
   
   public class BattlefieldReportModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="-2" y="2" width="804" height="551"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldReportModule.img_bottomBg2" x="301" y="428"/>
			  <Image skin="png.a5.comps.img_block" x="17" y="41" var="img_bg"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldReportModule.img_topBg" x="17" y="42"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="11" y="38" sizeGrid="14,18,14,14" width="773" height="503"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldReportModule.img_bottomBg" x="15" y="414"/>
			  <Button label="离开战场" x="342" style="按钮大黄" y="470" var="btn_leave"/>
			  <Label text="我的积分：1" autoSize="none" x="309" y="434" style="加底标题" width="184" align="center" height="20" var="txt_teamInfo"/>
			  <Label text="自动退出" autoSize="none" x="308" y="516" style="普通说明" width="184" align="center" height="20" var="txt_leaveAlert"/>
			  <Label text="\l50500095" autoSize="none" x="636" y="450" style="加底标题" width="56" align="center" height="20"/>
			  <Label text="战场奖励" autoSize="none" x="623" y="471" style="普通说明" width="136" align="left" height="20" var="txt_myHonor"/>
			  <Label text="战场奖励" autoSize="none" x="623" y="491" style="普通说明" width="138" align="left" height="20" var="txt_myScore"/>
			  <Label text="\l50500088" autoSize="none" x="65" y="48" style="加底标题" width="35" align="center" height="20"/>
			  <Label text="\l50500039" autoSize="none" x="132" y="48" style="加底标题" width="45" align="center" height="20"/>
			  <Label text="\l50500089" autoSize="none" x="203" y="48" style="加底标题" width="56" align="center" height="20"/>
			  <Label text="\l50500040" autoSize="none" x="280" y="48" style="加底标题" width="56" align="center" height="20"/>
			  <Label autoSize="none" x="352" y="48" style="加底标题" width="56" align="center" text="\l50500041"/>
			  <Label text="\l50500090" autoSize="none" x="418" y="48" style="加底标题" width="65" align="center" var="txt_gatherLabel"/>
			  <Label text="\l50500091" autoSize="none" x="493" y="48" style="加底标题" width="56" align="center"/>
			  <Label text="\l50500092" autoSize="none" x="564" y="48" style="加底标题" width="56" align="center"/>
			  <Label text="\l50500093" autoSize="none" x="635" y="48" style="加底标题" width="56" align="center"/>
			  <Label text="\l50500094" autoSize="none" x="706" y="48" style="加底标题" width="56" align="center"/>
			  <List x="20" y="73" var="list_task" repeatY="11" spaceY="2" width="762" height="350" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3">
			    <BattlefieldReportRender name="render" runtime="game.ui.battlefield.BattlefieldReport.render.BattlefieldReportRenderUI"/>
			  </List>
			  <List x="40" y="433" repeatX="3" spaceX="-20" var="list_tab">
			    <BattlefieldReportTabRender name="render" runtime="game.ui.battlefield.BattlefieldReport.render.BattlefieldReportTabRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var btn_leave:Button = null;
      
      public var txt_teamInfo:Label = null;
      
      public var txt_leaveAlert:Label = null;
      
      public var txt_myHonor:Label = null;
      
      public var txt_myScore:Label = null;
      
      public var txt_gatherLabel:Label = null;
      
      public var list_task:List = null;
      
      public var list_tab:List = null;
      
      public function BattlefieldReportModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldReport.render.BattlefieldReportRenderUI"] = BattlefieldReportRenderUI;
         viewClassMap["game.ui.battlefield.BattlefieldReport.render.BattlefieldReportTabRenderUI"] = BattlefieldReportTabRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
