package game.ui.teamGuajiScenes.mains
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.customs.components.GCircle;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class CurChallengePanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="182" height="333">
			  <Image skin="png.uiTeamGuajis.底框" x="-2" y="-4"/>
			  <Image skin="png.uiTeamGuajis.蓝底01" x="5" y="3"/>
			  <Image skin="png.uiTeamGuajis.蓝底02" x="5" y="108"/>
			  <List x="11" y="47" repeatX="3" spaceX="4" var="list">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="可能掉落:" autoSize="none" x="12" y="25" style="普通说明" var="txt_tip2" width="88" height="18"/>
			  <Label text="当前难度:困难" autoSize="none" x="12" y="5" style="普通说明" var="txt_tip1" width="173" height="20" align="left"/>
			  <Label text="当前难度:困难" autoSize="none" x="2" y="109" style="普通说明" var="txt_tip3" width="173" height="20" align="center"/>
			  <Button label="按钮" x="36" style="按钮大黄" y="234" var="btn_killBoss"/>
			  <Box x="54" y="139" buttonMode="true">
			    <Box var="box_head">
			      <Image skin="png.uiTeamGuajis.BOSS头像框01"/>
			      <Image skin="png.uiTeamGuajis.BOSS头像框02" x="6" y="7"/>
			      <Image skin="png.a5.comps.img_block" x="6" y="6" width="59" height="59" var="img_bossHead"/>
			      <GCircle fillAlpha="0.5" lineAlpha="0" x="5" y="5" width="59" height="59" var="iconMask"/>
			      <Image skin="png.uiTeamGuajis.BOSS头像框02" x="6" y="6"/>
			    </Box>
			    <Image skin="png.uiTeamGuajis.已击杀" x="26" y="0" var="txt_dead"/>
			  </Box>
			  <Label text="boss名字" autoSize="none" x="6" y="207" style="普通说明" var="txt_bossName" width="173" height="20" align="center"/>
			  <BossSay x="-95" y="125" var="bossSay" runtime="game.ui.teamGuajiScenes.mains.BossSayUI"/>
			  <Button label="切换关卡" x="36" style="按钮大绿" y="276" var="btn_changeLvl"/>
			</FadeView>;
       
      
      public var list:List = null;
      
      public var txt_tip2:Label = null;
      
      public var txt_tip1:Label = null;
      
      public var txt_tip3:Label = null;
      
      public var btn_killBoss:Button = null;
      
      public var box_head:Box = null;
      
      public var img_bossHead:Image = null;
      
      public var iconMask:GCircle = null;
      
      public var txt_dead:Image = null;
      
      public var txt_bossName:Label = null;
      
      public var bossSay:game.ui.teamGuajiScenes.mains.BossSayUI = null;
      
      public var btn_changeLvl:Button = null;
      
      public function CurChallengePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         viewClassMap["game.ui.teamGuajiScenes.mains.BossSayUI"] = game.ui.teamGuajiScenes.mains.BossSayUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
