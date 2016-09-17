package game.ui.shenYuans
{
   import morn.customs.components.PanelView;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Button;
   
   public class ShenYuanBuyBuffPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="708" height="428">
			  <PanelBgS3 x="0" y="0" width="708" height="428" showLightBottom="true" frameStyle="2" frameVisible="true"/>
			  <Image skin="png.uiShenYuan.buff.img_bg2" x="104.5" y="49"/>
			  <Label text="消耗星数购买祝福" autoSize="none" x="154" style="普通说明" width="400" height="25" y="56" size="14" align="center"/>
			  <Label text="剩余" autoSize="right" y="59" style="普通说明" width="100" height="18" x="526" align="right"/>
			  <Image skin="png.uiShenYuan.img_star" x="630" y="59"/>
			  <Label text="3" autoSize="left" x="651" y="59" style="普通说明" width="37" height="18" var="txt_starNum"/>
			  <Box x="469" y="79">
			    <Image skin="png.uiShenYuan.buff.img_bg" y="18"/>
			    <Image skin="png.uiShenYuan.buff.img_brought" x="123" var="img_buy_2" smoothing="true"/>
			    <Label text="普通说明" autoSize="none" y="62" style="普通绿色" width="187" height="22" align="center" var="txt_buff_desc2" size="14" x="1"/>
			    <Image skin="png.comp.image" x="44" y="96" width="95" height="95" var="icon_buff2"/>
			    <Button label="购买" x="33" style="按钮大绿" y="256" var="btn_buy_2"/>
			    <Image skin="png.uiShenYuan.img_star" x="83" y="218" mouseEnabled="false"/>
			    <Label text="99" autoSize="none" x="102" y="218" style="普通说明" width="34" height="18" align="left" var="price_2" mouseChildren="false" mouseEnabled="false"/>
			    <Label text="消耗" autoSize="none" x="52" y="218" style="普通说明" width="33" height="18" align="left" mouseChildren="false" mouseEnabled="false"/>
			    <Label text="渐变1" autoSize="none" x="3" y="32" style="渐变1" width="180" height="22" align="center" size="18" var="txt_buff_name2"/>
			  </Box>
			  <Box x="260" y="79">
			    <Image skin="png.uiShenYuan.buff.img_bg" y="18"/>
			    <Image skin="png.uiShenYuan.buff.img_brought" x="123" var="img_buy_1" smoothing="true"/>
			    <Label text="普通说明" autoSize="none" y="62" style="普通绿色" width="187" height="22" align="center" var="txt_buff_desc1" size="14" x="1"/>
			    <Image skin="png.comp.image" x="44" y="96" width="95" height="95" var="icon_buff1"/>
			    <Button label="购买" x="33" style="按钮大绿" y="256" var="btn_buy_1"/>
			    <Image skin="png.uiShenYuan.img_star" x="83" y="218" mouseEnabled="false"/>
			    <Label text="99" autoSize="none" x="102" y="218" style="普通说明" width="34" height="18" align="left" var="price_1" mouseChildren="false" mouseEnabled="false"/>
			    <Label text="消耗" autoSize="none" x="52" y="218" style="普通说明" width="33" height="18" align="left" mouseChildren="false" mouseEnabled="false"/>
			    <Label text="渐变1" autoSize="none" x="3" y="32" style="渐变1" width="180" height="22" align="center" size="18" var="txt_buff_name1"/>
			  </Box>
			  <Box x="51" y="79">
			    <Image skin="png.uiShenYuan.buff.img_bg" y="18"/>
			    <Image skin="png.uiShenYuan.buff.img_brought" x="123" var="img_buy_0" smoothing="true"/>
			    <Label text="普通说明" autoSize="none" y="62" style="普通绿色" width="187" height="22" align="center" var="txt_buff_desc0" size="14" x="1"/>
			    <Image skin="png.comp.image" x="44" y="96" width="95" height="95" var="icon_buff0"/>
			    <Button label="购买" x="33" style="按钮大绿" y="256" var="btn_buy_0"/>
			    <Image skin="png.uiShenYuan.img_star" x="83" y="218" mouseEnabled="false"/>
			    <Label text="99" autoSize="none" x="102" y="218" style="普通说明" width="34" height="18" align="left" var="price_0" mouseChildren="false" mouseEnabled="false"/>
			    <Label text="消耗" autoSize="none" x="1" y="218" style="普通说明" width="80" height="18" align="right" mouseChildren="false" mouseEnabled="false"/>
			    <Label text="渐变1" autoSize="none" x="3" y="32" style="渐变1" width="180" height="22" align="center" size="18" var="txt_buff_name0"/>
			  </Box>
			  <Label text="\l41500122 " autoSize="none" x="29" style="普通说明" width="650" height="25" y="393" size="12" align="center"/>
			</PanelView>;
       
      
      public var txt_starNum:Label = null;
      
      public var img_buy_2:Image = null;
      
      public var txt_buff_desc2:Label = null;
      
      public var icon_buff2:Image = null;
      
      public var btn_buy_2:Button = null;
      
      public var price_2:Label = null;
      
      public var txt_buff_name2:Label = null;
      
      public var img_buy_1:Image = null;
      
      public var txt_buff_desc1:Label = null;
      
      public var icon_buff1:Image = null;
      
      public var btn_buy_1:Button = null;
      
      public var price_1:Label = null;
      
      public var txt_buff_name1:Label = null;
      
      public var img_buy_0:Image = null;
      
      public var txt_buff_desc0:Label = null;
      
      public var icon_buff0:Image = null;
      
      public var btn_buy_0:Button = null;
      
      public var price_0:Label = null;
      
      public var txt_buff_name0:Label = null;
      
      public function ShenYuanBuyBuffPanelUI()
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
