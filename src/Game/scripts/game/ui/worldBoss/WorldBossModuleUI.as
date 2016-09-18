package game.ui.worldBoss
{
   import morn.customs.components.SceneModuleView;
   import morn.core.components.List;
   import morn.core.components.CheckBox;
   import game.ui.commons.comps.others.RuleDescriptionUI;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class WorldBossModuleUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="1000" height="600">
			  <WorldBossRankPanel x="0" top="180" var="rankPanel" runtime="game.ui.worldBoss.WorldBossRankPanelUI"/>
			  <List y="34" repeatY="2" var="list_BossHead" right="-5" x="605" spaceY="-14">
			    <WorldBossHeader right="10" name="render" runtime="game.ui.worldBoss.WorldBossHeaderUI"/>
			  </List>
			  <Box y="468" right="80" x="746">
			    <Image skin="png.uiWorldBoss.蓝色透明底-暗" x="6" y="28"/>
			    <Image skin="png.uiWorldBoss.蓝色透明底-暗"/>
			    <CheckBox label="\l40740006" x="11" style="Radio普通" selected="true" var="check_FastBattle" labelMargin="12" y="2"/>
			    <CheckBox label="\l40740007" x="10" y="31" style="Radio普通" selected="true" var="check_auto" labelMargin="12"/>
			  </Box>
			  <RuleDescription y="2" right="0" var="helpBtn" runtime="game.ui.commons.comps.others.RuleDescriptionUI"/>
			  <Box x="222" y="8" centerX="0" var="box_status">
			    <Image skin="png.uiWorldBoss.剩余时间底" x="88" mouseEnabled="false" mouseChildren="false"/>
			    <Label text="活动剩余时间：12:12：12" autoSize="none" y="3" style="渐变1" width="650" height="34" var="txt_statusCD" centerX="0" align="center" mouseEnabled="false" mouseChildren="false"/>
			  </Box>
			  <Box x="216" y="182" buttonMode="true" mouseChildren="false" var="box_showOthers">
			    <Image skin="png.uiWorldBoss.显示底" x="12" y="4"/>
			    <Image skin="png.uiWorldBoss.显示图标" var="img_show"/>
			    <Label text="显示" autoSize="none" y="10" style="普通说明" var="txt_showOthers" align="left" mouseEnabled="false" mouseChildren="false" x="43" width="66" height="17"/>
			    <Image skin="png.uiWorldBoss.隐藏图标" var="img_hide"/>
			  </Box>
			</SceneModuleView>;
       
      
      public var rankPanel:game.ui.worldBoss.WorldBossRankPanelUI = null;
      
      public var list_BossHead:List = null;
      
      public var check_FastBattle:CheckBox = null;
      
      public var check_auto:CheckBox = null;
      
      public var helpBtn:RuleDescriptionUI = null;
      
      public var box_status:Box = null;
      
      public var txt_statusCD:Label = null;
      
      public var box_showOthers:Box = null;
      
      public var img_show:Image = null;
      
      public var txt_showOthers:Label = null;
      
      public var img_hide:Image = null;
      
      public function WorldBossModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RuleDescriptionUI"] = RuleDescriptionUI;
         viewClassMap["game.ui.worldBoss.WorldBossHeaderUI"] = WorldBossHeaderUI;
         viewClassMap["game.ui.worldBoss.WorldBossRankPanelUI"] = game.ui.worldBoss.WorldBossRankPanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
