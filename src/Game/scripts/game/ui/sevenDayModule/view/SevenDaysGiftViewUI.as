package game.ui.sevenDayModule.view
{
   import morn.customs.components.FadeView;
   import morn.core.components.Image;
   import morn.customs.components.WealthList;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class SevenDaysGiftViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView var="gift_view" width="568" height="469">
			  <Image skin="png.a5.comps.img_block" x="0" y="0" width="569" height="473" var="img_bg"/>
			  <WealthList x="199" y="303" var="list_reward" repeatX="3" centerX="0" spaceX="8">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </WealthList>
			  <Button label="领取奖励" y="404" style="按钮大绿" x="222" var="get_gift"/>
			  <List x="42" y="16" var="daily_list" repeatX="7" spaceX="-160">
			    <DayGiftRender x="0" y="0" name="render" buttonMode="true" runtime="game.ui.sevenDayModule.view.DayGiftRenderUI"/>
			  </List>
			  <Label text="\l13100603" x="152.5" y="251" width="263" align="center" size="15" height="25"/>
			</FadeView>;
       
      
      public var gift_view:FadeView = null;
      
      public var img_bg:Image = null;
      
      public var list_reward:WealthList = null;
      
      public var get_gift:Button = null;
      
      public var daily_list:List = null;
      
      public function SevenDaysGiftViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         viewClassMap["game.ui.sevenDayModule.view.DayGiftRenderUI"] = DayGiftRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
