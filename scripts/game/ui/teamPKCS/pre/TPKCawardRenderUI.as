package game.ui.teamPKCS.pre
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class TPKCawardRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="212" height="42">
			  <Label text="普通说明" autoSize="none" x="51" y="3" style="普通说明" width="108" height="37" var="txt"/>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="159" y="-6" scaleX="0.7" scaleY="0.7" smoothing="true" var="img_got"/>
			  <WealthRenderS5 x="3" y="1" scaleX=".8" scaleY=".8" var="reward" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			</View>;
       
      
      public var txt:Label = null;
      
      public var img_got:Image = null;
      
      public var reward:WealthRenderS5UI = null;
      
      public function TPKCawardRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
