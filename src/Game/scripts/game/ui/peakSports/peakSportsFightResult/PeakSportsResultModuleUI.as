package game.ui.peakSports.peakSportsFightResult
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultLeftRenderUI;
   import game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultRightRenderUI;
   
   public class PeakSportsResultModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="-2" y="2" width="804" height="551" btnCloseStyle="0"/>
			  <Image skin="png.a5.comps.img_block" x="1" y="31" var="img_bg" autoSize="true" width="801" height="518"/>
			  <Image skin="png.uiPeakSports.img_vs" x="326" y="24"/>
			  <Button label="\l10900033" x="341" style="按钮大黄" y="465" var="btn_leave"/>
			  <Label text="名字" x="321" y="506" width="158" height="18" var="txt_autoLeave" align="center" style="普通说明"/>
			  <PeakSportsFightResultLeftRender x="0" y="1" var="render_left" runtime="game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultLeftRenderUI"/>
			  <PeakSportsFightResultRightRender x="397" y="1" var="render_right" runtime="game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultRightRenderUI"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var btn_leave:Button = null;
      
      public var txt_autoLeave:Label = null;
      
      public var render_left:PeakSportsFightResultLeftRenderUI = null;
      
      public var render_right:PeakSportsFightResultRightRenderUI = null;
      
      public function PeakSportsResultModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultLeftRenderUI"] = PeakSportsFightResultLeftRenderUI;
         viewClassMap["game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultRightRenderUI"] = PeakSportsFightResultRightRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
