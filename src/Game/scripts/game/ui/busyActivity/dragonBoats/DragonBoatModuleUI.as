package game.ui.busyActivity.dragonBoats
{
   import morn.customs.components.PopModuleView;
   import morn.customs.components.Placeholder;
   import morn.core.components.Button;
   import morn.core.components.Tab;
   import game.ui.commons.comps.others.RedPointUI;
   import game.ui.newYears.day51s.panels.TimeIsOverPanelUI;
   
   public class DragonBoatModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="560">
			  <Image skin="png.uiDragonBoat.img_bg" x="-78" y="-121"/>
			  <Placeholder width="789" height="451" x="7" y="96" var="placeVs"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="22" x="781" var="btn_close"/>
			  <Tab labels="label1,label2,label1,label2,bel2" skin="png.uiFunnyCommon.tab_kind2" x="23" y="59" space="1" var="tab"/>
			  <RedPoint x="150" y="54" var="redPoi0" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="297" y="54" var="redPoi1" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="445" y="54" var="redPoi2" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="593" y="54" var="redPoi3" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="741" y="54" var="redPoi4" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <TimeIsOverPanel x="100" y="58" var="timeOverPanel" runtime="game.ui.newYears.day51s.panels.TimeIsOverPanelUI"/>
			  <Button skin="png.a5.commonImgs.img_rule" x="765" y="60" var="btn_rule" stateNum="1"/>
			  <Label text="\l9013376" autoSize="none" x="237" y="-8" style="渐变1" width="319" height="49" align="center" font="Microsoft YaHei" bold="true" size="35"/>
			</PopModuleView>;
       
      
      public var placeVs:Placeholder = null;
      
      public var btn_close:Button = null;
      
      public var tab:Tab = null;
      
      public var redPoi0:RedPointUI = null;
      
      public var redPoi1:RedPointUI = null;
      
      public var redPoi2:RedPointUI = null;
      
      public var redPoi3:RedPointUI = null;
      
      public var redPoi4:RedPointUI = null;
      
      public var timeOverPanel:TimeIsOverPanelUI = null;
      
      public var btn_rule:Button = null;
      
      public function DragonBoatModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         viewClassMap["game.ui.newYears.day51s.panels.TimeIsOverPanelUI"] = TimeIsOverPanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
