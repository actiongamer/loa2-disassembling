package game.ui.pkCrossSer.cheer
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class CheerRuleViewUI extends View
   {
      
      protected static var uiView:XML = <View width="392" height="460">
			  <Image skin="png.a5.commonImgs.img_yellow" x="115.5" y="6"/>
			  <Label text="规则说明" autoSize="none" x="166" y="12" style="加底标题"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="115.5" y="246"/>
			  <Label autoSize="none" x="166" y="252" style="加底标题" text="额外奖励"/>
			  <Label text="普通说明" autoSize="none" x="18.5" y="33" style="普通说明" width="355" height="210" var="txt_desc" multiline="true" wordWrap="true"/>
			  <Label autoSize="left" x="15" y="291" style="加底标题" text="第1名" var="tr0"/>
			  <Label autoSize="none" x="203" y="291" style="加底标题" text="第2-3名1" var="tr1" width="59" height="19" align="left"/>
			  <Label autoSize="left" x="15" y="353" style="加底标题" text="第4-6名" var="tr2"/>
			  <Label autoSize="left" x="203" y="353" style="加底标题" text="第7-10名" var="tr3" width="59" height="20"/>
			  <List x="77" y="291" repeatX="3" var="award0">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <List x="266" y="291" repeatX="3" var="award1">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <List x="77" y="353" repeatX="3" var="award2">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <List x="266" y="353" repeatX="3" var="award3">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			</View>;
       
      
      public var txt_desc:Label = null;
      
      public var tr0:Label = null;
      
      public var tr1:Label = null;
      
      public var tr2:Label = null;
      
      public var tr3:Label = null;
      
      public var award0:List = null;
      
      public var award1:List = null;
      
      public var award2:List = null;
      
      public var award3:List = null;
      
      public function CheerRuleViewUI()
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
