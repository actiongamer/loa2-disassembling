package game.ui.newYears.luckTrees
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import game.ui.newYears.luckTrees.panels.TimeIsOverPanelUI;
   import morn.core.components.Tab;
   import game.ui.commons.comps.others.RedPointUI;
   import morn.core.components.Label;
   
   public class LuckTreeModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="860" height="560">
			  <Image skin="png.uiLuckTree.img_bg" x="-60" y="-89"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="28" x="820" var="btn_close"/>
			  <TimeIsOverPanel x="130.5" y="64" var="timeOverPanel" runtime="game.ui.newYears.luckTrees.panels.TimeIsOverPanelUI"/>
			  <Tab labels="label1,label2,label1,label2" skin="png.uiLuckTree.tab_kind" x="49" y="62" space="1" var="tab"/>
			  <RedPoint x="215" y="57" var="redPoi0" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="400" y="57" var="redPoi1" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="585" y="57" var="redPoi2" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="770" y="57" var="redPoi3" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <Button skin="png.a5.commonImgs.img_rule" x="787" y="63" var="btn_rule" stateNum="1"/>
			  <Label text="\l13350028" autoSize="none" x="245" y="1" style="渐变_抽奖" width="357" height="36" var="txt_over" multiline="true" wordWrap="true" align="center"/>
			</PopModuleView>;
       
      
      public var btn_close:Button = null;
      
      public var timeOverPanel:TimeIsOverPanelUI = null;
      
      public var tab:Tab = null;
      
      public var redPoi0:RedPointUI = null;
      
      public var redPoi1:RedPointUI = null;
      
      public var redPoi2:RedPointUI = null;
      
      public var redPoi3:RedPointUI = null;
      
      public var btn_rule:Button = null;
      
      public var txt_over:Label = null;
      
      public function LuckTreeModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         viewClassMap["game.ui.newYears.luckTrees.panels.TimeIsOverPanelUI"] = TimeIsOverPanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
