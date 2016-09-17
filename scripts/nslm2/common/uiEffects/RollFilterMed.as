package nslm2.common.uiEffects
{
   import com.mz.core.mediators.RollMediator;
   import flash.display.DisplayObject;
   
   public class RollFilterMed extends RollMediator
   {
       
      
      private var filters:Array;
      
      public var target:DisplayObject;
      
      public function RollFilterMed(param1:DisplayObject, param2:Array, param3:DisplayObject = null)
      {
         this.filters = param2;
         target = param3 || param1;
         super(param1,this.rollHandler);
         if(param1 == null)
         {
            throw new Error(param1 + "can be null");
         }
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         if(filters == null)
         {
            return;
         }
         if(param1)
         {
            target.filters = filters;
         }
         else
         {
            target.filters = [];
         }
      }
      
      override public function dispose() : void
      {
         target = null;
         super.dispose();
      }
   }
}
