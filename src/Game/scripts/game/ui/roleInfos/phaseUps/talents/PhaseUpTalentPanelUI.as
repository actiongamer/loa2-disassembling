package game.ui.roleInfos.phaseUps.talents
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.commons.icons.PhaseUpTalentRenderSize64UI;
   
   public class PhaseUpTalentPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="406" height="320">
			  <PanelBgS3 x="0" y="0" width="406" height="320" showLightBottom="true" frameVisible="false" frameStyle="1"/>
			  <Image skin="png.uiRoleInfo.phaseUpTailent.img_bg3" x="13" y="13"/>
			  <Image skin="png.uiRoleInfo.phaseUpTailent.img_arrow" x="180" y="99"/>
			  <Button label="upgrade" x="143.5" style="按钮大绿" y="253" var="btn_submit" labelMargin="45"/>
			  <PhaseUpTalentWealthRender x="195" y="289" var="hasRenderer" runtime="game.ui.roleInfos.phaseUps.talents.PhaseUpTalentWealthRenderUI"/>
			  <Label text="\l30600203" autoSize="none" x="153" align="left" stroke="0x0" var="txt_hadNow" y="294" style="随品质变化"/>
			  <PhaseUpTalentCostRender var="costRender" x="150" y="257" runtime="game.ui.roleInfos.phaseUps.talents.PhaseUpTalentCostRenderUI"/>
			  <PhaseUpTalentRenderSize64 x="59" y="86" var="render1a" runtime="game.ui.commons.icons.PhaseUpTalentRenderSize64UI"/>
			  <PhaseUpTalentRenderSize64 x="283" y="86" var="render1b" runtime="game.ui.commons.icons.PhaseUpTalentRenderSize64UI"/>
			  <Label text="LV.13" x="28" y="69" width="127" height="18" align="center" var="txt_tip1a" bold="false" style="重要提示绿"/>
			  <Label text="LV.13" x="254" y="69" width="127" height="18" align="center" var="txt_tip1b" bold="false" style="重要提示绿"/>
			  <Label text="战斗力999" x="8" y="178" width="165" height="80" align="center" var="txt_tip3a" bold="false" style="重要提示绿" multiline="true" wordWrap="false"/>
			  <Label text="战斗力999" x="234" width="165" height="80" align="center" var="txt_tip3b" bold="false" style="重要提示绿" multiline="true" wordWrap="false" y="178"/>
			  <Label text="需要达到X阶才能升级需要达到X阶才能升级”" x="266" y="259" width="137" height="58" align="left" var="txt_tip6" bold="false" style="不足禁止红" multiline="true" wordWrap="true"/>
			</PopModuleView>;
       
      
      public var btn_submit:Button = null;
      
      public var hasRenderer:game.ui.roleInfos.phaseUps.talents.PhaseUpTalentWealthRenderUI = null;
      
      public var txt_hadNow:Label = null;
      
      public var costRender:game.ui.roleInfos.phaseUps.talents.PhaseUpTalentCostRenderUI = null;
      
      public var render1a:PhaseUpTalentRenderSize64UI = null;
      
      public var render1b:PhaseUpTalentRenderSize64UI = null;
      
      public var txt_tip1a:Label = null;
      
      public var txt_tip1b:Label = null;
      
      public var txt_tip3a:Label = null;
      
      public var txt_tip3b:Label = null;
      
      public var txt_tip6:Label = null;
      
      public function PhaseUpTalentPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.PhaseUpTalentRenderSize64UI"] = PhaseUpTalentRenderSize64UI;
         viewClassMap["game.ui.roleInfos.phaseUps.talents.PhaseUpTalentCostRenderUI"] = game.ui.roleInfos.phaseUps.talents.PhaseUpTalentCostRenderUI;
         viewClassMap["game.ui.roleInfos.phaseUps.talents.PhaseUpTalentWealthRenderUI"] = game.ui.roleInfos.phaseUps.talents.PhaseUpTalentWealthRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
