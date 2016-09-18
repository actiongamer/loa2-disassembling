package game.ui.teamGuajiScenes.pvp
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRender60X60UI;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   
   public class TreasureComposePanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="372" height="297">
			  <PanelBgS3 width="371" height="297" showLightBottom="true" frameStyle="1" frameVisible="true" x="0" y="0"/>
			  <Image skin="png.uiTreasureCompose.底框2" x="56" y="43"/>
			  <Image skin="png.uiTreasureCompose.底框2" x="216" y="43"/>
			  <Button label="\l41300241" x="132" style="按钮大绿" y="248" var="btn_compose"/>
			  <WealthRender60X60 x="75.5" y="62" var="pieceRender" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  <Image skin="png.uiTreasureCompose.问号2" x="249" y="74" var="img_quest"/>
			  <Label text="232品质变化" autoSize="none" x="45" y="145" style="人名1不随品质变化" var="txt_pieceName" align="center" width="122" height="20"/>
			  <Label text="人名1不随品质变化" autoSize="none" x="52.5" y="162" style="人名1不随品质变化" align="center" var="txt_pieceCnt" width="107"/>
			  <NumBarS1 x="125" y="201" var="numberBar" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <Image skin="png.a5.commonImgs.img_arrowRight2" x="165" y="103" scale=".8" smoothing="true"/>
			</PopModuleView>;
       
      
      public var btn_compose:Button = null;
      
      public var pieceRender:WealthRender60X60UI = null;
      
      public var img_quest:Image = null;
      
      public var txt_pieceName:Label = null;
      
      public var txt_pieceCnt:Label = null;
      
      public var numberBar:NumBarS1UI = null;
      
      public function TreasureComposePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
