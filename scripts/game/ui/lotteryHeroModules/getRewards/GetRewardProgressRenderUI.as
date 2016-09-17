package game.ui.lotteryHeroModules.getRewards
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GetRewardProgressRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="57" height="67">
			  <Image skin="png.a5.commonImgs.btn_reward" var="img_icon"/>
			  <Label text="普通说明" autoSize="left" x="2.5" y="51" style="普通说明" var="txt_name"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public function GetRewardProgressRenderUI()
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
