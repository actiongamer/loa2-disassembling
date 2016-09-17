package game.ui.resourceDg
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS56UI;
   import morn.core.components.Image;
   import morn.core.components.Box;
   
   public class ResBossSelectPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="376" height="506">
			  <PanelBgS3 x="0" y="0" width="376" height="506" frameStyle="2"/>
			  <Image skin="png.uiMainCitys.resDg.img_bigbg" x="25" y="175" sizeGrid="5,5,5,5" width="326" height="308"/>
			  <List x="59" y="54" repeatX="3" spaceX="12" var="list_boss">
			    <ResBossRender name="render" runtime="game.ui.resourceDg.ResBossRenderUI"/>
			  </List>
			  <Button skin="png.a5.btns.btn_longBar" x="324" y="87.5" var="btn_right"/>
			  <Button skin="png.a5.btns.btn_longBar" x="51" y="87.5" scaleX="-1" var="btn_left"/>
			  <Label autoSize="left" x="36" y="188" style="加底标题" align="left" text="\l41400008" height="18"/>
			  <Label text="普通说明" autoSize="none" x="36" y="208" style="普通说明" width="296" height="71" var="desc"/>
			  <Label text="\l41400009" autoSize="none" x="37" y="288" style="加底标题" width="120" align="center" height="18"/>
			  <Label text="\l41400010" autoSize="none" x="206" y="288" style="加底标题" width="140" align="left" height="18"/>
			  <WealthRenderS56 x="61" y="310" var="item_win" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  <WealthRenderS56 x="206" y="310" var="item_first0" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  <Label text="普通说明" autoSize="none" x="47.5" y="394" style="普通说明" width="287" align="left" var="txt_tips" size="14" multiline="true" wordWrap="true" height="52"/>
			  <Image skin="png.uiMainCitys.resDg.img_line" x="10" y="277"/>
			  <Image skin="png.uiMainCitys.resDg.img_line" x="11" y="382" var="img_line2"/>
			  <Box x="53" y="429" var="fight_btn" centerX="0" language="en" lgx="53,53" lgy="440,440">
			    <Button label="挑战" style="按钮大绿" var="btn_fight" labelMargin="30"/>
			    <Image skin="png.uiMainCitys.resDg.img_go" x="13" y="3" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			  <Box x="203" y="429" var="saodang_btn" lgx="203,203" lgy="440,440" language="en">
			    <Button label="一键获得" style="按钮大黄" var="btn_saodang" labelMargin="30"/>
			    <Image skin="png.uiMainCitys.resDg.img_go" x="12" y="3" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			  <Label text="pageBarS2" autoSize="none" x="205" y="374" style="普通说明" width="286" var="label_buy" height="20"/>
			  <WealthRenderS56 x="278" y="310" var="item_first1" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  <Image skin="png.uiMainCitys.resDg.img_get" x="229" y="301" var="img_get"/>
			  <Button skin="png.a5.comps.numBars.btn_plus" x="246" y="393" var="btn_buytimes" stateNum="1"/>
			</PanelView>;
       
      
      public var list_boss:List = null;
      
      public var btn_right:Button = null;
      
      public var btn_left:Button = null;
      
      public var desc:Label = null;
      
      public var item_win:WealthRenderS56UI = null;
      
      public var item_first0:WealthRenderS56UI = null;
      
      public var txt_tips:Label = null;
      
      public var img_line2:Image = null;
      
      public var fight_btn:Box = null;
      
      public var btn_fight:Button = null;
      
      public var saodang_btn:Box = null;
      
      public var btn_saodang:Button = null;
      
      public var label_buy:Label = null;
      
      public var item_first1:WealthRenderS56UI = null;
      
      public var img_get:Image = null;
      
      public var btn_buytimes:Button = null;
      
      public function ResBossSelectPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         viewClassMap["game.ui.resourceDg.ResBossRenderUI"] = ResBossRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
