package game.ui.TencentModule.view
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.TencentModule.render.TencentVipRewardRenderUI;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class TencentVipRewardViewUI extends View
   {
      
      protected static var uiView:XML = <View width="595" height="473">
			  <Image skin="png.uiTencent.右金属框" x="371" y="117" sizeGrid="28.5,33,33,28.5" width="203" height="285"/>
			  <Button skin="png.a5.comps.img_block" x="137" y="439" var="btn_charge" stateNum="1" width="111" height="34"/>
			  <Button skin="png.a5.comps.img_block" x="313" y="439" var="btn_chargeYearly" stateNum="1" width="138" height="34"/>
			  <Image skin="png.a5.comps.img_block" x="-8" y="86" var="img_become" width="69" height="73"/>
			  <List x="17" y="160" height="257" spaceY="2" width="339" var="listDay">
			    <TencentVipRewardRender x="0" y="0" name="render" runtime="game.ui.TencentModule.render.TencentVipRewardRenderUI"/>
			  </List>
			  <Box x="378" y="118">
			    <Image skin="png.uiTencent.daily.标题头" x="0" y="0"/>
			    <Label y="34" style="普通说明" bold="false" width="187" autoSize="none" align="center" text="每日额外获赠" x="1" size="13"/>
			    <List x="7" y="58" repeatX="3" spaceX="4" var="list_yearly">
			      <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			    </List>
			    <Image skin="png.a5.comps.img_block" x="47" y="7" var="img_vipYearly" height="19" width="98"/>
			  </Box>
			  <Box x="378" y="239">
			    <Image skin="png.uiTencent.daily.标题头2"/>
			    <List x="7" y="58" repeatX="3" spaceX="4" var="list_yearlyLux">
			      <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			    </List>
			    <Image skin="png.a5.comps.img_block" x="52" y="10" var="img_vipYearlyLux" width="82" height="19"/>
			    <Label y="36" style="普通说明" bold="false" width="187" autoSize="none" align="center" text="每日额外获赠" size="13"/>
			  </Box>
			  <Button label="领取" x="431" y="362" style="按钮中绿" var="btn_getReward"/>
			  <Label text="&lt;font color='#ffe491'>每日赠送&lt;/font>" autoSize="none" x="73" y="111" style="普通说明" size="15" bold="false" width="260" var="label_title1" height="25" align="center"/>
			  <Label text="&lt;font color='#ffbb6a'>黄钻用户升级&lt;/font>&lt;font color='#ffea5b'>双倍奖励！&lt;/font>&lt;font color='#ffbb6a'>全场商品&lt;/font>&lt;font color='#ffea5b'>8折&lt;/font>&lt;font color='#ffbb6a'>优惠&lt;/font>" autoSize="none" x="67" y="136" style="普通说明" size="15" bold="false" width="269" height="20" letterSpacing="-1" var="label_title3" align="center"/>
			  <Image skin="png.uiTencent.分割线" x="13" y="415"/>
			</View>;
       
      
      public var btn_charge:Button = null;
      
      public var btn_chargeYearly:Button = null;
      
      public var img_become:Image = null;
      
      public var listDay:List = null;
      
      public var list_yearly:List = null;
      
      public var img_vipYearly:Image = null;
      
      public var list_yearlyLux:List = null;
      
      public var img_vipYearlyLux:Image = null;
      
      public var btn_getReward:Button = null;
      
      public var label_title1:Label = null;
      
      public var label_title3:Label = null;
      
      public function TencentVipRewardViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.TencentModule.render.TencentVipRewardRenderUI"] = TencentVipRewardRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
