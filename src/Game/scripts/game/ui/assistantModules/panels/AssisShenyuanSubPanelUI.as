package game.ui.assistantModules.panels
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import game.ui.assistantModules.renders.AssisShenyuanAddRenderUI;
   
   public class AssisShenyuanSubPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="380" height="466">
			  <PanelBgS3 x="4" y="2" width="370" height="461" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Image skin="png.uiAssistantModules.img_titleBg" x="16" y="38"/>
			  <Label text="\l60200054" autoSize="none" x="64" y="41" style="加底标题" width="79" height="19" align="center"/>
			  <Label text="操作" autoSize="none" x="248" y="41" style="加底标题" width="79" height="19" align="center"/>
			  <List x="19" y="61" repeatY="9" var="list_buff" width="341" height="342" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3">
			    <AssisShenyuanAddRender x="0" y="2" name="render" runtime="game.ui.assistantModules.renders.AssisShenyuanAddRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var list_buff:List = null;
      
      public function AssisShenyuanSubPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.assistantModules.renders.AssisShenyuanAddRenderUI"] = AssisShenyuanAddRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
