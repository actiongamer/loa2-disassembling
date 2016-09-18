package game.ui.battlefield.BattlefieldScene
{
   import morn.customs.components.SceneModuleView;
   import game.ui.battlefield.BattlefieldScene.panel.BattlefieldSceneTopPanelUI;
   import morn.core.components.Label;
   import game.ui.battlefield.BattlefieldScene.render.BattlefieldGatherProgressBarUI;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import game.ui.battlefield.BattlefieldScene.panel.BattlefieldMyInfoPanelUI;
   import morn.customs.components.Placeholder;
   import morn.core.components.Button;
   import game.ui.battlefield.BattlefieldScene.panel.BattleFieldFlagInfoPanelUI;
   import morn.core.components.CheckBox;
   
   public class BattlefieldSceneModuleUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="1000" height="600">
			  <BattlefieldSceneTopPanel centerX="0" top="0" var="panel_topInfo" runtime="game.ui.battlefield.BattlefieldScene.panel.BattlefieldSceneTopPanelUI"/>
			  <Label text="离复活还有：00:00" autoSize="none" x="297" y="266" style="渐变1" width="205" height="26" align="center" size="18" var="txt_reviveCountDown" centerY="0" centerX="0"/>
			  <BattlefieldGatherProgressBar x="289" y="295" var="progressBar_gather" runtime="game.ui.battlefield.BattlefieldScene.render.BattlefieldGatherProgressBarUI"/>
			  <Box var="box_starCon" centerX="100" centerY="70" x="-1" y="0">
			    <Image skin="png.a5.commonImgs.img_star2" var="img_star" anchorX=".5" anchorY=".5" x="1"/>
			    <Image skin="png.a5.commonImgs.img_star2" var="img_starC" anchorX=".5" anchorY=".5"/>
			  </Box>
			  <BattlefieldMyInfoPanel x="545" y="209" right="0" var="panel_myInfo" mouseChildren="true" mouseEnabled="false" top="250" runtime="game.ui.battlefield.BattlefieldScene.panel.BattlefieldMyInfoPanelUI"/>
			  <Box var="box_horseLamp" bottom="100" mouseEnabled="false" x="0" y="0" right="0">
			    <Placeholder width="446" height="100" var="txt_horseLamp" mouseEnabled="false" mouseChildren="false"/>
			    <Button skin="png.a5.commonImgs.btn_small" stateNum="1" var="btn_suofang" x="431" y="101"/>
			    <Image skin="png.a5.commonImgs.img_suofang" x="443" y="113" anchorX="0.5" anchorY="0.5" var="img_arrow" rotation="-90" mouseEnabled="false" mouseChildren="false"/>
			  </Box>
			  <BattleFieldFlagInfoPanel x="199.5" y="94" centerX="0" var="flagInfoView" mouseChildren="false" mouseEnabled="false" runtime="game.ui.battlefield.BattlefieldScene.panel.BattleFieldFlagInfoPanelUI"/>
			  <CheckBox label="\l60200086" selected="false" style="CheckBox普通" var="checkBox_assistant" right="50" top="370"/>
			</SceneModuleView>;
       
      
      public var panel_topInfo:BattlefieldSceneTopPanelUI = null;
      
      public var txt_reviveCountDown:Label = null;
      
      public var progressBar_gather:BattlefieldGatherProgressBarUI = null;
      
      public var box_starCon:Box = null;
      
      public var img_star:Image = null;
      
      public var img_starC:Image = null;
      
      public var panel_myInfo:BattlefieldMyInfoPanelUI = null;
      
      public var box_horseLamp:Box = null;
      
      public var txt_horseLamp:Placeholder = null;
      
      public var btn_suofang:Button = null;
      
      public var img_arrow:Image = null;
      
      public var flagInfoView:BattleFieldFlagInfoPanelUI = null;
      
      public var checkBox_assistant:CheckBox = null;
      
      public function BattlefieldSceneModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldScene.panel.BattleFieldFlagInfoPanelUI"] = BattleFieldFlagInfoPanelUI;
         viewClassMap["game.ui.battlefield.BattlefieldScene.panel.BattlefieldMyInfoPanelUI"] = BattlefieldMyInfoPanelUI;
         viewClassMap["game.ui.battlefield.BattlefieldScene.panel.BattlefieldSceneTopPanelUI"] = BattlefieldSceneTopPanelUI;
         viewClassMap["game.ui.battlefield.BattlefieldScene.render.BattlefieldGatherProgressBarUI"] = BattlefieldGatherProgressBarUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
