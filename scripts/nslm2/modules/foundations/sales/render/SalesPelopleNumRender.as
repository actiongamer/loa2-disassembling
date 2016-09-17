package nslm2.modules.foundations.sales.render
{
   import game.ui.salesModule.render.SalesPelopleNumRenderUI;
   
   public class SalesPelopleNumRender extends SalesPelopleNumRenderUI
   {
       
      
      public function SalesPelopleNumRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = param1;
         this.clip_value.value = _loc2_;
      }
   }
}
