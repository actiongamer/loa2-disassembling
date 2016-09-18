package game.ui.groupon
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.CheckBox;
   import game.ui.groupon.render.GrouponProgressBarUI;
   import morn.core.components.TextInput;
   import game.ui.commons.icons.WealthRenderS9UI;
   import game.ui.commons.icons.LotteryRenderS1UI;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS16UI;
   
   public class GrouponDetialViewUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400" visible="true">
			  <Label text="\l30000706" autoSize="none" x="166" y="192" style="普通说明" align="right" width="84" height="20"/>
			  <Label text="\l30000707" autoSize="none" x="171" y="224" style="普通说明" align="right" width="63" height="20"/>
			  <Button label="参团" x="241" style="按钮大蓝" y="309" var="btn_buy"/>
			  <Label text="现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价" autoSize="none" x="181" y="392" style="普通说明" var="txt_rule1" width="417" height="19" multiline="true" wordWrap="true"/>
			  <Label text="截止倒计时：" autoSize="none" x="142" y="350" style="普通说明" width="315" height="20" var="txt_cd" align="center"/>
			  <CheckBox x="163" y="222" selected="true" style="CheckBox普通" var="check_useCoupon"/>
			  <Label text="\l999001114" autoSize="none" x="241" y="283" style="普通说明" width="77" height="20"/>
			  <Label text="可购买次数：3次" autoSize="none" x="375" y="284" style="普通说明" width="215" height="20" var="txt_vipBuyCnt"/>
			  <Label text="最多使用 200 " autoSize="none" x="393" y="225" style="普通说明" width="215" height="20" var="txt_maxUse"/>
			  <Label text="可返100 圈" autoSize="none" x="393" y="194" style="普通说明" width="215" height="20" var="txt_back"/>
			  <GrouponProgressBar x="238" y="77" var="progressBar" runtime="game.ui.groupon.render.GrouponProgressBarUI"/>
			  <Label text="限时团购，祝福石" autoSize="none" x="5" y="28" style="渐变1" width="437" height="26" align="right" var="txt_name" mouseEnabled="false" mouseChildren="false"/>
			  <Label text="(122/202)" autoSize="none" x="314" y="283" style="普通说明" width="73" height="20" var="txt_countLimit" align="left"/>
			  <Image skin="png.uiGroupon.bg2" x="260" y="220"/>
			  <Label text="\l30000705" autoSize="none" x="165" y="160" style="普通说明" align="right" width="85" height="20"/>
			  <TextInput text="0" x="262" y="224" var="txt_useCoupon" width="95" height="22" align="center"/>
			  <WealthRenderS9 x="77" y="171" var="itemRender" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  <Label text="现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价" autoSize="none" x="181" y="412" style="普通说明" var="txt_rule2" width="417" height="19" multiline="true" wordWrap="true"/>
			  <Label text="现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价现价" autoSize="none" x="181" y="432" style="普通说明" var="txt_rule3" width="422" height="19" multiline="true" wordWrap="true"/>
			  <Image skin="png.a5.commonImgs.img_dot" x="170" y="395"/>
			  <Image skin="png.a5.commonImgs.img_dot" x="169" y="414"/>
			  <Image skin="png.a5.commonImgs.img_dot" x="169" y="434"/>
			  <Label text="\l999001113" autoSize="none" x="31" y="411" style="渐变4" width="274" height="21" align="left" mouseEnabled="false" mouseChildren="false"/>
			  <LotteryRenderS1 x="252" y="158" var="oriPrice" runtime="game.ui.commons.icons.LotteryRenderS1UI"/>
			  <Image skin="png.a5.commonImgs.img_barginLine" x="252" y="167"/>
			  <Image skin="png.a5.commonImgs.img_recycleAlertPoint" x="11" y="414" scale=".8" smoothing="true"/>
			  <Image skin="png.uiGroupon.1" x="21" y="120" var="img_discount"/>
			  <Label text="\l30000703" autoSize="none" x="508" y="28" style="渐变1" width="159" height="26" align="left" mouseEnabled="false" mouseChildren="false"/>
			  <WealthRenderS16 x="252" y="187" var="nowPrice" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			  <Image skin="png.uiGroupon.coupon" x="234" y="219" scale=".4"/>
			  <Label text="\l30000724" autoSize="none" x="366" y="318" style="下划线黄色" width="200" height="20" var="txt_resetTip"/>
			  <Label text="8.5" autoSize="none" x="439" y="16" style="渐变1" width="67" height="32" align="center" mouseEnabled="false" mouseChildren="false" var="txt_discount" size="28"/>
			  <Label text="\l30000726" autoSize="none" x="212" y="250" style="下划线黄色" width="375" height="20"/>
			</View>;
       
      
      public var btn_buy:Button = null;
      
      public var txt_rule1:Label = null;
      
      public var txt_cd:Label = null;
      
      public var check_useCoupon:CheckBox = null;
      
      public var txt_vipBuyCnt:Label = null;
      
      public var txt_maxUse:Label = null;
      
      public var txt_back:Label = null;
      
      public var progressBar:GrouponProgressBarUI = null;
      
      public var txt_name:Label = null;
      
      public var txt_countLimit:Label = null;
      
      public var txt_useCoupon:TextInput = null;
      
      public var itemRender:WealthRenderS9UI = null;
      
      public var txt_rule2:Label = null;
      
      public var txt_rule3:Label = null;
      
      public var oriPrice:LotteryRenderS1UI = null;
      
      public var img_discount:Image = null;
      
      public var nowPrice:WealthRenderS16UI = null;
      
      public var txt_resetTip:Label = null;
      
      public var txt_discount:Label = null;
      
      public function GrouponDetialViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS1UI"] = LotteryRenderS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS16UI"] = WealthRenderS16UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         viewClassMap["game.ui.groupon.render.GrouponProgressBarUI"] = GrouponProgressBarUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
