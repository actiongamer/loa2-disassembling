package game.ui.TencentModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.customs.components.GRect;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class TencentRenewalModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <PanelBgS3 x="5" y="2" width="618" height="449" frameVisible="false"/>
			  <Image skin="png.a5.comps.img_block" x="35" y="118" width="556" height="315" var="img_renewalBg"/>
			  <Image skin="png.uiTencent.分割线2" x="17" y="148"/>
			  <Image skin="png.uiTencent.线2" x="29" y="335"/>
			  <Image skin="png.a5.comps.img_block" x="15" y="40" width="595" height="123" var="img_bg"/>
			  <Image skin="png.uiTencent.分割线2" x="16" y="148"/>
			  <Image skin="png.uiTencent.标题头" x="162" y="161"/>
			  <Image skin="png.a5.comps.img_block" x="231" y="362" width="179" height="36" var="btn_charge_blue"/>
			  <Label text="亲爱的默默\n\n蓝钻" autoSize="none" x="143" y="202" style="普通说明" width="366" height="61" leading="3" var="label_hint"/>
			  <Label autoSize="none" x="155" y="403" style="普通说明" leading="3" align="center" width="329" text="备注：只有通过本面板的按钮才能领取" height="20" size="14" var="label_ps"/>
			  <List x="214" y="275" repeatX="3" spaceX="20" var="list_rewards">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			  <Image skin="png.a5.comps.img_block" x="266" y="167" width="98" height="19" var="img_title2"/>
			  <Label text="更多特权，请关注" autoSize="none" x="297" y="43" style="普通说明" width="309" height="20" align="right" var="txt_toQQVipOffical"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="440" y="39" width="164" height="28" var="txt_toQQVipOfficalBg"/>
			  <Image skin="png.a5.comps.img_block" x="265" y="363" width="110" height="34" var="btn_charge_yellow"/>
			  <Button label="领取奖励" x="260.5" style="按钮大绿" y="363" var="btn_get"/>
			</PopModuleView>;
       
      
      public var img_renewalBg:Image = null;
      
      public var img_bg:Image = null;
      
      public var btn_charge_blue:Image = null;
      
      public var label_hint:Label = null;
      
      public var label_ps:Label = null;
      
      public var list_rewards:List = null;
      
      public var img_title2:Image = null;
      
      public var txt_toQQVipOffical:Label = null;
      
      public var txt_toQQVipOfficalBg:GRect = null;
      
      public var btn_charge_yellow:Image = null;
      
      public var btn_get:Button = null;
      
      public function TencentRenewalModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
