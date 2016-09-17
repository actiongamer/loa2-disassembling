package game.ui.teams.details
{
   import morn.customs.components.AlertContent;
   import morn.core.components.Label;
   import morn.core.components.RadioGroup;
   import morn.core.components.RadioButton;
   import morn.core.components.TextInput;
   
   public class TeamApplySettingUI extends AlertContent
   {
      
      protected static var uiView:XML = <AlertContent width="382" height="250">
			  <Label text="自动批准任何人" autoSize="none" x="100" y="122" style="普通说明" width="241" height="18" var="txt_tip3" align="left"/>
			  <RadioGroup x="63" y="51" var="rg" selectedIndex="2">
			    <RadioButton selected="true" style="CheckBox普通" var="cb_0" name="item0"/>
			    <RadioButton y="34" style="CheckBox普通" var="cb_1" name="item1"/>
			    <RadioButton y="68" style="CheckBox普通" var="cb_2" name="item2"/>
			    <RadioButton y="102" style="CheckBox普通" var="cb_3" name="item3"/>
			  </RadioGroup>
			  <Label text="不自动批准任何人" autoSize="none" x="100" y="156" style="普通说明" width="241" height="18" var="txt_tip4" align="left"/>
			  <Label text="自动批准战斗力大于" autoSize="none" y="88" style="普通说明" height="18" var="txt_tip2" align="left" x="97"/>
			  <TextInput var="fight" maxChars="12" autoSize="none" width="78" height="26" skin="png.a5.bgs.输入框" margin="2,3" style="普通说明" align="center" x="210" y="84"/>
			  <Label text="自动批准        级以下的玩家" autoSize="none" x="96" y="53" style="普通说明" height="18" var="txt_tip1" align="left"/>
			  <TextInput x="148" y="50" var="level" maxChars="12" width="27" height="26" skin="png.a5.bgs.输入框" margin="2,3" style="普通说明" align="center"/>
			</AlertContent>;
       
      
      public var txt_tip3:Label = null;
      
      public var rg:RadioGroup = null;
      
      public var cb_0:RadioButton = null;
      
      public var cb_1:RadioButton = null;
      
      public var cb_2:RadioButton = null;
      
      public var cb_3:RadioButton = null;
      
      public var txt_tip4:Label = null;
      
      public var txt_tip2:Label = null;
      
      public var fight:TextInput = null;
      
      public var txt_tip1:Label = null;
      
      public var level:TextInput = null;
      
      public function TeamApplySettingUI()
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
