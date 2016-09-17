package game.ui.familyBosses
{
   import morn.customs.components.PanelView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS3UI;
   
   public class RevivePanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="558" height="233">
			  <Image skin="png.a5.bgs.panelBgs.raw.底板四级" x="28" y="2" centerX="0"/>
			  <Image skin="png.uiFamilyBosses.reviveBg" x="6" y="8" centerX="0" mouseEnabled="false" mouseChildren="false"/>
			  <Label text="复活倒计时" autoSize="none" x="96.5" y="43" style="渐变3" width="407" height="45" align="center" size="30" centerX="0"/>
			  <Label text="20:06" autoSize="none" x="82.5" y="104" style="渐变蓝" width="407" height="40" align="center" size="36" centerX="0" var="txt_cd"/>
			  <Box x="155.5" y="175" centerX="0">
			    <Button label="\l40740050" style="按钮大绿" var="btn_revive" labelMargin="42"/>
			    <LotteryRenderS3 x="6" y="6" var="costRender" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			  </Box>
			</PanelView>;
       
      
      public var txt_cd:Label = null;
      
      public var btn_revive:Button = null;
      
      public var costRender:LotteryRenderS3UI = null;
      
      public function RevivePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
