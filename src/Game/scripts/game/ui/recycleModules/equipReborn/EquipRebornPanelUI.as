package game.ui.recycleModules.equipReborn
{
   import morn.core.components.View;
   import game.ui.recycleModules.render.RecycleItemRenderUI;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS8UI;
   import game.ui.commons.comps.others.RecycleAlertRenderUI;
   
   public class EquipRebornPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="778" height="476">
			  <Image skin="jpg.uiRecycle.equipBg" y="0" height="476" width="779"/>
			  <RecycleItemRender x="336" y="115" var="iconRender" runtime="game.ui.recycleModules.render.RecycleItemRenderUI"/>
			  <Box x="157" y="350" var="box_destroyOp">
			    <Image skin="png.uiRecycle.分割透明底"/>
			    <Button x="161" style="按钮大绿" var="btn_reborn" y="25" label="          重生" labelMargin="55"/>
			    <WealthRenderS8 x="172" y="31" var="costRender" mouseEnabled="false" mouseChildren="false" runtime="game.ui.commons.icons.WealthRenderS8UI"/>
			    <RecycleAlertRender x="-138" y="-324" var="render_recycle" runtime="game.ui.commons.comps.others.RecycleAlertRenderUI"/>
			  </Box>
			</View>;
       
      
      public var iconRender:RecycleItemRenderUI = null;
      
      public var box_destroyOp:Box = null;
      
      public var btn_reborn:Button = null;
      
      public var costRender:WealthRenderS8UI = null;
      
      public var render_recycle:RecycleAlertRenderUI = null;
      
      public function EquipRebornPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RecycleAlertRenderUI"] = RecycleAlertRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS8UI"] = WealthRenderS8UI;
         viewClassMap["game.ui.recycleModules.render.RecycleItemRenderUI"] = RecycleItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
