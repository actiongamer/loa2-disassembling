package game.ui.peakSports.peakSportsReport
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.peakSports.peakSportsReport.render.PeakSportsReportRenderUI;
   import game.ui.peakSports.peakSportsReport.render.PeakSportsReportTabRenderUI;
   
   public class PeakSportsReportModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="-2" y="2" width="804" height="551"/>
			  <Image skin="png.uiPeakSports.img_bottomBg" x="12" y="413" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.a5.comps.img_block" x="17" y="41" var="img_bg"/>
			  <Image skin="png.uiPeakSports.img_topBg" x="17" y="42"/>
			  <Label text="\l50500088" autoSize="none" x="41" y="48" style="加底标题" width="75" align="center" height="20"/>
			  <Label text="\l50500039" autoSize="none" x="121" y="48" style="加底标题" width="111" align="center" height="20"/>
			  <Label text="\l50500089" autoSize="none" x="239" y="48" style="加底标题" width="125" align="center" height="20"/>
			  <Label text="\l50500040" autoSize="none" x="364" y="48" style="加底标题" width="97" align="center" height="20"/>
			  <Label autoSize="none" x="460" y="48" style="加底标题" width="99" align="center" text="\l50500041" height="20"/>
			  <Label text="\l50500091" autoSize="none" x="558" y="48" style="加底标题" width="94" align="center" height="20"/>
			  <Label text="\l50500092" autoSize="none" x="657" y="48" style="加底标题" width="89" align="center" height="20"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="11" y="38" sizeGrid="14,18,14,14" width="773" height="503" mouseChildren="false" mouseEnabled="false"/>
			  <Button label="\l999600131" x="342" style="按钮大黄" y="470" var="btn_leave"/>
			  <Label text="自动退出" autoSize="none" x="308" y="516" style="普通说明" width="184" align="center" height="20" var="txt_leaveAlert"/>
			  <List x="40" y="433" repeatX="3" spaceX="-20" var="list_tab" width="218" height="97">
			    <PeakSportsReportTabRender x="0" y="0" name="render" runtime="game.ui.peakSports.peakSportsReport.render.PeakSportsReportTabRenderUI"/>
			  </List>
			  <List x="19" y="73" var="list_task" repeatY="11" spaceY="2" width="762" height="350" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3">
			    <PeakSportsReportRender x="0" y="0" name="render" runtime="game.ui.peakSports.peakSportsReport.render.PeakSportsReportRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var btn_leave:Button = null;
      
      public var txt_leaveAlert:Label = null;
      
      public var list_tab:List = null;
      
      public var list_task:List = null;
      
      public function PeakSportsReportModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.peakSports.peakSportsReport.render.PeakSportsReportRenderUI"] = PeakSportsReportRenderUI;
         viewClassMap["game.ui.peakSports.peakSportsReport.render.PeakSportsReportTabRenderUI"] = PeakSportsReportTabRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
