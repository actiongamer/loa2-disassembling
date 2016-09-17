package game.ui.fashionModules
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class FashionListSubRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="207" height="117">
			  <Image skin="png.uiFashion.img_listRenderBg" x="0" y="-1"/>
			  <Box x="9" y="9" var="box_info">
			    <Label text="天女散花" autoSize="left" style="重要提示橘黄" size="13" var="txt_name" width="65" multiline="true" wordWrap="true"/>
			    <Label text="\l30200000" autoSize="left" y="63" width="65" height="18" style="重要提示橘黄" size="13" multiline="true" wordWrap="true"/>
			    <List x="64" y="59" repeatY="2" var="list_skill">
			      <FashionSuitSkillRender name="render" runtime="game.ui.fashionModules.FashionSuitSkillRenderUI"/>
			    </List>
			    <FashionRender x="71" y="1" var="clothRender" runtime="game.ui.fashionModules.FashionRenderUI"/>
			    <FashionRender x="132" y="1" var="wingRender" runtime="game.ui.fashionModules.FashionRenderUI"/>
			  </Box>
			  <Image skin="png.uiFashion.selectBox" x="-4" y="-5" mouseChildren="false" mouseEnabled="false" name="selectBox0"/>
			</View>;
       
      
      public var box_info:Box = null;
      
      public var txt_name:Label = null;
      
      public var list_skill:List = null;
      
      public var clothRender:game.ui.fashionModules.FashionRenderUI = null;
      
      public var wingRender:game.ui.fashionModules.FashionRenderUI = null;
      
      public function FashionListSubRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.fashionModules.FashionRenderUI"] = game.ui.fashionModules.FashionRenderUI;
         viewClassMap["game.ui.fashionModules.FashionSuitSkillRenderUI"] = FashionSuitSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
