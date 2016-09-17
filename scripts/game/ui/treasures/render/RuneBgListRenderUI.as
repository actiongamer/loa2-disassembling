package game.ui.treasures.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RuneBgListRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="62" height="62" buttonMode="true">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="0" var="img_quality" y="0" sizeGrid="8,8,8,8" width="62" height="62"/>
			  <Image skin="png.a5.comps.img_block" x="3" y="3" width="56" height="56" var="img_icon"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="46" align="right" x="13" y="42" style="普通说明" mouseChildren="false"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function RuneBgListRenderUI()
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
