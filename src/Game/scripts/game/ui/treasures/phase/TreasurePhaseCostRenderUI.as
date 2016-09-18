package game.ui.treasures.phase
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.customs.components.GCircle;
   
   public class TreasurePhaseCostRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="64" height="64">
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="58" height="58" smoothing="true"/>
			  <Label autoSize="center" y="66" style="普通说明" var="txt_countAndNeed" text="12312" centerX="0"/>
			  <GCircle fillAlpha="0.5" lineAlpha="0" width="60" height="60" var="img_mask" x="2" y="2"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_countAndNeed:Label = null;
      
      public var img_mask:GCircle = null;
      
      public function TreasurePhaseCostRenderUI()
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
