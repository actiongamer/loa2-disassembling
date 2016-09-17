package game.ui.groupon
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderSize24UI;
   import morn.core.components.Label;
   
   public class GrouponModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="-3" y="1" width="804" height="551" showTabLine="true"/>
			  <Tab labels="精彩团购,积分奖励" x="22" y="41" style="TAB长" var="tab_title" selectedIndex="0"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="168" y="38" var="img_redPoint" mouseEnabled="false" mouseChildren="false"/>
			  <WealthRenderSize24 x="438" y="35" var="diamondRender" runtime="game.ui.commons.icons.WealthRenderSize24UI"/>
			  <WealthRenderSize24 x="610" y="35" var="couponRender" runtime="game.ui.commons.icons.WealthRenderSize24UI"/>
			  <WealthRenderSize24 x="696" y="35" var="scoreRender" runtime="game.ui.commons.icons.WealthRenderSize24UI"/>
			  <Label text="活动倒计时：12:12:20" autoSize="none" x="190" y="41" style="普通绿色" var="txt_activityCD" width="287" height="20"/>
			  <WealthRenderSize24 x="524" y="35" var="diamondRender2" runtime="game.ui.commons.icons.WealthRenderSize24UI"/>
			</PopModuleView>;
       
      
      public var tab_title:Tab = null;
      
      public var img_redPoint:Image = null;
      
      public var diamondRender:WealthRenderSize24UI = null;
      
      public var couponRender:WealthRenderSize24UI = null;
      
      public var scoreRender:WealthRenderSize24UI = null;
      
      public var txt_activityCD:Label = null;
      
      public var diamondRender2:WealthRenderSize24UI = null;
      
      public function GrouponModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderSize24UI"] = WealthRenderSize24UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
