package game.ui.assistantModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Panel;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.assistantModules.renders.AssisFuncRenderUI;
   
   public class AssistantModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="832" height="560">
			  <PanelBg x="13" y="8" width="804" height="550"/>
			  <Image skin="png.uiAssistantModules.img_moduleBg" x="28" y="45"/>
			  <List x="32" y="68" var="funcList">
			    <AssisFuncRender name="item0" x="0" runtime="game.ui.assistantModules.renders.AssisFuncRenderUI"/>
			    <AssisFuncRender name="item1" x="0" y="105" runtime="game.ui.assistantModules.renders.AssisFuncRenderUI"/>
			    <AssisFuncRender name="item2" x="0" y="234" runtime="game.ui.assistantModules.renders.AssisFuncRenderUI"/>
			    <AssisFuncRender name="item3" x="0" y="366" runtime="game.ui.assistantModules.renders.AssisFuncRenderUI"/>
			  </List>
			  <Panel x="320" y="142" width="480" height="322" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="logPanel">
			    <Label autoSize="left" style="普通说明" var="logTxt" x="0" y="7" width="457" wordWrap="true" multiline="true" text="普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明" leading="15"/>
			  </Panel>
			  <Button label="\l60200008" x="705" y="505" style="按钮中黄" var="btn_clear"/>
			  <Label text="\l60200088" x="447" y="96" style="加底标题" width="207" height="33" align="center"/>
			  <Button label="\l60200006" x="491" style="按钮大绿" y="497" var="btn_start"/>
			  <Box x="31" y="46">
			    <Image skin="png.uiAssistantModules.img_lineBg2" mouseEnabled="false" mouseChildren="false"/>
			    <Image skin="png.a5.commonImgs.img_yellow" x="52" y="5"/>
			    <Label text="\l60200001" autoSize="none" x="47" y="13" style="加底标题" width="156" height="19" var="txt_60200001" align="center"/>
			    <Image skin="png.uiAssistantModules.img_lineBg2" x="10" y="237" mouseEnabled="false" mouseChildren="false"/>
			    <Image skin="png.a5.commonImgs.img_yellow" x="61" y="241"/>
			    <Label text="\l60200002" autoSize="none" x="47" y="247" style="加底标题" width="156" height="19" var="txt_60200002" align="center"/>
			    <Image skin="png.uiAssistantModules.img_lineBg2" y="366" mouseEnabled="false" mouseChildren="false" x="0"/>
			    <Image skin="png.a5.commonImgs.img_yellow" x="61" y="372"/>
			    <Label text="\l60200004" autoSize="none" x="47" y="379" style="加底标题" width="156" height="19" var="txt_60200004" align="center"/>
			  </Box>
			</PopModuleView>;
       
      
      public var funcList:List = null;
      
      public var logPanel:Panel = null;
      
      public var logTxt:Label = null;
      
      public var btn_clear:Button = null;
      
      public var btn_start:Button = null;
      
      public var txt_60200001:Label = null;
      
      public var txt_60200002:Label = null;
      
      public var txt_60200004:Label = null;
      
      public function AssistantModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.assistantModules.renders.AssisFuncRenderUI"] = AssisFuncRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
