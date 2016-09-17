package game.ui.horseModules.horseChange
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class HorseCostRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="130" height="56">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_4" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="56" height="56"/>
			  <Image skin="png.comp.image" x="4" y="4" var="img_icon" width="48" height="48"/>
			  <Label text="需要碎片" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" autoSize="left" x="58" y="7" letterSpacing="1" width="64" height="18" align="left" style="普通说明"/>
			  <Label text="1000/1000" stroke="0xffffff" mouseEnabled="false" var="txt_countAndNeed" backgroundColor="0xcfbeaf" autoSize="none" align="left" x="59" y="34" width="70" height="16" style="重要提示绿"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_countAndNeed:Label = null;
      
      public function HorseCostRenderUI()
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
