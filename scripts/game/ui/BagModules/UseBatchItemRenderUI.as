package game.ui.BagModules
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class UseBatchItemRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="171" height="64">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="3" var="img_quality" y="0" sizeGrid="8,8,8,8" width="64" height="64"/>
			  <Image skin="png.a5.comps.img_block" x="7" y="4" width="56" height="56" var="img_icon"/>
			  <Label text="中级强化强化" stroke="0xffffff" mouseEnabled="false" var="txt_name" align="left" autoSize="left" style="随品质变化" x="135" y="4"/>
			  <Label text="道具名称:" autoSize="left" x="75" y="4" style="重要提示橘黄"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public function UseBatchItemRenderUI()
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
