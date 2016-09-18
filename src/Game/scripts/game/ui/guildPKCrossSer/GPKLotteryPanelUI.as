package game.ui.guildPKCrossSer
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Panel;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class GPKLotteryPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="1094" height="645">
			  <Image skin="png.comp.image" x="0" y="0" width="1094" height="645" var="img_bg"/>
			  <Image skin="png.comp.image" x="402" y="43" width="431" height="135" var="img_title"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="114" x="1000" var="btn_close"/>
			  <Box x="691" y="145">
			    <Image skin="png.uiGuildPKCrossSer.img_lottery_bg1"/>
			    <Panel x="24" y="75" width="243" height="388" var="panel_item"/>
			    <Box x="41" y="79" var="box_item">
			      <Label text="普通说明" autoSize="none" style="普通说明" width="186" height="50" var="txt_info" y="24"/>
			      <Label text="普通说明" autoSize="left" y="96" style="普通说明" width="209" var="txt_log" multiline="true" wordWrap="true" bottom="0"/>
			      <Label text="\l999900124" autoSize="none" x="-21" y="4" style="加底标题" width="244" height="20" align="center"/>
			      <Label text="\l999900123" autoSize="none" x="-21" y="75" style="加底标题" width="244" height="20" align="center"/>
			    </Box>
			  </Box>
			  <Box x="457" y="312">
			    <Button skin="png.uiGuildPKCrossSer.btn_lottery" stateNum="1" var="btn_lottery" x="0"/>
			    <Label text="\l999900112" autoSize="none" x="1" y="40" style="渐变黄" width="126" height="41" align="center" font="Microsoft YaHei" mouseChildren="false" mouseEnabled="false" size="31"/>
			  </Box>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_title:Image = null;
      
      public var btn_close:Button = null;
      
      public var panel_item:Panel = null;
      
      public var box_item:Box = null;
      
      public var txt_info:Label = null;
      
      public var txt_log:Label = null;
      
      public var btn_lottery:Button = null;
      
      public function GPKLotteryPanelUI()
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
