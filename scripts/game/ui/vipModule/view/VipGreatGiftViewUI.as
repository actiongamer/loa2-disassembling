package game.ui.vipModule.view
{
   import morn.customs.components.FadeView;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.customs.components.ClipList;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import game.ui.commons.icons.LotteryRenderS3UI;
   import morn.customs.components.WealthList;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class VipGreatGiftViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView centerY="0" width="773" height="382">
			  <Box x="721" var="box_btn_right" width="51" height="382">
			    <Image skin="png.a5.btns.img_btnLongBarBg" width="51" height="382" sizeGrid="0,20,0,20" var="img_rightBg" smoothing="true" x="0" y="47"/>
			    <Button skin="png.a5.btns.btn_longBar" x="13" y="213" stateNum="3" var="btn_rightArrow" centerY="0"/>
			  </Box>
			  <Box x="56" y="0" var="box_btn_left" height="382" width="51" scaleX="-1">
			    <Image skin="png.a5.btns.img_btnLongBarBg" height="382" sizeGrid="0,20,0,20" var="img_leftBg" smoothing="true" x="0" y="-303"/>
			    <Button skin="png.a5.btns.btn_longBar" stateNum="3" var="btn_leftArrow" centerY="0" x="13" y="-137"/>
			  </Box>
			  <Box x="74" y="3">
			    <Image skin="png.uiVip.豪礼底部"/>
			    <Image skin="png.uiVip.数字大-豪礼.VIP" x="8" y="7" var="img_bigvip"/>
			    <ClipList value="3" clipWidth="24" align="left" url="png.a5.comps.clipList.clipList_S17" x="68" y="6" gapX="-5" width="41" height="30" var="txt_vip"/>
			    <Image skin="png.uiVip.数字大-豪礼.豪礼" x="113" y="7"/>
			  </Box>
			  <Button x="509" style="按钮大蓝" y="331" var="btn_buy"/>
			  <LotteryRenderS4 scale="0.9" var="oriRes" x="553" y="310" visible="true" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <Image skin="png.a5.commonImgs.img_barginLine" y="318" x="551" var="img_saleLine" mouseChildren="false" mouseEnabled="false" height="3" visible="true"/>
			  <LotteryRenderS3 x="540" y="337" var="priceRender" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  <Label text="请选择一位英雄" autoSize="none" x="165" y="281" style="重要提示橘黄" align="center" visible="false"/>
			  <WealthList x="170" y="305" var="list_gift" spaceX="10" repeatX="5">
			    <WealthRenderS56 x="0" y="0" name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </WealthList>
			  <Label text="渐变渐变渐变渐变渐变渐变渐变渐变" autoSize="none" x="425" y="14" style="渐变1" align="left" width="321" height="60" var="txt_ad" multiline="true" wordWrap="true"/>
			  <Label text="每个宝箱可选择一位英雄" autoSize="none" x="166" y="359" style="重要提示黄" width="441" height="22" var="txt_hint" align="left"/>
			</FadeView>;
       
      
      public var box_btn_right:Box = null;
      
      public var img_rightBg:Image = null;
      
      public var btn_rightArrow:Button = null;
      
      public var box_btn_left:Box = null;
      
      public var img_leftBg:Image = null;
      
      public var btn_leftArrow:Button = null;
      
      public var img_bigvip:Image = null;
      
      public var txt_vip:ClipList = null;
      
      public var btn_buy:Button = null;
      
      public var oriRes:LotteryRenderS4UI = null;
      
      public var img_saleLine:Image = null;
      
      public var priceRender:LotteryRenderS3UI = null;
      
      public var list_gift:WealthList = null;
      
      public var txt_ad:Label = null;
      
      public var txt_hint:Label = null;
      
      public function VipGreatGiftViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
