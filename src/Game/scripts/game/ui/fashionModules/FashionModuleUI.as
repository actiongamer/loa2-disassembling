package game.ui.fashionModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Tab;
   import morn.core.components.Box;
   import morn.customs.components.Accordion;
   import game.ui.fashionAcc.FashionAccRenderUI;
   import game.ui.fashionAcc.FashionAccSelectTitleRenderUI;
   
   public class FashionModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="555">
			  <PanelBg width="803" height="554" x="2" y="3" showTabLine="true"/>
			  <Image skin="png.uiFashion.img_bg" x="4" y="34" var="img_bg"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="19" y="68" sizeGrid="14,18,14,14" width="766" height="475" var="img_frame" mouseChildren="false" mouseEnabled="false"/>
			  <Tab labels="1,2,3" x="41" y="44" style="TAB短" var="tabBar"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="186" y="40" var="img_redPoint"/>
			  <Box x="27" y="70" var="box_acc">
			    <Image skin="png.a5.bgs.panelBgs.img_bgS1" sizeGrid="18,18,18,18" width="231" height="472"/>
			    <Accordion x="6" repeatY="8" var="accSelecter" width="219" height="462" selectedIndex="1" spaceY="1" subTop="0" subBottom="0" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" y="5">
			      <List y="64" repeatY="4" name="subRender" x="1" selectedIndex="-1">
			        <FashionAccRender name="render" runtime="game.ui.fashionAcc.FashionAccRenderUI"/>
			      </List>
			      <FashionAccSelectTitleRender x="7" name="render" runtime="game.ui.fashionAcc.FashionAccSelectTitleRenderUI"/>
			    </Accordion>
			  </Box>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="266" y="40" var="img_redPoint2"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_frame:Image = null;
      
      public var tabBar:Tab = null;
      
      public var img_redPoint:Image = null;
      
      public var box_acc:Box = null;
      
      public var accSelecter:Accordion = null;
      
      public var img_redPoint2:Image = null;
      
      public function FashionModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.fashionAcc.FashionAccRenderUI"] = FashionAccRenderUI;
         viewClassMap["game.ui.fashionAcc.FashionAccSelectTitleRenderUI"] = FashionAccSelectTitleRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
