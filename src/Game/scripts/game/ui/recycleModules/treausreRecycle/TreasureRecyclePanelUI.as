package game.ui.recycleModules.treausreRecycle
{
   import morn.core.components.View;
   import game.ui.recycleModules.render.RecWealthRenderUI;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.recycleModules.render.RecycleItemRenderUI;
   
   public class TreasureRecyclePanelUI extends View
   {
      
      protected static var uiView:XML = <View width="778" height="476">
			  <Image skin="jpg.uiRecycle.equipBg" y="0" height="476" width="779"/>
			  <RecWealthRender y="27" var="costRender" x="668" runtime="game.ui.recycleModules.render.RecWealthRenderUI"/>
			  <Box x="157" y="350" var="box_destroyOp" visible="false">
			    <Image skin="png.uiRecycle.分割透明底"/>
			    <Button x="161" style="按钮大黄" var="btn_reborn" y="25" label="\l11300022" labelMargin="10"/>
			    <Image skin="png.uiRecycle.分解" x="162" y="24" mouseEnabled="false" mouseChildren="false"/>
			    <Label text="\l30609302 " autoSize="left" x="151" y="76" style="重要提示橘黄" width="415" height="18" var="txt_tips"/>
			    <Button skin="png.uiRecycle.btn_help" x="119" y="74" stateNum="1" var="btn_help"/>
			  </Box>
			  <List x="144" y="45" var="list_heros">
			    <RecycleItemRender y="97" name="item3" x="0" runtime="game.ui.recycleModules.render.RecycleItemRenderUI"/>
			    <RecycleItemRender x="192" y="175" name="item0" runtime="game.ui.recycleModules.render.RecycleItemRenderUI"/>
			    <RecycleItemRender x="373" y="100" name="item4" runtime="game.ui.recycleModules.render.RecycleItemRenderUI"/>
			    <RecycleItemRender x="282" name="item2" runtime="game.ui.recycleModules.render.RecycleItemRenderUI"/>
			    <RecycleItemRender x="91" name="item1" runtime="game.ui.recycleModules.render.RecycleItemRenderUI"/>
			  </List>
			</View>;
       
      
      public var costRender:RecWealthRenderUI = null;
      
      public var box_destroyOp:Box = null;
      
      public var btn_reborn:Button = null;
      
      public var txt_tips:Label = null;
      
      public var btn_help:Button = null;
      
      public var list_heros:List = null;
      
      public function TreasureRecyclePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.recycleModules.render.RecWealthRenderUI"] = RecWealthRenderUI;
         viewClassMap["game.ui.recycleModules.render.RecycleItemRenderUI"] = RecycleItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
