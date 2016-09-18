package game.ui.chapters
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS11UI;
   
   public class TreasureBoxModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="356" height="238">
			  <PanelBgS3 x="0" y="0" width="356" height="238"/>
			  <List x="71" y="86" repeatX="3" spaceX="32" var="list_item">
			    <WealthRenderS11 name="render" runtime="game.ui.commons.icons.WealthRenderS11UI"/>
			  </List>
			  <Label text="本章获得星数不足14星" autoSize="left" x="16.5" var="txt_des" y="36" width="325" height="45" align="center" style="重要提示橘黄" size="14" multiline="true" wordWrap="true"/>
			  <Button label="关闭" y="187" style="按钮大红" x="118.5" var="btn_cancel"/>
			  <Button label="领取" x="118.5" y="186" style="按钮大绿" var="btn_confirm"/>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="-1" y="11" mouseChildren="false" mouseEnabled="false" var="img_hasReward"/>
			</PopModuleView>;
       
      
      public var list_item:List = null;
      
      public var txt_des:Label = null;
      
      public var btn_cancel:Button = null;
      
      public var btn_confirm:Button = null;
      
      public var img_hasReward:Image = null;
      
      public function TreasureBoxModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS11UI"] = WealthRenderS11UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
