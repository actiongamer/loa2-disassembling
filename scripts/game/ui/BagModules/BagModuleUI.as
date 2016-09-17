package game.ui.BagModules
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.customs.components.WealthList;
   import morn.core.components.Tab;
   import morn.customs.components.HBoxTween;
   import morn.core.components.Button;
   import morn.core.components.Image;
   
   public class BagModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="629" height="502">
			  <PanelBg x="0" y="0" width="629" height="502" bgBMargin="10,35,10,50" showImgTitle1="false" showTabLine="true"/>
			  <PageBarS2 x="444" y="455" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="15" y="75" sizeGrid="20,20,20,20" width="598" height="369"/>
			  <WealthList x="36" y="87" repeatX="8" repeatY="5" spaceX="6" spaceY="6" var="list_items">
			    <BagItemRender name="render" runtime="game.ui.BagModules.BagItemRenderUI"/>
			  </WealthList>
			  <Tab labels="标 签,标 签,标 签,标 签,标 签,标 签,标 签" x="24" y="40" selectedIndex="1" space="2" var="tabKindGroup" style="TAB长"/>
			  <HBoxTween x="37" y="453" space="25" align="bottom" var="boxBtns">
			    <Button label="整  理" buttonMode="true" var="btn_order" style="按钮中绿" labelMargin="24"/>
			    <Button label="批量出售" buttonMode="true" x="121" var="btn_sell" style="按钮中绿" labelMargin="20"/>
			    <Button label="回  收" buttonMode="true" x="131" var="btn_recycle" style="按钮中黄" y="10" labelMargin="20"/>
			  </HBoxTween>
			  <Image skin="png.uiBag.整理" x="22" y="439" var="img_icon_order"/>
			  <Image skin="png.uiBag.快捷出售" x="128" y="442" var="img_icon_sell"/>
			  <Image skin="png.uiBag.回收" x="238" y="443" var="img_icon_recycle"/>
			</PopModuleView>;
       
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var list_items:WealthList = null;
      
      public var tabKindGroup:Tab = null;
      
      public var boxBtns:HBoxTween = null;
      
      public var btn_order:Button = null;
      
      public var btn_sell:Button = null;
      
      public var btn_recycle:Button = null;
      
      public var img_icon_order:Image = null;
      
      public var img_icon_sell:Image = null;
      
      public var img_icon_recycle:Image = null;
      
      public function BagModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.BagModules.BagItemRenderUI"] = BagItemRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
