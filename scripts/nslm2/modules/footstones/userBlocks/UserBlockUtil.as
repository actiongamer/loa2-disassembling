package nslm2.modules.footstones.userBlocks
{
   import com.mz.core.mgrs.ObserverMgr;
   
   public class UserBlockUtil
   {
       
      
      public function UserBlockUtil()
      {
         super();
      }
      
      public static function switchBlock(param1:Boolean, param2:String) : void
      {
         if(param1)
         {
            ObserverMgr.ins.sendNotice("MSG_USER_BLOCK",param2);
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_USER_UN_BLOCK",param2);
         }
      }
   }
}
