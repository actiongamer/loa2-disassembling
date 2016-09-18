package nslm2.utils
{
   import nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
   
   public class YuanFenUtil
   {
       
      
      public function YuanFenUtil()
      {
         super();
      }
      
      public static function sortYuanfen(param1:MengYuePropVo, param2:MengYuePropVo) : int
      {
         if(param1.isActivate && param2.isActivate)
         {
            if(param1.mengYueId > param2.mengYueId)
            {
               return 1;
            }
            return -1;
         }
         if(param1.isActivate)
         {
            return -1;
         }
         if(param2.isActivate)
         {
            return 1;
         }
         if(param1.mengYueId > param2.mengYueId)
         {
            return 1;
         }
         return -1;
      }
   }
}
