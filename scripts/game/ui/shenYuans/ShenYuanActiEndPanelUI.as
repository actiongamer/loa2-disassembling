package game.ui.shenYuans
{
   import morn.customs.components.FadeView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class ShenYuanActiEndPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="342" height="220">
			  <Image skin="png.uiShenYuan.提示面板1" x="-1" y="0"/>
			  <Button label="" stateNum="1" buttonMode="true" skin="png.uiCommon.btns.btn_close_mini" x="306" y="3" var="btn_close"/>
			  <Image skin="png.uiShenYuan.闯关结束" x="127" y="4"/>
			  <Label text="今日女神闯关活动已经结束" x="62" y="56" align="center" width="216" height="18" color="0xff0000" var="txt_end"/>
			  <Label text="今日女神闯关活动已经结束" autoSize="center" x="62" y="96" align="center" width="216" height="18" color="0xff6600" var="txt_next"/>
			  <Label text="今日女神闯关活动已经结束" autoSize="none" x="62" y="119" align="center" width="216" height="18" color="0xff6600" var="txt_result"/>
			</FadeView>;
       
      
      public var btn_close:Button = null;
      
      public var txt_end:Label = null;
      
      public var txt_next:Label = null;
      
      public var txt_result:Label = null;
      
      public function ShenYuanActiEndPanelUI()
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
