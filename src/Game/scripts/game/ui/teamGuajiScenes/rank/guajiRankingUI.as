package game.ui.teamGuajiScenes.rank
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class guajiRankingUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="805" height="547">
			  <PanelBg width="805" height="551" x="0" y="0"/>
			  <Tab x="27" y="41" style="TAB长" labels=",," selectedIndex="0" var="tabBar"/>
			  <Label text="\l41300228" autoSize="none" x="559" y="43" style="重要提示橘黄" width="217" height="22" align="right" var="txt_condition"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="173" y="38" var="img_redPoint1"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="253" y="38" var="img_redPoint2"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="14" y="65" sizeGrid="14,18,14,14" left="14" right="14" width="777" height="474" var="img_frame"/>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var txt_condition:Label = null;
      
      public var img_redPoint1:Image = null;
      
      public var img_redPoint2:Image = null;
      
      public var img_frame:Image = null;
      
      public function guajiRankingUI()
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
