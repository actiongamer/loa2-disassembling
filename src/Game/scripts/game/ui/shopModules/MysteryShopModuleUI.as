package game.ui.shopModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.LotteryRenderS5UI;
   import game.ui.shopModules.render.ShopRefreshRenderUI;
   import game.ui.shopModules.render.MysteryShopRenderUI;
   
   public class MysteryShopModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <PanelBgS7 x="-2" y="-5" btnCloseStyle="1"/>
			  <Tab labels="英雄商店,觉醒商店" x="110" y="33" style="TAB长" space="5" var="tab_shop" selectedIndex="0"/>
			  <List x="22" y="97" var="list_items">
			    <MysteryShopRender name="item0" x="51" runtime="game.ui.shopModules.render.MysteryShopRenderUI"/>
			    <MysteryShopRender x="319" name="item1" runtime="game.ui.shopModules.render.MysteryShopRenderUI"/>
			    <MysteryShopRender y="111" name="item2" runtime="game.ui.shopModules.render.MysteryShopRenderUI"/>
			    <MysteryShopRender x="374" y="111" name="item3" runtime="game.ui.shopModules.render.MysteryShopRenderUI"/>
			    <MysteryShopRender x="50" y="221" name="item4" runtime="game.ui.shopModules.render.MysteryShopRenderUI"/>
			    <MysteryShopRender x="321" y="221" name="item5" runtime="game.ui.shopModules.render.MysteryShopRenderUI"/>
			  </List>
			  <Label text="倒计时" autoSize="right" x="301" y="71" width="149" height="18" var="txt_countDown" style="普通说明"/>
			  <LotteryRenderS5 x="454" y="34" var="refreshRender" language="en" lgx="454,121" lgy="34,420" runtime="game.ui.commons.icons.LotteryRenderS5UI"/>
			  <LotteryRenderS5 x="454" y="71" var="resRender" runtime="game.ui.commons.icons.LotteryRenderS5UI"/>
			  <ShopRefreshRender x="286" y="208" var="render_refresh" runtime="game.ui.shopModules.render.ShopRefreshRenderUI"/>
			  <Label text="\l60300004" y="421" height="18" style="普通说明" x="146" align="right" width="200" language="en" lgx="16,146" lgy="421,421"/>
			  <Label text="100/100" y="421" height="18" var="txt_refresh" style="普通说明" x="345" align="center" width="52" language="en" lgx="215,345" lgy="421,421"/>
			  <Label text="免费刷新次数：" y="71" height="18" style="普通说明" x="81" align="right" width="136"/>
			  <Label text="100/100" y="71" height="18" var="txt_freeRefresh" style="普通说明" x="216" align="center" width="52"/>
			  <Label width="171" var="titleTxt" align="center" style="渐变1" y="1" size="14" x="250" mouseChildren="false" mouseEnabled="false"/>
			</PopModuleView>;
       
      
      public var tab_shop:Tab = null;
      
      public var list_items:List = null;
      
      public var txt_countDown:Label = null;
      
      public var refreshRender:LotteryRenderS5UI = null;
      
      public var resRender:LotteryRenderS5UI = null;
      
      public var render_refresh:ShopRefreshRenderUI = null;
      
      public var txt_refresh:Label = null;
      
      public var txt_freeRefresh:Label = null;
      
      public var titleTxt:Label = null;
      
      public function MysteryShopModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS5UI"] = LotteryRenderS5UI;
         viewClassMap["game.ui.shopModules.render.MysteryShopRenderUI"] = MysteryShopRenderUI;
         viewClassMap["game.ui.shopModules.render.ShopRefreshRenderUI"] = ShopRefreshRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
