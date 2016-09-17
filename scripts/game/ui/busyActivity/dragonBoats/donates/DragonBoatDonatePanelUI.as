package game.ui.busyActivity.dragonBoats.donates
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Button;
   import morn.core.components.List;
   
   public class DragonBoatDonatePanelUI extends View
   {
      
      protected static var uiView:XML = <View width="790" height="444">
			  <Image skin="png.uiDragonBoat.donates.img_bg" x="7" y="1"/>
			  <Image skin="jpg.uiPreview.端午-公会捐赠" x="-304" y="-225" alpha="0.5"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_title_log" width="199" align="center" x="522" y="143" backgroundColor="0xcfbeaf" height="20" style="小标题"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_tip_right1" width="283" align="left" x="479" y="16" backgroundColor="0xcfbeaf" height="105" style="普通说明" multiline="true" wordWrap="true"/>
			  <Label text="我的积分" autoSize="none" y="19" style="渐变1" width="434" height="22" align="center" size="14" var="txt_cd" x="18"/>
			  <PageBarS2 x="556" y="399" var="pageBarRightUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_list_title_1" width="108" align="center" x="15" y="66" backgroundColor="0xcfbeaf" height="20" style="小标题"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_list_title_2" width="108" align="center" x="111" y="66" backgroundColor="0xcfbeaf" height="20" style="小标题"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_list_title_3" width="108" align="center" x="219" y="66" backgroundColor="0xcfbeaf" height="20" style="小标题"/>
			  <PageBarS2 x="165" y="399" var="pageBarLeftUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Button label="按钮" x="345" style="按钮中黄" var="btn_request" y="391"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_request_cd" width="108" align="center" x="334" y="421" backgroundColor="0xcfbeaf" height="20" style="普通说明"/>
			  <List x="488" y="166" repeatX="1" repeatY="5" var="list_log" spaceX="0" spaceY="2">
			    <DragonBoatDonateLogRender name="render" runtime="game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateLogRenderUI"/>
			  </List>
			  <List x="11" y="90" var="list_donate" repeatY="4" spaceY="2">
			    <DragonBoatDonateRender name="render" runtime="game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateRenderUI"/>
			  </List>
			</View>;
       
      
      public var txt_title_log:Label = null;
      
      public var txt_tip_right1:Label = null;
      
      public var txt_cd:Label = null;
      
      public var pageBarRightUI:PageBarS2UI = null;
      
      public var txt_list_title_1:Label = null;
      
      public var txt_list_title_2:Label = null;
      
      public var txt_list_title_3:Label = null;
      
      public var pageBarLeftUI:PageBarS2UI = null;
      
      public var btn_request:Button = null;
      
      public var txt_request_cd:Label = null;
      
      public var list_log:List = null;
      
      public var list_donate:List = null;
      
      public function DragonBoatDonatePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateLogRenderUI"] = DragonBoatDonateLogRenderUI;
         viewClassMap["game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateRenderUI"] = DragonBoatDonateRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
