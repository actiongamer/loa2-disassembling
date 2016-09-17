package game.ui.recycleModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.recycleModules.render.RecWealthRenderUI;
   
   public class RecycleModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="806" height="547">
			  <PanelBg x="3" y="-1" width="803" height="557"/>
			  <Tab labels="英雄分解,装备分解,英雄重生" x="20" y="42" selectedIndex="-1" style="TAB超长" var="tabBar"/>
			  <Image y="67" height="475" width="779" x="14" var="img_bg" skin="jpg.uiRecycle.bg"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" sizeGrid="14,18,14,14" width="780" height="477" y="66" x="14" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" y="38" x="103" var="img_redPoint1" visible="false"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" y="38" x="209" var="img_redPoint2" visible="false"/>
			  <Box x="167" y="426" var="box_destroyOp">
			    <Image skin="png.a5.commonImgs.img_recycleAlertBg" x="95" y="66" width="253" height="26"/>
			    <Image skin="png.a5.commonImgs.分割透明底"/>
			    <Label text="分解闲置装备可获得大量XX和养成资源" autoSize="left" x="131" y="71" style="重要提示橘黄" width="415" height="18" var="txt_tips"/>
			    <Button skin="png.uiRecycle.btn_help" x="99" y="69" stateNum="1" var="btn_help"/>
			    <Box x="86" y="22">
			      <Button label="\l11300021" style="按钮大绿" var="btn_autoAdd" labelMargin="15"/>
			      <Button label="\l11300022" x="163" style="按钮大黄" var="btn_recycle" labelMargin="10"/>
			    </Box>
			    <Image skin="png.uiRecycle.分解" x="250" y="21" mouseEnabled="false"/>
			    <Image skin="png.uiRecycle.制动添加" x="86" y="21" mouseEnabled="false"/>
			  </Box>
			  <Box x="679" y="92" var="box_shop" width="99" height="82">
			    <Button skin="png.uiRecycle.btn_syShop" stateNum="1" x="37" var="btn_shop" y="0"/>
			    <Label text="\l9760300" autoSize="none" x="33" y="43" style="随品质变化" width="70" height="18" align="center" mouseEnabled="false" mouseChildren="false"/>
			    <RecWealthRender y="61" var="costRender" runtime="game.ui.recycleModules.render.RecWealthRenderUI"/>
			  </Box>
			  <Box x="247" y="95" var="box_rebornHint" visible="false">
			    <Image skin="png.a5.commonImgs.气泡" var="txt_bg" smoothing="true" scaleY="-1" y="37" width="161" height="68"/>
			    <Label text="橙装可以进行重生，返还全部橙装碎片和养成材料" autoSize="none" style="普通说明" multiline="true" wordWrap="true" width="140" height="38" var="label_rebornHint" x="10" y="-1"/>
			  </Box>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var img_bg:Image = null;
      
      public var img_redPoint1:Image = null;
      
      public var img_redPoint2:Image = null;
      
      public var box_destroyOp:Box = null;
      
      public var txt_tips:Label = null;
      
      public var btn_help:Button = null;
      
      public var btn_autoAdd:Button = null;
      
      public var btn_recycle:Button = null;
      
      public var box_shop:Box = null;
      
      public var btn_shop:Button = null;
      
      public var costRender:RecWealthRenderUI = null;
      
      public var box_rebornHint:Box = null;
      
      public var txt_bg:Image = null;
      
      public var label_rebornHint:Label = null;
      
      public function RecycleModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.recycleModules.render.RecWealthRenderUI"] = RecWealthRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
