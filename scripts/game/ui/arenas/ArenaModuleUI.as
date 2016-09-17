package game.ui.arenas
{
   import morn.customs.components.SceneModuleView;
   import game.ui.arenas.mains.ArenaInfoPanelUI;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.RuleDescriptionUI;
   import game.ui.arenas.mains.ArenaReportTipUI;
   
   public class ArenaModuleUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="900" height="600">
			  <ArenaInfoPanel y="170" var="infoPanelUI" x="0" runtime="game.ui.arenas.mains.ArenaInfoPanelUI"/>
			  <Image skin="png.uiArenas.主界面任务" right="0" x="640" y="40"/>
			  <Label autoSize="none" y="86" style="重要提示橘黄" width="195" var="txt_cd" align="center" right="0" multiline="true" wordWrap="true" text="\l50200707" x="703"/>
			  <Box x="140" y="258" var="box_zoom" width="24" height="23">
			    <Button skin="png.uiArenas.btn_hide" stateNum="1"/>
			    <Image skin="png.uiArenas.箭头" x="10" y="18" var="img_zone" mouseEnabled="false" mouseChildren="false" anchorX=".5" anchorY=".5" smoothing="true"/>
			  </Box>
			  <Box centerX="0" centerY="30" x="-18" y="22" var="box_refresh" buttonMode="true">
			    <Button skin="png.uiArenas.btn_refresh" x="43" stateNum="1" centerX="0" centerY="0" width="64" height="64"/>
			    <Label text="换一批" autoSize="none" y="51" style="渐变4" width="150" height="22" align="center" mouseEnabled="false"/>
			    <Label autoSize="none" y="14" style="不足禁止红" width="104" height="36" align="center" size="30" var="txt_changeCD" x="23" font="Arial" mouseEnabled="false" mouseChildren="false"/>
			  </Box>
			  <RuleDescription right="20" top="20" var="box_rule" runtime="game.ui.commons.comps.others.RuleDescriptionUI"/>
			  <ArenaReportTip x="443" y="434" right="2" bottom="94" var="reportTipUI" visible="false" runtime="game.ui.arenas.mains.ArenaReportTipUI"/>
			</SceneModuleView>;
       
      
      public var infoPanelUI:ArenaInfoPanelUI = null;
      
      public var txt_cd:Label = null;
      
      public var box_zoom:Box = null;
      
      public var img_zone:Image = null;
      
      public var box_refresh:Box = null;
      
      public var txt_changeCD:Label = null;
      
      public var box_rule:RuleDescriptionUI = null;
      
      public var reportTipUI:ArenaReportTipUI = null;
      
      public function ArenaModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.arenas.mains.ArenaInfoPanelUI"] = ArenaInfoPanelUI;
         viewClassMap["game.ui.arenas.mains.ArenaReportTipUI"] = ArenaReportTipUI;
         viewClassMap["game.ui.commons.comps.others.RuleDescriptionUI"] = RuleDescriptionUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
