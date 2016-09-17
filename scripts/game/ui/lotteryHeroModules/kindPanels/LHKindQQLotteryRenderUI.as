package game.ui.lotteryHeroModules.kindPanels
{
   import morn.customs.components.LotteryRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import game.ui.commons.icons.LotteryRenderS7UI;
   
   public class LHKindQQLotteryRenderUI extends LotteryRender
   {
      
      protected static var uiView:XML = <LotteryRender width="126" height="39" mouseEnabled="false">
			  <Label text="label" x="52" y="11" width="86" var="txt_num" height="18" align="left" style="内容数字" autoSize="none"/>
			  <Image skin="png.a5.comps.img_block" x="29" y="11" var="img_icon" width="20" height="20"/>
			  <Box x="-6" y="-18" var="box_qqFirstLottery" mouseEnabled="false">
			    <LotteryRenderS7 x="85" var="render_ori" y="25" runtime="game.ui.commons.icons.LotteryRenderS7UI"/>
			    <Label text="腾讯用户首次8折" autoSize="none" style="渐变1" width="148" height="24" align="center" mouseChildren="false" mouseEnabled="false" font="Microsoft YaHei" wordWrap="true"/>
			    <Image skin="png.a5.commonImgs.img_barginLine" x="89" y="37"/>
			  </Box>
			</LotteryRender>;
       
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public var box_qqFirstLottery:Box = null;
      
      public var render_ori:LotteryRenderS7UI = null;
      
      public function LHKindQQLotteryRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS7UI"] = LotteryRenderS7UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
