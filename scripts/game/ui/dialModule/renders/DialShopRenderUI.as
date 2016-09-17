package game.ui.dialModule.renders
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS19UI;
   import game.ui.commons.icons.WealthRenderSize64UI;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class DialShopRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="265" height="110">
			  <Image skin="png.uiDialModules.img_shopBg" x="0" y="0"/>
			  <Button x="130" style="按钮大蓝" y="73" var="btn_buy" mouseChildren="true"/>
			  <WealthRenderS19 x="162" y="77" var="render_curRes" runtime="game.ui.commons.icons.WealthRenderS19UI"/>
			  <WealthRenderSize64 x="12" y="12" var="render_item" runtime="game.ui.commons.icons.WealthRenderSize64UI"/>
			  <Box x="-32" y="0" var="box_discount" mouseEnabled="false" mouseChildren="false">
			    <WealthRenderS19 x="209" var="render_oriRes" y="44" runtime="game.ui.commons.icons.WealthRenderS19UI"/>
			    <Label text="原价" autoSize="none" y="50" style="普通说明" x="180"/>
			    <Image skin="png.a5.commonImgs.img_barginLine" x="212" y="55"/>
			    <Image skin="png.a5.commonImgs.img_redLabel" x="30" y="0"/>
			    <Label text="5折" autoSize="none" y="46" style="渐变1" width="104" height="22" align="center" var="txt_discount" font="Microsoft YaHei" rotation="45" x="7"/>
			  </Box>
			  <Label text="物品名称" autoSize="none" x="97" y="5" style="普通说明" width="173" height="20" mouseEnabled="false" mouseChildren="false" align="left" var="txt_name"/>
			  <Label text="物品名称" autoSize="none" x="195" y="5" style="普通说明" width="66" height="20" mouseEnabled="false" mouseChildren="false" align="center" var="txt_pieceNum"/>
			  <Label text="物品名称" autoSize="none" x="102" y="29" style="普通说明" width="153" height="20" mouseEnabled="false" mouseChildren="false" align="right" var="txt_limit"/>
			  <Image skin="png.a5.commonImgs.img_buyed" x="171" y="59" var="img_buyed" width="81" height="46"/>
			</View>;
       
      
      public var btn_buy:Button = null;
      
      public var render_curRes:WealthRenderS19UI = null;
      
      public var render_item:WealthRenderSize64UI = null;
      
      public var box_discount:Box = null;
      
      public var render_oriRes:WealthRenderS19UI = null;
      
      public var txt_discount:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_pieceNum:Label = null;
      
      public var txt_limit:Label = null;
      
      public var img_buyed:Image = null;
      
      public function DialShopRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS19UI"] = WealthRenderS19UI;
         viewClassMap["game.ui.commons.icons.WealthRenderSize64UI"] = WealthRenderSize64UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
