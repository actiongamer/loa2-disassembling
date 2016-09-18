package game.ui.fundModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Tab;
   
   public class FundModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="814" height="560" name="render">
			  <PanelBg x="4" y="6" width="805" height="551"/>
			  <Image skin="png.a5.comps.img_block" x="5" y="33" width="801" height="218" var="img_bg"/>
			  <Image skin="png.a5.comps.img_block" x="-232" y="-171" width="764" height="776" var="img_person" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.a5.comps.img_block" x="75" y="163" width="724" height="384" var="img_bg2"/>
			  <Tab labels="全民基金,全民福利" x="99" y="143" style="TAB长" var="tabBar"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_person:Image = null;
      
      public var img_bg2:Image = null;
      
      public var tabBar:Tab = null;
      
      public function FundModuleUI()
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
