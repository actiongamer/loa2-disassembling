package game.ui.pkCrossSer.cheer
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class CheerAwardRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="376" height="78">
			  <Image skin="png.uiPKCrossSer.img_cheer_bg" x="0" y="0"/>
			  <Label text="普通说明" autoSize="none" x="91" y="16" style="普通说明" width="173" height="45" var="txt_desc" align="center" multiline="true" wordWrap="true"/>
			  <Label text="普通说明" autoSize="none" x="106" y="51" style="普通说明" width="140" height="20" var="txt_desc1" align="center"/>
			  <Button label="领取奖励" x="271" y="27" style="按钮中绿" var="btn_award"/>
			  <List x="26" y="11" var="list_reward" repeatX="1" spaceX="2">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="270" y="-1" var="img_got"/>
			</View>;
       
      
      public var txt_desc:Label = null;
      
      public var txt_desc1:Label = null;
      
      public var btn_award:Button = null;
      
      public var list_reward:List = null;
      
      public var img_got:Image = null;
      
      public function CheerAwardRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
