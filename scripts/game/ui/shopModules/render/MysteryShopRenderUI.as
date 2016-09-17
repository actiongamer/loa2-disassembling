package game.ui.shopModules.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRender60X60UI;
   
   public class MysteryShopRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="259" height="101">
			  <Image skin="png.uiShop.img_mysteryBg" var="render_background" x="-3" y="-3"/>
			  <Box x="0" y="0" var="box_lock" width="78" height="24" visible="true" buttonMode="true">
			    <Label text="VIP4以上可用" x="51" y="3" width="160" height="20" var="txt_vip_info" style="重要提示绿" align="left"/>
			    <Box x="18" y="79" var="btn_link_select" height="24" visible="true" buttonMode="true">
			      <Label text="\l999902518" x="0" y="0" height="20" style="重要提示绿" align="center" selectable="false" underline="true" buttonMode="true" mouseChildren="false" mouseEnabled="false"/>
			    </Box>
			    <Box x="124" y="81" var="box_ckb" width="78" height="24" visible="true" buttonMode="true">
			      <Label text="点击撤回锁定" x="30" y="-1" width="149" height="20" var="txt_lock_info" style="重要提示绿" align="left" mouseChildren="false" mouseEnabled="false" buttonMode="true"/>
			      <Image skin="png.uiShop.锁关" x="14" y="-1" var="img_lock"/>
			      <Image skin="png.uiShop.锁开" y="-1" x="11" var="img_unlock"/>
			    </Box>
			    <Button skin="png.a5.commonImgs.img_rule" x="230" y="2" var="img_help" stateNum="1" buttonMode="true" scale="0.6"/>
			  </Box>
			  <Button label="购买" x="153" y="51" style="按钮中绿" var="btn_buy"/>
			  <LotteryRenderS4 x="87" y="60" var="curr_res" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			  <Label text="高级女神保佑水晶石" autoSize="left" x="80" y="16" width="137" height="22" style="小标题" size="14" var="txt_name" language="en" lgx="78,80" lgy="16,16"/>
			  <Label text="(5/20)" x="179" y="18" width="78" height="20" var="txt_pieceNum" style="普通说明" align="right"/>
			  <Image skin="png.a5.commonImgs.img_buyed" x="166" y="42" var="img_buyed"/>
			  <Label text="每日限购:" width="165" height="20" var="txt_limit" align="right" style="普通说明" x="80" y="36"/>
			  <List x="14" y="20" var="list_render">
			    <WealthRender60X60 name="render" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  </List>
			  <Box x="21" y="21" var="box_discount">
			    <LotteryRenderS4 x="66" scale="0.9" var="oriRes" y="18" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			    <Image skin="png.a5.commonImgs.img_barginLine" y="23" x="61" var="line_discount"/>
			    <Image skin="png.a5.comps.img_block" anchorX="0.5" anchorY="0.5" var="img_discount"/>
			  </Box>
			  <Box x="-17" y="-1" var="box_other">
			    <Image skin="png.a5.commonImgs.img_blueLabel" x="19" var="img_other"/>
			    <Label text="每日限购:" width="91" var="txt_other" align="center" style="渐变1" y="45" size="14" height="20"/>
			  </Box>
			</View>;
       
      
      public var render_background:Image = null;
      
      public var box_lock:Box = null;
      
      public var txt_vip_info:Label = null;
      
      public var btn_link_select:Box = null;
      
      public var box_ckb:Box = null;
      
      public var txt_lock_info:Label = null;
      
      public var img_lock:Image = null;
      
      public var img_unlock:Image = null;
      
      public var img_help:Button = null;
      
      public var btn_buy:Button = null;
      
      public var curr_res:LotteryRenderS4UI = null;
      
      public var txt_name:Label = null;
      
      public var txt_pieceNum:Label = null;
      
      public var img_buyed:Image = null;
      
      public var txt_limit:Label = null;
      
      public var list_render:List = null;
      
      public var box_discount:Box = null;
      
      public var oriRes:LotteryRenderS4UI = null;
      
      public var line_discount:Image = null;
      
      public var img_discount:Image = null;
      
      public var box_other:Box = null;
      
      public var img_other:Image = null;
      
      public var txt_other:Label = null;
      
      public function MysteryShopRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
