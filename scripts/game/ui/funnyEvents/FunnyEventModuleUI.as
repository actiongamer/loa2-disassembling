package game.ui.funnyEvents
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.VBox;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   
   public class FunnyEventModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="850" height="552">
			  <PanelBg x="0" y="0" width="850" height="552" showTabLine="true"/>
			  <Tab labels="标 签,标 签" x="24" y="40" style="TAB超长" var="tab"/>
			  <VBox x="24" y="97" space="30" align="left" var="boxLines">
			    <Image skin="png.a5.commonImgs.小框分割线" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="10" y="10" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="20" y="20" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="30" y="30" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="40" y="40" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="50" y="50" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="60" y="60" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="70" y="70" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="80" y="80" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="90" y="90" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="100" y="100" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="110" y="110" width="800"/>
			    <Image skin="png.a5.commonImgs.小框分割线" x="120" y="120" width="800"/>
			  </VBox>
			  <List x="27" y="71" repeatY="13" spaceY="10" var="list">
			    <FunnyEventRender name="render" runtime="game.ui.funnyEvents.FunnyEventRenderUI"/>
			  </List>
			  <PageBarS2 x="329" y="504" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			</PopModuleView>;
       
      
      public var tab:Tab = null;
      
      public var boxLines:VBox = null;
      
      public var list:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public function FunnyEventModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.funnyEvents.FunnyEventRenderUI"] = FunnyEventRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
