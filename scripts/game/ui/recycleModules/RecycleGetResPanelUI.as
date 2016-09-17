package game.ui.recycleModules
{
   import morn.core.components.View;
   import morn.customs.components.WealthList;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.ClickToNextUI;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class RecycleGetResPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="544" height="231">
			  <Image skin="png.a5.bgs.panelBgs.raw.底板四级" x="0" y="0" width="544"/>
			  <WealthList x="3" repeatX="8" repeatY="2" spaceX="8" spaceY="24" var="list_item" y="46">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </WealthList>
			  <Image skin="png.uiRecycle.标题底" x="157" y="15"/>
			  <Label text="分解获得" autoSize="left" x="240" y="20" style="普通说明" width="64" height="18" var="txt_title"/>
			  <ClickToNext y="221" x="399" var="clickTip" runtime="game.ui.commons.comps.others.ClickToNextUI"/>
			</View>;
       
      
      public var list_item:WealthList = null;
      
      public var txt_title:Label = null;
      
      public var clickTip:ClickToNextUI = null;
      
      public function RecycleGetResPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.ClickToNextUI"] = ClickToNextUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
