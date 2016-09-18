package game.ui.familyBosses
{
   import morn.customs.components.SceneModuleView;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.CheckBox;
   import game.ui.commons.comps.others.RuleDescriptionUI;
   import morn.core.components.Image;
   import game.ui.familyBosses.render.PropBaseRenderUI;
   
   public class FamilyBossModuleUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="1000" height="600">
			  <FamilyBossRankPanel x="0" top="180" var="rankPanel" runtime="game.ui.familyBosses.FamilyBossRankPanelUI"/>
			  <Box x="302" y="480" centerX="0" bottom="80" var="box_guwu">
			    <Label text="10:10:00" autoSize="none" x="60" y="63" style="下划线黄色" align="center" width="114" height="20" var="txt_stimuCD"/>
			    <Image skin="png.uiFamilyBosses.鼓舞-透明底" y="65" x="0"/>
			    <List x="73" y="70" repeatX="2" var="list_gwAttr" centerX="0">
			      <PropBaseRender name="render" runtime="game.ui.familyBosses.render.PropBaseRenderUI"/>
			    </List>
			    <Button skin="png.uiFamilyBosses.btn_gjguwu" x="212" var="btn_gjguwu" stateNum="1" toolTip="\l40740013"/>
			    <Button skin="png.uiFamilyBosses.btn_guwu" x="87" stateNum="1" var="btn_gw" toolTip="\l40740012"/>
			    <Label text="\l40740010" autoSize="none" y="44" style="渐变4" align="center" mouseEnabled="false" mouseChildren="false" x="57" size="14" width="124" height="20"/>
			    <Label text="\l40740011" autoSize="none" y="44" style="渐变4" align="center" mouseEnabled="false" mouseChildren="false" x="182" size="14" width="124" height="20"/>
			  </Box>
			  <List y="34" repeatY="2" var="list_BossHead" right="-5" x="605" spaceY="-14">
			    <FamilyBossHeader right="10" name="render" runtime="game.ui.familyBosses.FamilyBossHeaderUI"/>
			  </List>
			  <Box y="468" right="60" x="746">
			    <Image skin="png.uiFamilyBosses.蓝色透明底-暗" x="6" y="28"/>
			    <Image skin="png.uiFamilyBosses.蓝色透明底-暗"/>
			    <CheckBox label="\l40740006" x="11" style="Radio普通" selected="true" var="check_FastBattle" labelMargin="12" y="2"/>
			    <CheckBox label="\l40740007" x="10" y="31" style="Radio普通" selected="true" var="check_auto" labelMargin="12"/>
			  </Box>
			  <RuleDescription y="2" right="0" var="helpBtn" runtime="game.ui.commons.comps.others.RuleDescriptionUI"/>
			  <Box x="222" y="8" centerX="0" var="box_status">
			    <Image skin="png.uiFamilyBosses.剩余时间底" x="88" mouseEnabled="false" mouseChildren="false"/>
			    <Label text="活动剩余时间：12:12：12" autoSize="none" y="3" style="渐变1" width="650" height="34" var="txt_statusCD" centerX="0" align="center" mouseEnabled="false" mouseChildren="false"/>
			  </Box>
			  <DamageRewardShowPanel y="205" var="rwdShowPanel" right="0" runtime="game.ui.familyBosses.DamageRewardShowPanelUI"/>
			  <Box x="112" y="139" buttonMode="true" mouseChildren="false" var="box_showOthers">
			    <Image skin="png.uiFamilyBosses.显示底" x="12" y="4"/>
			    <Image skin="png.uiFamilyBosses.显示图标" var="img_show"/>
			    <Label text="显示" autoSize="none" y="10" style="普通说明" var="txt_showOthers" align="left" mouseEnabled="false" mouseChildren="false" x="43" width="66" height="17"/>
			    <Image skin="png.uiFamilyBosses.隐藏图标" var="img_hide"/>
			  </Box>
			</SceneModuleView>;
       
      
      public var rankPanel:game.ui.familyBosses.FamilyBossRankPanelUI = null;
      
      public var box_guwu:Box = null;
      
      public var txt_stimuCD:Label = null;
      
      public var list_gwAttr:List = null;
      
      public var btn_gjguwu:Button = null;
      
      public var btn_gw:Button = null;
      
      public var list_BossHead:List = null;
      
      public var check_FastBattle:CheckBox = null;
      
      public var check_auto:CheckBox = null;
      
      public var helpBtn:RuleDescriptionUI = null;
      
      public var box_status:Box = null;
      
      public var txt_statusCD:Label = null;
      
      public var rwdShowPanel:game.ui.familyBosses.DamageRewardShowPanelUI = null;
      
      public var box_showOthers:Box = null;
      
      public var img_show:Image = null;
      
      public var txt_showOthers:Label = null;
      
      public var img_hide:Image = null;
      
      public function FamilyBossModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RuleDescriptionUI"] = RuleDescriptionUI;
         viewClassMap["game.ui.familyBosses.DamageRewardShowPanelUI"] = game.ui.familyBosses.DamageRewardShowPanelUI;
         viewClassMap["game.ui.familyBosses.FamilyBossHeaderUI"] = FamilyBossHeaderUI;
         viewClassMap["game.ui.familyBosses.FamilyBossRankPanelUI"] = game.ui.familyBosses.FamilyBossRankPanelUI;
         viewClassMap["game.ui.familyBosses.render.PropBaseRenderUI"] = PropBaseRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
