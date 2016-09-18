package nslm2.modules.funnies.funnyEvents
{
   public class FunnyEventConsts
   {
      
      private static var _ins:nslm2.modules.funnies.funnyEvents.FunnyEventConsts;
      
      public static const KIND_GUAJI_PVP:int = 41300060;
       
      
      public var tabIdArr:Array;
      
      public function FunnyEventConsts()
      {
         tabIdArr = [50280,41213,41222];
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.funnyEvents.FunnyEventConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.funnyEvents.FunnyEventConsts();
         }
         return _ins;
      }
   }
}
