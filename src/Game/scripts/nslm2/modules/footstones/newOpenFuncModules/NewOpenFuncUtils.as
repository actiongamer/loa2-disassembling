package nslm2.modules.footstones.newOpenFuncModules
{
   import flash.display.DisplayObject;
   import nslm2.common.globals.GlobalRef;
   
   public class NewOpenFuncUtils
   {
       
      
      public function NewOpenFuncUtils()
      {
         super();
      }
      
      public static function getFunIcon(param1:int) : DisplayObject
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = param1;
         if(30200 !== _loc4_)
         {
            if(30607 !== _loc4_)
            {
               if(30501 !== _loc4_)
               {
                  if(30502 !== _loc4_)
                  {
                     if(30109 === _loc4_)
                     {
                        param1 = 30701;
                     }
                  }
               }
               param1 = 30500;
            }
            else
            {
               param1 = 30600;
            }
         }
         else
         {
            param1 = 30810;
         }
         _loc2_ = GlobalRef.bottomModuleBtns.getIconByModuleId(param1);
         if(_loc2_ == null)
         {
         }
         return _loc2_;
      }
   }
}
