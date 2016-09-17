package game.ui.treasures.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   
   public class RuneRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="20" height="20">
			  <Image skin="png.uiTreasure.宝石道具框" x="-2" y="-2"/>
			  <Image skin="png.comp.image" x="1" y="1" var="img_icon" width="16" height="16"/>
			  <Image skin="png.a5.commonImgs.img_lock" x="3" y="1" scale=".4" smoothing="true" var="img_lock"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var img_lock:Image = null;
      
      public function RuneRenderUI()
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
