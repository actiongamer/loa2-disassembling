package game.ui.getItemsDisplayModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.ClickToNextUI;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class GetItemsDisplayModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="778.5" height="231">
			  <Image skin="png.a5.bgs.panelBgs.raw.底板四级" var="img_bg" sizeGrid="200,40,40,200" y="0" height="231" centerX="0"/>
			  <List y="48" var="list_items" repeatX="10" centerX="0" spaceX="40" x="62.75" repeatY="2" spaceY="40">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </List>
			  <Label text="获得奖励" autoSize="none" x="134.25" y="19" style="渐变1" width="275" height="22" align="center" var="txt_title" centerX="0"/>
			  <ClickToNext y="191" x="418" var="closeComp" runtime="game.ui.commons.comps.others.ClickToNextUI"/>
			  <Label text="屠魔印记收益加成：@param" autoSize="none" x="186.25" y="162" style="重要提示绿" width="167" height="20" var="label_buff" centerX="0" align="center" visible="false"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var list_items:List = null;
      
      public var txt_title:Label = null;
      
      public var closeComp:ClickToNextUI = null;
      
      public var label_buff:Label = null;
      
      public function GetItemsDisplayModuleUI()
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
