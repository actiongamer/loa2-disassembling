package game.ui.busyActivity.towers
{
   import morn.customs.components.PopModuleView;
   import morn.customs.components.Placeholder;
   import morn.core.components.Button;
   import morn.core.components.Tab;
   import game.ui.commons.comps.others.RedPointUI;
   import game.ui.newYears.day51s.panels.TimeIsOverPanelUI;
   import morn.customs.components.GRect;
   import morn.core.components.Label;
   
   public class TowerModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="560">
			  <Image skin="png.uiTower.img_1" x="-88" y="-88"/>
			  <Placeholder width="789" height="451" x="7" y="96" var="placeVs"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="22" x="781" var="btn_close"/>
			  <Tab labels="label1,label2,label1,label2" skin="png.uiFunnyCommon.tab_kind2" x="13" y="59" space="1" var="tab"/>
			  <RedPoint x="181" y="54" var="redPoi0" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="374" y="54" var="redPoi1" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="567" y="54" var="redPoi2" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="760" y="54" var="redPoi3" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="832" y="54" var="redPoi4" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <TimeIsOverPanel x="100" y="58" var="timeOverPanel" runtime="game.ui.newYears.day51s.panels.TimeIsOverPanelUI"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="-31" y="51" width="871" height="500" var="cover_forbit"/>
			  <Label text="\l9113386" autoSize="none" x="217.5" y="-6" style="渐变_抽奖" width="357" height="41" var="txt_title" multiline="true" wordWrap="true" align="center"/>
			  <Button skin="png.a5.commonImgs.img_rule" x="744" y="22" var="btn_rule" stateNum="1"/>
			  <Label text="\l9113360" autoSize="none" x="577" y="32" style="重要提示绿" width="166" height="22" align="right"/>
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
      
      public var cover_forbit:GRect = null;
      
      public var txt_title:Label = null;
      
      public var btn_rule:Button = null;
      
      public function TowerModuleUI()
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
