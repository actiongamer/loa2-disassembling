package game.ui.guildModules.appoint
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.ComboBox;
   import morn.core.components.Button;
   
   public class GuildOfficerListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="315" height="30">
			  <Label text="副会长" autoSize="left" x="10" y="7" var="txt_posName" style="升级后加底标题"/>
			  <ComboBox labels="label1,label2" x="60" y="3" width="176" height="23" var="cbx_name" sizeGrid="2,2,50,1" style="Combobox普通" scrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" lgx="60,60,60,60,60,60,60,100" lgy="3,3,3,3,3,3,3,3" language="ru"/>
			  <Button label="\l11006" stateNum="1" buttonMode="true" labelFont="FZZHB" x="239" y="3" sizeGrid="3,3,3,3" width="100" height="24" var="btn_zr" style="按钮小绿" lgx="239,239,239,239,239,239,239,279" lgy="3,3,3,3,3,3,3,3" language="ru"/>
			</View>;
       
      
      public var txt_posName:Label = null;
      
      public var cbx_name:ComboBox = null;
      
      public var btn_zr:Button = null;
      
      public function GuildOfficerListRenderUI()
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
