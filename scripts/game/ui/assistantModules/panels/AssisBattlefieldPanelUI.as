package game.ui.assistantModules.panels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Button;
   import morn.core.components.CheckBox;
   import morn.core.components.Label;
   import morn.core.components.TextInput;
   import morn.core.components.RadioGroup;
   import morn.core.components.RadioButton;
   
   public class AssisBattlefieldPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView mouseEnabled="false" width="383" height="545">
			  <PanelBgS3 width="371" height="540" showLightBottom="true" frameVisible="false" x="4.5" y="3" frameStyle="1"/>
			  <Button label="保存设置" x="149" style="按钮中绿" y="499" var="btn_save"/>
			  <Image skin="png.uiAssistantModules.img_baseBg" x="16" y="35"/>
			  <Panel width="344" mouseEnabled="false" x="18" y="38" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" height="443">
			    <Image skin="png.uiAssistantModules.img_lineBg3" x="-19" y="217"/>
			    <Image skin="png.uiAssistantModules.img_lineBg1" x="0" y="10"/>
			    <Image skin="png.uiAssistantModules.img_lineBg3" x="-19" y="92" mouseEnabled="false" mouseChildren="false"/>
			    <Image skin="png.uiAssistantModules.img_lineBg1" x="0" y="317"/>
			    <Image skin="png.uiAssistantModules.img_lineBg3" x="-19" y="335"/>
			    <Image skin="png.uiAssistantModules.img_lineBg1" x="0" y="74"/>
			    <Image skin="png.uiAssistantModules.img_lineBg1" x="0" y="197"/>
			    <CheckBox label="优先攻击身边的敌对玩家（先攻击后采矿）" x="20" y="100" selected="false" style="CheckBox普通" var="check_attack"/>
			    <CheckBox label="不攻击带有复仇BUFF的玩家" x="20" y="124" selected="false" style="CheckBox普通" var="check_notAttackBuff"/>
			    <Image skin="png.uiAssistantModules.img_lineBg3" x="-19" y="30"/>
			    <CheckBox label="攻击比自身战力低                  的玩家" x="20" y="148" selected="false" style="CheckBox普通" var="check_fightValue"/>
			    <Label text="攻击设置" autoSize="none" y="73" style="二级框标题" x="7" var="txt_60200013"/>
			    <Image skin="png.a5.comps.numBars.img_numBg" x="140" y="146" width="64" height="23" lgx="205,140"/>
			    <TextInput text="1000000" x="145" y="149" width="53" height="22" var="txt_fightValue" align="center" style="普通说明" restrict="0-9" lgx="210,145"/>
			    <CheckBox label="血量低于          %时，停止攻击" x="20" y="171" selected="false" style="CheckBox普通" var="check_lowHpPer"/>
			    <Image skin="png.a5.comps.numBars.img_numBg" x="92" y="169" width="34" height="23" lgx="194,92" language="en"/>
			    <TextInput text="20" x="91" y="172" width="35" height="22" var="txt_lowHpPer" align="center" style="普通说明" restrict="0-9" lgx="192,91" language="en"/>
			    <Label text="采矿模式" autoSize="none" y="197" style="二级框标题" x="7" var="txt_60200018"/>
			    <RadioGroup x="20" y="225" direction="vertical" selectedIndex="-1" var="radio_gatherMode">
			      <RadioButton label="前往离自己阵营最近的点采矿" style="Radio普通" selected="false" name="item0" var="radio_60200019"/>
			      <RadioButton label="前往离敌对阵营最近的点采矿" style="Radio普通" selected="false" y="24" name="item1" var="radio_60200020"/>
			      <RadioButton label="前往右边的矿点采矿" style="Radio普通" selected="false" y="48" name="item2" var="radio_60200021"/>
			      <RadioButton label="前往中间的矿点采矿" style="Radio普通" selected="false" y="72" name="item3" var="radio_60200022"/>
			    </RadioGroup>
			    <CheckBox label="自动单人报名" x="20" y="44" selected="false" style="CheckBox普通" var="check_autoLineUp"/>
			    <Label text="基础设置" autoSize="none" y="10" style="二级框标题" x="7" var="txt_60200001"/>
			    <Label text="夺旗模式" autoSize="none" y="316" style="二级框标题" x="7" var="txt_60200023"/>
			    <RadioGroup x="20" y="344" direction="vertical" selectedIndex="-1" var="radio_flagMode">
			      <RadioButton label="前往上方战旗点夺旗" style="Radio普通" selected="false" name="item0" var="radio_60200024"/>
			      <RadioButton label="前往下方战旗点夺旗" style="Radio普通" selected="false" y="24" name="item1" var="radio_60200025"/>
			      <RadioButton label="为阵营提高buff只杀魔物不夺旗" style="Radio普通" selected="false" name="item2" x="0" y="49" var="radio_60200027"/>
			    </RadioGroup>
			    <CheckBox label="上方魔物" x="52" y="420" selected="false" style="CheckBox普通" var="check_monUp"/>
			    <CheckBox label="下方魔物" x="160" y="420" selected="false" style="CheckBox普通" var="check_monDown"/>
			    <CheckBox label="左边魔物" x="52" y="445" selected="false" style="CheckBox普通" var="check_monLeft"/>
			    <CheckBox label="右边魔物" x="160" y="445" selected="false" style="CheckBox普通" var="check_monRight"/>
			  </Panel>
			</PanelView>;
       
      
      public var btn_save:Button = null;
      
      public var check_attack:CheckBox = null;
      
      public var check_notAttackBuff:CheckBox = null;
      
      public var check_fightValue:CheckBox = null;
      
      public var txt_60200013:Label = null;
      
      public var txt_fightValue:TextInput = null;
      
      public var check_lowHpPer:CheckBox = null;
      
      public var txt_lowHpPer:TextInput = null;
      
      public var txt_60200018:Label = null;
      
      public var radio_gatherMode:RadioGroup = null;
      
      public var radio_60200019:RadioButton = null;
      
      public var radio_60200020:RadioButton = null;
      
      public var radio_60200021:RadioButton = null;
      
      public var radio_60200022:RadioButton = null;
      
      public var check_autoLineUp:CheckBox = null;
      
      public var txt_60200001:Label = null;
      
      public var txt_60200023:Label = null;
      
      public var radio_flagMode:RadioGroup = null;
      
      public var radio_60200024:RadioButton = null;
      
      public var radio_60200025:RadioButton = null;
      
      public var radio_60200027:RadioButton = null;
      
      public var check_monUp:CheckBox = null;
      
      public var check_monDown:CheckBox = null;
      
      public var check_monLeft:CheckBox = null;
      
      public var check_monRight:CheckBox = null;
      
      public function AssisBattlefieldPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
