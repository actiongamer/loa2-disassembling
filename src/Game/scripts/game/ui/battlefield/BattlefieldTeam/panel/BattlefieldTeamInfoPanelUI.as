package game.ui.battlefield.BattlefieldTeam.panel
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import game.ui.battlefield.BattlefieldTeam.render.BattlefieldMemberRenderUI;
   
   public class BattlefieldTeamInfoPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="354" height="500">
			  <Image skin="png.uiBattlefields.battlefieldTeamModule.img_teamTitleBg" x="0" y="0"/>
			  <Image skin="png.a5.comps.img_block" x="0" y="39" var="img_bg"/>
			  <List x="3" y="51" repeatY="3" var="list_teamMems" spaceY="17">
			    <BattlefieldMemberRender name="render" runtime="game.ui.battlefield.BattlefieldTeam.render.BattlefieldMemberRenderUI"/>
			  </List>
			  <Button label="\l50500048" x="136" y="458" style="按钮中黄" var="btn_exit" width="82" height="26"/>
			  <Button label="\l50500032" x="35" y="458" style="按钮中绿" var="btn_start"/>
			  <Button label="\l50500033" x="136" y="458" style="按钮中黄" var="btn_dismiss"/>
			  <Label text="\l50500026" autoSize="none" x="7" y="5" style="普通说明" width="52" align="left" height="20"/>
			  <Label text="队伍上限3/3" autoSize="none" x="207" y="5" style="普通说明" width="137" align="right" var="txt_teamLimit" height="20"/>
			  <Box x="41" y="368" var="box_inTeam">
			    <Image skin="png.uiBattlefields.img_applyedBg"/>
			    <Label autoSize="none" x="52" y="43" style="渐变绿" align="center" bold="true" visible="true" width="168" height="34" var="txt_alert" text="20:30" size="25"/>
			    <Image skin="png.uiBattlefields.img_applyed" x="103" y="10"/>
			    <Button label="\l50500014" x="95" y="90" style="按钮中黄" var="btn_cancel"/>
			  </Box>
			  <Button label="\l41210091" x="241" y="458" style="按钮中黄" var="btn_invite"/>
			</PanelView>;
       
      
      public var img_bg:Image = null;
      
      public var list_teamMems:List = null;
      
      public var btn_exit:Button = null;
      
      public var btn_start:Button = null;
      
      public var btn_dismiss:Button = null;
      
      public var txt_teamLimit:Label = null;
      
      public var box_inTeam:Box = null;
      
      public var txt_alert:Label = null;
      
      public var btn_cancel:Button = null;
      
      public var btn_invite:Button = null;
      
      public function BattlefieldTeamInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldTeam.render.BattlefieldMemberRenderUI"] = BattlefieldMemberRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
