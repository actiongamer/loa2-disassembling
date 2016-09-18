package game.ui.newYears.day51s
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import game.ui.newYears.day51s.panels.TimeIsOverPanelUI;
   import morn.core.components.Tab;
   import game.ui.commons.comps.others.RedPointUI;
   
   public class Day51ModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="860" height="560" style="二级框标题">
			  <Image skin="png.uiDay51.img_bg" x="-35" y="15" var="img_bg"/>
			  <Image skin="png.uiDay51.img_title_bg" x="113.5" y="-102"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="28" x="820" var="btn_close"/>
			  <TimeIsOverPanel x="130.5" y="60" var="timeOverPanel" runtime="game.ui.newYears.day51s.panels.TimeIsOverPanelUI"/>
			  <Tab labels="label1,label2,label1,label2" skin="png.uiFunnyCommon.tab_kind" x="49" y="62" space="1" var="tab"/>
			  <RedPoint x="221" y="57" var="redPoi0" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="406" y="57" var="redPoi1" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="591" y="57" var="redPoi2" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="776" y="57" var="redPoi3" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <Image skin="png.uiDay51.img_title" x="338" y="-20" centerX="0" visible="false"/>
			  <Label autoSize="none" x="231" y="-13" style="渐变1" align="center" width="398" height="63" text="\l133550002 " bold="true" size="40"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var btn_close:Button = null;
      
      public var timeOverPanel:TimeIsOverPanelUI = null;
      
      public var tab:Tab = null;
      
      public var redPoi0:RedPointUI = null;
      
      public var redPoi1:RedPointUI = null;
      
      public var redPoi2:RedPointUI = null;
      
      public var redPoi3:RedPointUI = null;
      
      public function Day51ModuleUI()
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
