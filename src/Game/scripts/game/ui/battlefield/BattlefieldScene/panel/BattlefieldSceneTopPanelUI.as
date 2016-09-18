package game.ui.battlefield.BattlefieldScene.panel
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.icons.BuffRenderS1UI;
   
   public class BattlefieldSceneTopPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="90">
			  <Image skin="png.uiBattlefieldScenes.battlefieldSceneModule.img_titleBg" x="0" y="-1" width="604" height="93"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldSceneModule.img_timeBg" x="199" y="5"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldSceneModule.img_blueBg" x="11" y="-24"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldSceneModule.img_redBg" x="484" y="-25"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldSceneModule.img_blueIcon" x="44" y="2" width="53" height="57"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldSceneModule.img_redIcon" x="518" y="0"/>
			  <Label text="\l50500901" autoSize="none" x="123" y="7" style="渐变1" width="104" height="22" align="left"/>
			  <Label text="\l50500902" autoSize="none" x="388" y="7" style="渐变1" width="104" height="22" align="right"/>
			  <Label text="256321" autoSize="none" x="104" y="35" style="渐变蓝" width="104" align="center" height="23" var="txt_blueScore"/>
			  <Label text="256321" autoSize="none" x="410" y="35" style="渐变紫" width="104" align="center" height="23" var="txt_redScore"/>
			  <Label text="战场时间: 10:00" autoSize="none" x="198.5" y="12" style="渐变1" width="205" height="26" align="center" size="18" var="txt_leftTime"/>
			  <Label text="10/10" autoSize="none" x="19" y="58" style="下划线黄色" width="104" align="center" size="14" var="txt_blueTeamNum"/>
			  <Label text="10/10" autoSize="none" x="492" y="58" style="下划线黄色" width="104" align="center" size="14" var="txt_redTeamNum"/>
			  <Button label="战报信息" x="255" y="51" style="按钮中绿" var="btn_info"/>
			  <Label text="总击杀：100" autoSize="none" x="88" y="62" style="渐变1" width="137" height="22" align="center" var="txt_blueKill"/>
			  <Label text="总击杀：100" autoSize="none" x="389" y="62" style="渐变1" width="137" height="22" align="center" var="txt_redKill"/>
			  <BuffRenderS1 x="0" y="45" var="buff1" runtime="game.ui.commons.icons.BuffRenderS1UI"/>
			  <BuffRenderS1 x="580" y="45" var="buff2" runtime="game.ui.commons.icons.BuffRenderS1UI"/>
			  <Label autoSize="none" x="-46" y="90" style="普通说明" align="right" size="12" width="119" height="20" var="myNameLeftTxt" text="一二三四五六七八九"/>
			  <Label autoSize="none" x="539" y="90" style="普通说明" align="left" size="12" width="119" height="20" var="myNameRightTxt" text="一二三四五六七八九"/>
			</View>;
       
      
      public var txt_blueScore:Label = null;
      
      public var txt_redScore:Label = null;
      
      public var txt_leftTime:Label = null;
      
      public var txt_blueTeamNum:Label = null;
      
      public var txt_redTeamNum:Label = null;
      
      public var btn_info:Button = null;
      
      public var txt_blueKill:Label = null;
      
      public var txt_redKill:Label = null;
      
      public var buff1:BuffRenderS1UI = null;
      
      public var buff2:BuffRenderS1UI = null;
      
      public var myNameLeftTxt:Label = null;
      
      public var myNameRightTxt:Label = null;
      
      public function BattlefieldSceneTopPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.BuffRenderS1UI"] = BuffRenderS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
