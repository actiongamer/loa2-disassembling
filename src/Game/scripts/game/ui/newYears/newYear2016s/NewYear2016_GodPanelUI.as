package game.ui.newYears.newYear2016s
{
   import morn.core.components.View;
   import morn.core.components.Tab;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RedPointUI;
   
   public class NewYear2016_GodPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="518" height="489">
			  <Image skin="png.uiNewYear2016.subPanels.img_bg" x="0" y="0"/>
			  <Tab labels="label1,label2" skin="png.uiNewYear2016.subPanels.tab_god" x="2" y="2" space="1" var="tab"/>
			  <Label text="渐变1" autoSize="none" x="64" y="8" style="渐变1" width="134" height="22" align="center" var="tab_txt0"/>
			  <Label text="渐变1" autoSize="none" x="321" y="8" style="渐变1" width="134" height="22" align="center" var="tab_txt1"/>
			  <RedPoint x="4" y="4" var="redPoi0" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="260" y="4" var="redPoi1" runtime="game.ui.commons.comps.others.RedPointUI"/>
			</View>;
       
      
      public var tab:Tab = null;
      
      public var tab_txt0:Label = null;
      
      public var tab_txt1:Label = null;
      
      public var redPoi0:RedPointUI = null;
      
      public var redPoi1:RedPointUI = null;
      
      public function NewYear2016_GodPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
