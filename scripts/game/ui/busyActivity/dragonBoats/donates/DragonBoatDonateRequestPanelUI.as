package game.ui.busyActivity.dragonBoats.donates
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class DragonBoatDonateRequestPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="370" height="460">
			  <PanelBgS3 x="0" y="0" width="335" height="168" showLightBottom="true" frameStyle="1" frameVisible="true" left="0" right="0" top="0" bottom="0" panelDragEnabled="false"/>
			  <Image skin="png.uiDragonBoat.pops.img_bg2" x="10" y="32" var="img_bg1"/>
			  <Image skin="png.uiFunnyCommon.img_list_title_bg" x="10" y="32"/>
			  <Label text="选" autoSize="none" x="18" y="35" style="小标题" var="txt_list_title_1" width="57" height="20" align="center"/>
			  <Label text="选" autoSize="none" x="111" y="35" style="小标题" var="txt_list_title_2" width="57" height="20" align="center"/>
			  <Label text="选" autoSize="none" x="186" y="35" style="小标题" var="txt_list_title_3" width="57" height="20" align="center"/>
			  <Label text="选" autoSize="none" x="279" y="35" style="小标题" var="txt_list_title_4" width="57" height="20" align="center"/>
			  <List x="12" y="55" repeatY="5" spaceY="3" var="list_material">
			    <DragonBoatDonateRequestRender name="render" runtime="game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateRequestRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_bg1:Image = null;
      
      public var txt_list_title_1:Label = null;
      
      public var txt_list_title_2:Label = null;
      
      public var txt_list_title_3:Label = null;
      
      public var txt_list_title_4:Label = null;
      
      public var list_material:List = null;
      
      public function DragonBoatDonateRequestPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.busyActivity.dragonBoats.donates.DragonBoatDonateRequestRenderUI"] = DragonBoatDonateRequestRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
