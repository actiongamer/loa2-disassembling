package game.ui.mallModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class MallModuleViewUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="900" height="599">
			  <PanelBgMall showTabLine="false" x="0" y="3"/>
			  <Tab labels="首页,时装,道具,礼包" x="64" y="79" selectedIndex="0" style="TAB短" var="tabBar"/>
			  <Label text="商 城" autoSize="none" x="403" y="39" style="渐变1" width="104" height="22" align="center"/>
			  <Box x="569" y="77" var="boxQQVip">
			    <Label autoSize="none" y="5" style="渐变1" width="153" height="20" align="right" var="txtQQvipTip" text="黄钻重置享受8折优惠" size="14"/>
			    <Button x="154" style="按钮中蓝" var="btn_qqVip" y="-3"/>
			  </Box>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var boxQQVip:Box = null;
      
      public var txtQQvipTip:Label = null;
      
      public var btn_qqVip:Button = null;
      
      public function MallModuleViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
