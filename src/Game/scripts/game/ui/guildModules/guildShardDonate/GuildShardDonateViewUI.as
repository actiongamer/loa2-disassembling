package game.ui.guildModules.guildShardDonate
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Panel;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class GuildShardDonateViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="600" height="400" style="渐变黄">
			  <Image skin="png.uiGuildModule.heroShard.底图" x="0" y="0"/>
			  <Image skin="png.uiGuildModule.heroShard.捐献记录框" x="5" y="194"/>
			  <Image skin="png.uiGuildModule.heroShard.小标题底" x="31" y="8"/>
			  <Label text="\l999004006" autoSize="left" x="4" y="11" style="二级框标题" width="222" height="24" align="center"/>
			  <Image skin="png.uiGuildModule.heroShard.领取碎片按钮下底" x="1" y="141"/>
			  <List x="17" y="41" var="list_chest" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" spaceY="4" width="203" height="103" repeatX="3" spaceX="3">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Button x="75" y="156" style="按钮中绿" var="btn_donate" label="\l999004019"/>
			  <Panel x="11" y="225" width="213" height="170" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="logPanel">
			    <Label autoSize="left" style="普通说明" var="logTxt" x="0" y="7" width="197" wordWrap="true" multiline="true" leading="0"/>
			  </Panel>
			  <Button x="9" y="407" style="按钮大黄" label="\l999004009 (1/1)" width="120" height="33" var="btn_ask"/>
			  <Label text="00:00:00" autoSize="left" x="141" y="414" style="普通说明" width="82" height="20" var="txtAskCD"/>
			  <Panel x="232" y="4" width="531" height="467" var="listDonate" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3"/>
			  <Label text="\l999004010 1/0" autoSize="left" x="12" y="446" style="重要提示黄" width="208" height="20" var="txtDonateNum"/>
			  <Image skin="png.uiGuildModule.heroShard.小标题底" x="30" y="197"/>
			  <Label text="\l999004007" autoSize="left" x="5" y="200" style="二级框标题" width="222" height="24" align="center"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="117" y="402" var="img_redPoint_1"/>
			</FadeView>;
       
      
      public var list_chest:List = null;
      
      public var btn_donate:Button = null;
      
      public var logPanel:Panel = null;
      
      public var logTxt:Label = null;
      
      public var btn_ask:Button = null;
      
      public var txtAskCD:Label = null;
      
      public var listDonate:Panel = null;
      
      public var txtDonateNum:Label = null;
      
      public var img_redPoint_1:Image = null;
      
      public function GuildShardDonateViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
