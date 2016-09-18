package game.ui.guildModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Image;
   import morn.core.components.Button;
   
   public class GuildModuleViewUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="553">
			  <PanelBg x="0" y="0" width="803" height="553"/>
			  <Tab labels="1,2,3,4,5,6,7" x="26" y="40" style="TAB长" var="tabBar" selectedIndex="0"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="12" y="64" sizeGrid="14,18,14,14" width="780" height="476" var="img_frame"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="251" y="37" var="img_redPoint_3"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="331" y="37" var="img_redPoint_4"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="572" y="37" var="img_redPoint_7"/>
			  <Button skin="png.a5.commonImgs.img_rule" x="734" y="2" var="img_help" stateNum="1" buttonMode="true"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var img_frame:Image = null;
      
      public var img_redPoint_3:Image = null;
      
      public var img_redPoint_4:Image = null;
      
      public var img_redPoint_7:Image = null;
      
      public var img_help:Button = null;
      
      public function GuildModuleViewUI()
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
