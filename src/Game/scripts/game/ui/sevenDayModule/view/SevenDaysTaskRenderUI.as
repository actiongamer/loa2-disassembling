package game.ui.sevenDayModule.view
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class SevenDaysTaskRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="541" height="80">
			  <Image skin="png.uiSevenDays.taskBG" x="0" y="0" width="541"/>
			  <Label text="主线副本通关第N章" x="19" y="20" style="重要提示橘黄" bold="true" var="txt_title" autoSize="left" width="315" multiline="true" wordWrap="true" language="en" lgx="19,19" lgy="12,20"/>
			  <Label text="进度" x="21" y="40" width="126" height="20" style="普通绿色" var="txt_progress" language="en" lgx="21,21" lgy="52,40"/>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="424" y="1" var="img_gotReward"/>
			  <Button label="按钮" x="401" style="按钮大绿" y="24" var="btn_go"/>
			  <List x="344.5" y="13" repeatX="1" spaceX="-110" var="list_reward">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="\l13300401" x="132" y="40" width="126" height="20" style="小标题" var="txt_hint" visible="false" language="en" lgx="132,132" lgy="52,40"/>
			</View>;
       
      
      public var txt_title:Label = null;
      
      public var txt_progress:Label = null;
      
      public var img_gotReward:Image = null;
      
      public var btn_go:Button = null;
      
      public var list_reward:List = null;
      
      public var txt_hint:Label = null;
      
      public function SevenDaysTaskRenderUI()
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
