package nslm2.modules.foundations.mainToolBar
{
   public class RedPointVo
   {
      
      public static const MOUDLE_ID:String = "moduleID";
       
      
      public var moduleID:int;
      
      public var count:int;
      
      public function RedPointVo(param1:int, param2:int = 0)
      {
         super();
         moduleID = param1;
         count = param2;
      }
   }
}
