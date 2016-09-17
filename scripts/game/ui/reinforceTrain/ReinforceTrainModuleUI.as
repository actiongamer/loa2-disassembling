package game.ui.reinforceTrain
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ReinforceTrainModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="988" height="550">
			  <PanelBg x="13" y="0" width="960" height="550"/>
			  <Tab labels="标 签,标 签" x="45" y="37" selectedIndex="1" style="TAB超长" var="tabBar"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.面板分割线" x="17" y="61" var="img_tabLine" width="952"/>
			  <Label text="\l30815009" autoSize="none" x="49.5" y="517" style="普通说明" width="889" align="center" var="txt_hint" height="20" centerX="0"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var img_tabLine:Image = null;
      
      public var txt_hint:Label = null;
      
      public function ReinforceTrainModuleUI()
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
