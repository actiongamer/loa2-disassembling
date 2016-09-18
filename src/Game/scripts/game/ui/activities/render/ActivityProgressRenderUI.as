package game.ui.activities.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class ActivityProgressRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="559" height="78">
			  <Image skin="png.a5.commonImgs.img_gotReward" x="458" var="img_gotReward" y="0"/>
			  <Label autoSize="left" style="技能名标题" width="151" var="txt_condAndProgress" bold="true" size="12" wordWrap="true" x="8" text="12312" y="28.5" multiline="true"/>
			  <Button label="按钮" x="439" style="按钮大绿" y="28" var="btn_reward" mouseChildren="false"/>
			  <Image skin="png.a5.commonImgs.img_splitLine" x="19" y="80"/>
			  <Box x="163" y="21" var="box_exchange">
			    <List x="138" repeatX="1" spaceX="6" var="list_reward">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			    <List repeatX="1" spaceX="6" var="list_cost">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			    <Image skin="png.a5.commonImgs.img_arrowRight" x="71" y="9" var="img_arrow"/>
			  </Box>
			  <Label text="VIP5专享" autoSize="none" x="5" y="9" style="渐变1" width="86" height="27" size="14" var="txt_vip"/>
			  <Label autoSize="left" style="技能名标题" width="136" var="txt_progress" bold="true" size="12" wordWrap="true" x="430" text="12312" y="61" align="center"/>
			</View>;
       
      
      public var img_gotReward:Image = null;
      
      public var txt_condAndProgress:Label = null;
      
      public var btn_reward:Button = null;
      
      public var box_exchange:Box = null;
      
      public var list_reward:List = null;
      
      public var list_cost:List = null;
      
      public var img_arrow:Image = null;
      
      public var txt_vip:Label = null;
      
      public var txt_progress:Label = null;
      
      public function ActivityProgressRenderUI()
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
