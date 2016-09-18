package game.ui.fundModule.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class FundRewardRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="475" height="93">
			  <Image skin="png.uiFund.分割线" x="1" y="69"/>
			  <Label autoSize="none" x="87" y="18" style="普通说明" var="label_aim" text="达到20级"/>
			  <Button label="领取" x="336" y="25" style="按钮大绿" stateNum="1" var="btn_canGet"/>
			  <Label text="进度" autoSize="none" x="87" y="38" style="普通说明" var="label_process" width="227" height="20"/>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="348" y="-3" var="img_gotReward"/>
			  <List x="16" y="9" var="list_item" spaceX="10">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </List>
			</View>;
       
      
      public var label_aim:Label = null;
      
      public var btn_canGet:Button = null;
      
      public var label_process:Label = null;
      
      public var img_gotReward:Image = null;
      
      public var list_item:List = null;
      
      public function FundRewardRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
