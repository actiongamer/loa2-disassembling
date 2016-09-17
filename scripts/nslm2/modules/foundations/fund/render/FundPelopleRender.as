package nslm2.modules.foundations.fund.render
{
   import game.ui.fundModule.render.FundPelopleRenderUI;
   
   public class FundPelopleRender extends FundPelopleRenderUI
   {
       
      
      public function FundPelopleRender()
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
