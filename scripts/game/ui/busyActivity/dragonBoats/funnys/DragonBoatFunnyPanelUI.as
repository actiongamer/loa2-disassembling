package game.ui.busyActivity.dragonBoats.funnys
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.CheckBox;
   import morn.core.components.Box;
   import game.ui.commons.icons.WealthRenderS8UI;
   import game.ui.commons.icons.WealthRenderSize50UI;
   
   public class DragonBoatFunnyPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="790" height="444">
			  <Button skin="png.uiDragonBoat.img_arrow3" x="358" y="144" var="btn_arrow0" stateNum="1"/>
			  <Button skin="png.uiDragonBoat.img_arrow1" x="247" y="62" var="btn_arrow1" stateNum="1"/>
			  <Button skin="png.uiDragonBoat.img_arrow2" x="170" y="135" var="btn_arrow2" stateNum="1"/>
			  <Image skin="png.uiDragonBoat.img_bottom" x="15" y="201"/>
			  <Image skin="png.uiDragonBoat.img_right_bottom1" x="591" y="-12"/>
			  <Image skin="png.uiDragonBoat.img_right_bottom2" x="591" y="199"/>
			  <DragonBoatFunnyProductRender x="145" y="60" var="render_product_1" runtime="game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRenderUI"/>
			  <DragonBoatFunnyProductRender x="367" y="60" var="render_product_2" runtime="game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRenderUI"/>
			  <DragonBoatFunnyProductRender x="260" y="167" var="render_product_0" runtime="game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRenderUI"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_product_cout" width="144" align="left" x="331" y="192" backgroundColor="0xcfbeaf" color="0xffffff" height="20" style="小标题"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_product_score" width="144" align="left" x="331" y="213" backgroundColor="0xcfbeaf" color="0xffffff" height="20" style="重要提示绿"/>
			  <List x="190" y="258" spaceX="28" repeatX="3" var="list_meterial" centerX="-102">
			    <DragonBoatFunnyMaterialRender name="render" runtime="game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialRenderUI"/>
			  </List>
			  <CheckBox label="多选" x="240" y="367" selected="true" style="CheckBox普通" var="cb_autoBuy"/>
			  <DragonBoatFunnyMaterialFreeRender x="654" y="268" var="render_freeReward" runtime="game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialFreeRenderUI"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_tip4" width="199" align="center" x="587" y="356" backgroundColor="0xcfbeaf" height="40" style="重要提示黄" multiline="true" wordWrap="true"/>
			  <Button label="按钮" x="647" style="按钮中棕" var="btn_getReward" y="402"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_title_reward" width="199" align="center" x="588" y="237" backgroundColor="0xcfbeaf" height="20" style="小标题"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_tip_right1" width="182" align="left" x="598" y="81" backgroundColor="0xcfbeaf" height="134" style="普通说明" multiline="true" wordWrap="true"/>
			  <Box x="431" y="21" var="box_reward_preview">
			    <Image skin="png.uiDragonBoat.img_reward_title_bg"/>
			    <List x="27" y="38" repeatX="2" repeatY="3" spaceX="4" spaceY="4" var="list_reward_preview">
			      <WealthRenderSize50 name="render" runtime="game.ui.commons.icons.WealthRenderSize50UI"/>
			    </List>
			    <Label text="我的积分" autoSize="none" y="11" style="渐变1" width="84" height="22" align="center" size="14" var="txt_reward_preview_title" x="38"/>
			  </Box>
			  <Label text="我的积分" autoSize="none" y="40" style="渐变1" width="115" height="22" align="left" size="14" var="txt_score_tip" x="618"/>
			  <Label text="我的积分" autoSize="none" y="40" style="渐变绿" width="104" height="17" align="left" size="14" var="txt_score" x="689"/>
			  <Button label="按钮" style="按钮大绿" var="btn_doAll" x="236.5" y="398"/>
			  <Label text="我的积分" autoSize="none" y="4" style="渐变1" width="578" height="22" align="center" size="14" var="txt_cd" x="9"/>
			  <Box x="478" y="402">
			    <Image skin="png.a5.commonImgs.img_rule_bg"/>
			    <WealthRenderS8 x="2" var="render_need" y="3" runtime="game.ui.commons.icons.WealthRenderS8UI"/>
			    <Button skin="png.a5.comps.numBars.btn_plus" x="68" y="4" stateNum="1" var="addBtn"/>
			  </Box>
			  <Label text="1000" stroke="0xffffff" mouseEnabled="false" var="tipsTxt" backgroundColor="0xcfbeaf" x="99" y="235" width="388" style="重要提示绿" align="center" height="20" mouseChildren="false"/>
			</View>;
       
      
      public var btn_arrow0:Button = null;
      
      public var btn_arrow1:Button = null;
      
      public var btn_arrow2:Button = null;
      
      public var render_product_1:game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRenderUI = null;
      
      public var render_product_2:game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRenderUI = null;
      
      public var render_product_0:game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRenderUI = null;
      
      public var txt_product_cout:Label = null;
      
      public var txt_product_score:Label = null;
      
      public var list_meterial:List = null;
      
      public var cb_autoBuy:CheckBox = null;
      
      public var render_freeReward:game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialFreeRenderUI = null;
      
      public var txt_tip4:Label = null;
      
      public var btn_getReward:Button = null;
      
      public var txt_title_reward:Label = null;
      
      public var txt_tip_right1:Label = null;
      
      public var box_reward_preview:Box = null;
      
      public var list_reward_preview:List = null;
      
      public var txt_reward_preview_title:Label = null;
      
      public var txt_score_tip:Label = null;
      
      public var txt_score:Label = null;
      
      public var btn_doAll:Button = null;
      
      public var txt_cd:Label = null;
      
      public var render_need:WealthRenderS8UI = null;
      
      public var addBtn:Button = null;
      
      public var tipsTxt:Label = null;
      
      public function DragonBoatFunnyPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialFreeRenderUI"] = game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialFreeRenderUI;
         viewClassMap["game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMaterialRenderUI"] = DragonBoatFunnyMaterialRenderUI;
         viewClassMap["game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRenderUI"] = game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS8UI"] = WealthRenderS8UI;
         viewClassMap["game.ui.commons.icons.WealthRenderSize50UI"] = WealthRenderSize50UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
