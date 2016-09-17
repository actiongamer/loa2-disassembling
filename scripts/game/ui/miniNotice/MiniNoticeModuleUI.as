package game.ui.miniNotice
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class MiniNoticeModuleUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="300" height="100">
			  <Box x="-1" y="-16" mouseEnabled="false" var="box_content">
			    <Image skin="png.uiMiniNotice.img_bg" mouseEnabled="false" mouseChildren="false" x="0" y="0"/>
			    <Image skin="png.a5.comps.img_block" x="68" y="34" mouseEnabled="false" mouseChildren="false" var="img_icon" width="64" height="64"/>
			    <Image skin="png.uiMiniNotice.img_icon" x="63" y="26" mouseChildren="false" mouseEnabled="false"/>
			    <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="12" x="272" var="btn_close"/>
			    <Label text="1:25:36" autoSize="none" x="146" y="57" style="渐变黄" width="143" height="38" align="left" size="32" var="txt_openTime" font="Microsoft YaHei" mouseChildren="false" mouseEnabled="false"/>
			    <Label autoSize="none" x="149" y="37" style="渐变黄" width="145" height="22" align="left" var="txt_status" text="即将开始" size="14" bold="false" font="Microsoft YaHei" mouseChildren="false" mouseEnabled="false"/>
			    <Button label="立即参与" x="150" style="按钮大绿" y="62" var="btn_enter"/>
			    <Label autoSize="none" x="59" y="81" style="渐变黄" width="84" height="18" align="center" var="txt_funcName" text="世界BOSS" bold="false" size="12" font="Microsoft YaHei" mouseEnabled="false" mouseChildren="false"/>
			  </Box>
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS6" x="-2" y="-5" sizeGrid="4,4,4,4" width="304" height="119" var="img_mask"/>
			</StaticModuleView>;
       
      
      public var box_content:Box = null;
      
      public var img_icon:Image = null;
      
      public var btn_close:Button = null;
      
      public var txt_openTime:Label = null;
      
      public var txt_status:Label = null;
      
      public var btn_enter:Button = null;
      
      public var txt_funcName:Label = null;
      
      public var img_mask:Image = null;
      
      public function MiniNoticeModuleUI()
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
