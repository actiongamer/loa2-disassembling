package game.ui.newYears.day51s.renders
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderSize56UI;
   import morn.customs.components.ClipList;
   
   public class Day51RewardIconUI extends View
   {
      
      protected static var uiView:XML = <View width="56" height="56">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_1" x="0" y="0" var="img_bg"/>
			  <WealthRenderSize56 x="0" y="0" var="wealthRender" runtime="game.ui.commons.icons.WealthRenderSize56UI"/>
			  <Image skin="png.uiDay51.img_lock" x="0" y="0" var="img_lock"/>
			  <ClipList value="3" clipWidth="31" align="left" url="png.a5.comps.clipList.clipList_S25" x="12.5" y="4.5" var="img_num"/>
			  <Image skin="png.uiDay51.img_flag" x="14" y="9" var="img_mustHaveNo"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var wealthRender:WealthRenderSize56UI = null;
      
      public var img_lock:Image = null;
      
      public var img_num:ClipList = null;
      
      public var img_mustHaveNo:Image = null;
      
      public function Day51RewardIconUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderSize56UI"] = WealthRenderSize56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
