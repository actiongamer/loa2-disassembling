package game.ui.roleInfos
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Tab;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import game.ui.commons.comps.others.RecycleAlertRenderUI;
   
   public class RoleInfoPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="552">
			  <PanelBg width="803" height="553" showTabLine="true" x="0" y="0"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.底板一级二级底九宫格" x="3" y="68" width="798" height="481" sizeGrid="20,20,20,20" var="img_funBg"/>
			  <Tab labels="基础信息,升级,升阶,突破" x="24" y="40" selectedIndex="0" var="tabBar" style="TAB超长"/>
			  <Box x="749" y="67" var="box_btn_right">
			    <Image skin="png.a5.btns.img_btnLongBarBg" width="51" height="482" sizeGrid="0,20,0,20" var="img_rightBg" smoothing="true" x="0" y="0"/>
			    <Button skin="png.a5.btns.btn_longBar" x="13" y="213" stateNum="3" var="btn_rightArrow"/>
			  </Box>
			  <RecycleAlertRender x="4" y="459" var="render_recycle" runtime="game.ui.commons.comps.others.RecycleAlertRenderUI"/>
			  <Box x="52" y="67" scaleX="-1" var="box_btn_left">
			    <Image skin="png.a5.btns.img_btnLongBarBg" width="51" height="482" sizeGrid="0,20,0,20" var="img_leftBg" smoothing="true" x="0" y="0"/>
			    <Button skin="png.a5.btns.btn_longBar" x="13" y="213" stateNum="3" var="btn_leftArrow"/>
			  </Box>
			</PopModuleView>;
       
      
      public var img_funBg:Image = null;
      
      public var tabBar:Tab = null;
      
      public var box_btn_right:Box = null;
      
      public var img_rightBg:Image = null;
      
      public var btn_rightArrow:Button = null;
      
      public var render_recycle:RecycleAlertRenderUI = null;
      
      public var box_btn_left:Box = null;
      
      public var img_leftBg:Image = null;
      
      public var btn_leftArrow:Button = null;
      
      public function RoleInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RecycleAlertRenderUI"] = RecycleAlertRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
