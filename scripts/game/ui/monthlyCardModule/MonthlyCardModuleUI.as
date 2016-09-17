package game.ui.monthlyCardModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class MonthlyCardModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="804" height="549">
			  <PanelBg x="1" y="0" width="804" height="549"/>
			  <Image skin="png.a5.comps.img_block" x="16" y="35" width="777" height="81" var="img_title"/>
			  <Image skin="png.a5.comps.img_block" x="-247" y="-147" var="img_person"/>
			  <Image skin="png.a5.comps.img_block" x="75" y="119" var="img_bg" width="724" height="421"/>
			  <Image skin="png.a5.comps.img_block" x="83" y="117" var="img_descBG" width="245" height="396"/>
			  <Image skin="png.a5.comps.img_block" x="331" y="110" var="img_silver" width="230" height="375"/>
			  <Image skin="png.a5.comps.img_block" x="562" y="110" var="img_gold" width="230" height="375"/>
			  <Image skin="png.uiMonthlyCard.月卡-文字001" x="106" y="145"/>
			  <Image skin="png.uiMonthlyCard.月卡-文字002" x="486" y="142" var="img_silverActived"/>
			  <Image skin="png.uiMonthlyCard.月卡-装饰001" x="100" y="194"/>
			  <Image skin="png.uiMonthlyCard.月卡-装饰002" x="299" y="418"/>
			  <Image skin="png.uiMonthlyCard.月卡-装饰003" x="738" y="417"/>
			  <Label text="单次充值高于一定金额，自动开通对应月卡" autoSize="none" x="111" y="191" style="普通说明" width="198" height="64" multiline="true" wordWrap="true" leading="0"/>
			  <Label text="单次充值开通一档月卡，优先开通高等级的月卡" autoSize="none" x="111" y="240" style="普通说明" height="54" width="198" multiline="true" wordWrap="true" leading="0"/>
			  <Image skin="png.uiMonthlyCard.月卡-装饰001" x="100" y="243"/>
			  <Image skin="png.uiMonthlyCard.月卡-装饰001" x="100" y="293"/>
			  <Image skin="png.uiMonthlyCard.月卡-装饰001" x="100" y="428"/>
			  <Image skin="png.uiMonthlyCard.月卡-装饰001" x="100" y="369"/>
			  <Label text="开通月卡后，每日可领取相应奖励，持续30天，可在每日任务中领取" autoSize="none" x="111" y="290" style="普通说明" height="69" width="198" multiline="true" wordWrap="true" leading="0"/>
			  <Label text="月卡只有在可领取天数不足5天时续费，充值可累计月卡天数" autoSize="none" x="111" y="366" style="普通说明" height="57" width="198" multiline="true" wordWrap="true" leading="0"/>
			  <Label text="开通月卡期间没有登录，则无法领取当日的月卡奖励" autoSize="none" x="111" y="425" style="普通说明" height="73" width="198" multiline="true" wordWrap="true" leading="0"/>
			  <Label text="每日任务" autoSize="none" x="99" y="339" style="重要提示黄" underline="true" buttonMode="true" mouseChildren="false" var="label_taskLink" align="right" width="210" height="20"/>
			  <Button label="前往充值" skin="png.uiMonthlyCard.btn_reCharge" x="372" y="478" stateNum="1" var="btn_silver"/>
			  <Button label="前往充值" skin="png.uiMonthlyCard.btn_reCharge" x="603" y="478" stateNum="1" var="btn_gold"/>
			  <Label text="剩余20天" autoSize="none" x="382" y="440" style="普通说明" width="127" height="20" align="center" var="label_silverDay"/>
			  <Label text="剩余20天" autoSize="none" x="609" y="440" style="普通说明" width="127" height="20" align="center" var="label_goldDay"/>
			  <Image skin="png.uiMonthlyCard.月卡-文字002" x="714" y="142" var="img_goldActived"/>
			</PopModuleView>;
       
      
      public var img_title:Image = null;
      
      public var img_person:Image = null;
      
      public var img_bg:Image = null;
      
      public var img_descBG:Image = null;
      
      public var img_silver:Image = null;
      
      public var img_gold:Image = null;
      
      public var img_silverActived:Image = null;
      
      public var label_taskLink:Label = null;
      
      public var btn_silver:Button = null;
      
      public var btn_gold:Button = null;
      
      public var label_silverDay:Label = null;
      
      public var label_goldDay:Label = null;
      
      public var img_goldActived:Image = null;
      
      public function MonthlyCardModuleUI()
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
