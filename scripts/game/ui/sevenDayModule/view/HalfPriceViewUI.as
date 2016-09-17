package game.ui.sevenDayModule.view
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import morn.customs.components.ClipList;
   
   public class HalfPriceViewUI extends View
   {
      
      protected static var uiView:XML = <View width="568" height="469">
			  <Image skin="png.a5.comps.img_block" x="3" y="149" width="560" height="317" var="img_bg"/>
			  <Image skin="png.uiSevenDays.物品名称底部" x="114" y="159"/>
			  <Label text="随品质变化" autoSize="none" x="114" y="162" style="重要提示橘黄" bold="true" var="item_id" width="195" height="20" align="center"/>
			  <Label text="普通绿色" autoSize="none" x="114" y="183" style="普通绿色" var="item_desc" width="195" align="center"/>
			  <Label autoSize="none" x="390" y="386" style="小标题" var="rest_num" text="每人限购一件"/>
			  <Button x="392.5" style="按钮大绿" y="341" var="buy_button"/>
			  <Image skin="png.a5.comps.img_block" x="3" y="2" var="img_title" width="561" height="139"/>
			  <Label text="label" x="12" y="78" var="event_period"/>
			  <Label text="label" x="12" y="95" var="end_time"/>
			  <Label text="label" x="12" y="112" var="reward_end_time"/>
			  <Label text="\l13100602" x="361.5" y="406" width="181" height="20" align="center" var="label_myBuyCount"/>
			  <LotteryRenderS4 x="419" y="347" var="render_prize" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <Image skin="png.a5.comps.img_block" x="208" y="254" var="img_goods" anchorX="0.5" width="262" height="240"/>
			  <ClipList value="1800" clipWidth="26" align="left" url="png.a5.comps.clipList.clipList_S16" x="470" y="287" gapX="-5" var="txt_cost"/>
			  <Label text="渐变黄" autoSize="none" x="145" y="28" style="渐变橙" width="416" height="40" align="center" font="Microsoft YaHei" size="30" mouseChildren="false" mouseEnabled="false" var="titleTxt"/>
			  <Label text="\l999902569" autoSize="none" x="70" y="285" style="渐变1" width="355" height="40" align="right" font="Microsoft YaHei" size="30" mouseChildren="false" mouseEnabled="false" multiline="true" wordWrap="true"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var item_id:Label = null;
      
      public var item_desc:Label = null;
      
      public var rest_num:Label = null;
      
      public var buy_button:Button = null;
      
      public var img_title:Image = null;
      
      public var event_period:Label = null;
      
      public var end_time:Label = null;
      
      public var reward_end_time:Label = null;
      
      public var label_myBuyCount:Label = null;
      
      public var render_prize:LotteryRenderS4UI = null;
      
      public var img_goods:Image = null;
      
      public var txt_cost:ClipList = null;
      
      public var titleTxt:Label = null;
      
      public function HalfPriceViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
