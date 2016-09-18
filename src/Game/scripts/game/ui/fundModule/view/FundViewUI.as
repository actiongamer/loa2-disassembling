package game.ui.fundModule.view
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import morn.core.components.List;
   import game.ui.fundModule.render.FundRewardRenderUI;
   
   public class FundViewUI extends View
   {
      
      protected static var uiView:XML = <View width="717" height="403">
			  <Image skin="png.a5.comps.img_block" x="34" y="22" var="img_v1ad3" width="165" height="52"/>
			  <Image skin="png.a5.comps.img_block" x="-18" y="104" var="img_icon" width="264" height="299"/>
			  <Label text="当前VIP等级：1/2" autoSize="none" x="63" y="138" style="普通说明" width="109" height="20" var="label_curvip"/>
			  <Button skin="png.a5.btns.btn_charge" x="42" y="90" stateNum="1" var="btn_buy"/>
			  <LotteryRenderS4 scale="0.9" var="chargeRes" x="79" y="103" mouseChildren="false" mouseEnabled="false" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <List x="223" y="13" width="494" height="366" repeatY="4" spaceY="2" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="list_fund">
			    <FundRewardRender name="render" runtime="game.ui.fundModule.render.FundRewardRenderUI"/>
			  </List>
			  <Image skin="png.uiFund.投资" x="280" y="-51"/>
			  <Image skin="png.a5.comps.img_block" x="418" y="-116" var="img_v1ad2" width="264" height="122"/>
			  <Image skin="png.uiFund.回报" x="370" y="-51"/>
			  <Image skin="png.a5.comps.img_block" x="262" y="-136" var="img_v1ad1" width="177" height="96"/>
			  <ClipList value="100" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S22" x="321" y="-51" gapX="-2"/>
			  <ClipList value="1000" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S22" x="409" y="-51" gapX="-1"/>
			  <Image skin="png.uiFund.十倍返利-分割线" x="274" y="-15"/>
			  <Image skin="png.uiFund.VIP" x="427" y="-102"/>
			  <ClipList value="3" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S14" x="486" y="-90"/>
			  <Image skin="png.a5.comps.img_block" x="506" y="-90" var="img_v2ad2" width="66" height="18"/>
			</View>;
       
      
      public var img_v1ad3:Image = null;
      
      public var img_icon:Image = null;
      
      public var label_curvip:Label = null;
      
      public var btn_buy:Button = null;
      
      public var chargeRes:LotteryRenderS4UI = null;
      
      public var list_fund:List = null;
      
      public var img_v1ad2:Image = null;
      
      public var img_v1ad1:Image = null;
      
      public var img_v2ad2:Image = null;
      
      public function FundViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.fundModule.render.FundRewardRenderUI"] = FundRewardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
