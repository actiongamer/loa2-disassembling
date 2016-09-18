package game.ui.renzhengs.vipAuths
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class VipAuthXunLeiModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="410" height="350">
			  <PanelBgS3 x="0" y="0" width="410" height="346" showLightBottom="false" frameStyle="1" frameVisible="false" panelDragEnabled="false" showTabLine="false" showLightTop="false"/>
			  <Image skin="png.uiVipAuthShunWang.img_bg" x="12" y="14" var="img_bg"/>
			  <Box x="17" y="120">
			    <Image skin="png.uiVipAuthShunWang.xunlei_girl"/>
			    <Image skin="png.uiVipAuthShunWang.girl_cover" x="1" y="126"/>
			  </Box>
			  <Image skin="png.uiVipAuthShunWang.img_gift" x="277" y="81"/>
			  <Image skin="png.uiVipAuthShunWang.img_tip1" x="36" y="86"/>
			  <Image skin="png.uiVipAuthShunWang.img_tip2" x="77" y="20"/>
			  <Label text="普通说明" autoSize="none" x="184" y="143" style="普通说明" width="206" height="117" multiline="true" wordWrap="true" var="txt_tip1" size="13"/>
			  <Button label="按钮" x="218" style="按钮大蓝充值" y="268" var="btn_submit"/>
			  <Label text="累计充值800RMB即可显示" autoSize="none" x="18" y="253" style="小标题" width="163" height="37" multiline="true" wordWrap="true" var="txt_tipQQ1" align="center"/>
			  <Label text="渐变1" autoSize="none" x="193" y="118" style="渐变1" width="194" height="22" align="center" var="txt_tip0"/>
			  <Label text="累计充值800RMB即可显示" autoSize="none" x="19" y="269" style="小标题" width="160" height="46" multiline="true" wordWrap="true" var="txt_tipQQ0" align="center"/>
			  <Button label="按钮" x="25" style="按钮中红" y="280" var="btn_go" width="147" height="26"/>
			  <Label text="渐变橙" autoSize="none" x="113" y="19" style="渐变橙" width="269" height="22" align="right" size="14" var="txt_tip3"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var txt_tip1:Label = null;
      
      public var btn_submit:Button = null;
      
      public var txt_tipQQ1:Label = null;
      
      public var txt_tip0:Label = null;
      
      public var txt_tipQQ0:Label = null;
      
      public var btn_go:Button = null;
      
      public var txt_tip3:Label = null;
      
      public function VipAuthXunLeiModuleUI()
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
