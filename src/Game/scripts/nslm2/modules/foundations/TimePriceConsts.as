package nslm2.modules.foundations
{
   import com.mz.core.utils.DictHash;
   
   public class TimePriceConsts
   {
      
      public static var idDict:DictHash = new DictHash();
       
      
      public function TimePriceConsts()
      {
         super();
         idDict.put(1,10020);
         idDict.put(3,10610);
         idDict.put(5,10310);
      }
   }
}
