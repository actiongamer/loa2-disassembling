package game.ui.roleInfos.phaseUps.talents
{
   import morn.customs.components.LotteryRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class PhaseUpTalentCostRenderUI extends LotteryRender
   {
      
      protected static var uiView:XML = <LotteryRender showMultipleSign="false" width="61" height="25">
			  <Label text="x9999" autoSize="left" x="29" y="4" color="0xffe0a3" var="txt_num" style="随品质变化"/>
			  <Image skin="png.comp.image" var="img_icon" width="25" height="25"/>
			</LotteryRender>;
       
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public function PhaseUpTalentCostRenderUI()
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
