package game.ui.shopModules.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Box;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRender60X60UI;
   import game.ui.commons.icons.WealthRenderS19UI;
   
   public class GeneralShopRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="296" height="93">
			  <Image skin="png.uiShop.img_shopBg" x="0" y="0"/>
			  <Label autoSize="left" x="90" y="5" height="20" style="小标题" var="txt_name" size="13" text="王者武器进阶图纸" language="en" lgx="80,90" lgy="5,5"/>
			  <Label text="(5/20)" x="203" y="6" height="18" var="txt_pieceNum" style="普通说明" align="right" width="81"/>
			  <Label text="每日限购：5/5" width="200" var="txt_limit" align="right" style="普通说明" x="83" y="31" multiline="true" wordWrap="true"/>
			  <List x="18" y="16" var="list_render">
			    <WealthRender60X60 name="render" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  </List>
			  <Box x="17" y="19" var="box_discount" width="147.3" height="64">
			    <LotteryRenderS4 x="78" scale="0.9" var="oriRes" y="18" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			    <Image skin="png.a5.commonImgs.img_barginLine" y="24" x="76"/>
			    <Image skin="png.a5.comps.img_block" anchorX="0.5" anchorY="0.5" var="img_discount"/>
			  </Box>
			  <Label autoSize="left" x="88" y="20" width="134" height="20" style="下划线黄色" var="txt_bind" text="\l41210144" mouseEnabled="false" mouseChildren="false"/>
			  <List x="89" y="55" var="list_currRes" repeatX="2" spaceX="-10">
			    <WealthRenderS19 x="0" y="0" name="render" runtime="game.ui.commons.icons.WealthRenderS19UI"/>
			  </List>
			  <Button label="购买" x="199" y="55" style="按钮中蓝" var="btn_buy"/>
			  <Image skin="png.a5.commonImgs.img_buyed" x="201" y="46" var="img_buyed"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_pieceNum:Label = null;
      
      public var txt_limit:Label = null;
      
      public var list_render:List = null;
      
      public var box_discount:Box = null;
      
      public var oriRes:LotteryRenderS4UI = null;
      
      public var img_discount:Image = null;
      
      public var txt_bind:Label = null;
      
      public var list_currRes:List = null;
      
      public var btn_buy:Button = null;
      
      public var img_buyed:Image = null;
      
      public function GeneralShopRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS19UI"] = WealthRenderS19UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
