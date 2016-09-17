package game.ui.teamGuajiScenes.pvp.saodang
{
   import morn.customs.components.PanelView;
   import morn.core.components.Panel;
   import morn.core.components.List;
   
   public class PvPSaoDangPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="315" height="409">
			  <GRect fillAlpha="0.1" radius="0,0,0,0" lineAlpha="0" width="1600" height="900" centerX="0" centerY="0" fillColor="0x000000" x="20" y="20"/>
			  <PanelBgS3 width="314" height="409" x="0" y="-1" frameStyle="2"/>
			  <Panel x="17" y="39" width="278" height="346" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="contentPanel">
			    <List var="list_saodang" spaceY="2" repeatY="1" x="0" y="3">
			      <PvPSaoDangRender name="render" runtime="game.ui.teamGuajiScenes.pvp.saodang.PvPSaoDangRenderUI"/>
			    </List>
			  </Panel>
			</PanelView>;
       
      
      public var contentPanel:Panel = null;
      
      public var list_saodang:List = null;
      
      public function PvPSaoDangPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.teamGuajiScenes.pvp.saodang.PvPSaoDangRenderUI"] = PvPSaoDangRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
