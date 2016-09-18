package nslm2.modules.footstones.newerAlertModules
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.footstones.newerAlertModules.tasks.NewerAlertOpenModule;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.footstones.newerAlertModules.tasks.NewerAlertAutoAddExp;
   import nslm2.modules.footstones.newerAlertModules.tasks.NewerAlertToTupo;
   
   public class NewerAlertTaskFactory
   {
      
      private static var _classDictHash:DictHash;
       
      
      public function NewerAlertTaskFactory()
      {
         super();
      }
      
      public static function getTaskByFuncId(param1:int) : TaskBase
      {
         var _loc2_:Class = classDictHash.getValue(param1);
         if(_loc2_)
         {
            return new _loc2_(param1);
         }
         return new NewerAlertOpenModule(param1);
      }
      
      public static function get classDictHash() : DictHash
      {
         if(_classDictHash == null)
         {
            _classDictHash = new DictHash();
            _classDictHash.put(20010,NewerAlertAutoAddExp);
            _classDictHash.put(30110,NewerAlertToTupo);
         }
         return _classDictHash;
      }
   }
}
