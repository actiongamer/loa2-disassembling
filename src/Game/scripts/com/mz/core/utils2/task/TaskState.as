package com.mz.core.utils2.task
{
   public class TaskState
   {
      
      public static const FREE:int = 70;
      
      public static const START:int = 71;
      
      public static const PROCESS:int = 72;
      
      public static const COMPLETE:int = 73;
      
      public static const ERROR:int = 74;
       
      
      public function TaskState()
      {
         super();
      }
      
      public static function toNameString(param1:int) : String
      {
         switch(int(param1) - 70)
         {
            case 0:
               return "Free";
            case 1:
               return "Start";
            case 2:
               return "Process";
            case 3:
               return "Complete";
            case 4:
               return "Error";
         }
      }
   }
}
