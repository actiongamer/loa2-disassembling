package game.ui.assistantModules.renders
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Box;
   import game.ui.commons.icons.LotteryRenderS4UI;
   import morn.core.components.Image;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import game.ui.commons.icons.WealthRender60X60UI;
   import game.ui.commons.icons.WealthRenderS19UI;
   
   public class AssisShopRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="310" height="125">
			  <Image skin="png.uiAssistantModules.img_shopBg" x="0" width="310" height="125"/>
			  <Label autoSize="left" x="100" y="10" height="20" style="小标题" var="txt_name" size="13" text="王者武器进阶图纸"/>
			  <Label text="(5/20)" x="210" y="11" height="18" var="txt_pieceNum" style="普通说明" align="right" width="88"/>
			  <Label text="每日限购：5/5" width="200" var="txt_limit" align="right" style="普通说明" x="97" y="36" multiline="true" wordWrap="true"/>
			  <List x="28" y="21" var="list_render">
			    <WealthRender60X60 name="render" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  </List>
			  <Box x="27" y="24" var="box_discount" width="147.3" height="64">
			    <LotteryRenderS4 x="78" scale="0.9" var="oriRes" y="18" runtime="game.ui.commons.icons.LotteryRenderS4UI"/>
			    <Image skin="png.a5.commonImgs.img_barginLine" y="24" x="76"/>
			    <Image skin="png.a5.comps.img_block" anchorX="0.5" anchorY="0.5" var="img_discount"/>
			  </Box>
			  <Label autoSize="left" x="98" y="25" width="134" height="20" style="下划线黄色" var="txt_bind" text="\l41210144" mouseEnabled="false" mouseChildren="false"/>
			  <List x="99" y="61" var="list_currRes" repeatX="2">
			    <WealthRenderS19 x="0" y="0" name="render" runtime="game.ui.commons.icons.WealthRenderS19UI"/>
			  </List>
			  <NumBarS1 x="100" y="90" var="inputNumView" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_pieceNum:Label = null;
      
      public var txt_limit:Label = null;
      
      public var list_render:List = null;
      
      public var box_discount:Box = null;
      
      public var oriRes:LotteryRenderS4UI = null;
      
      public var img_discount:Image = null;
      
      public var txt_bind:Label = null;
      
      public var list_currRes:List = null;
      
      public var inputNumView:NumBarS1UI = null;
      
      public function AssisShopRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS4UI"] = LotteryRenderS4UI;
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS19UI"] = WealthRenderS19UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
