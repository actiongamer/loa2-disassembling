package nslm2.modules.scenes.ctrls
{
   import com.mz.core.utils2.task.TaskList;
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.utils.RTools;
   
   public class LHHeroShowEffList extends TaskList
   {
       
      
      public var disposeList:Vector.<nslm2.modules.scenes.ctrls.LHHeroShowEffBase>;
      
      public function LHHeroShowEffList()
      {
         disposeList = new Vector.<nslm2.modules.scenes.ctrls.LHHeroShowEffBase>();
         super();
         this.addProcessHandler(list_onProcess);
      }
      
      private function list_onProcess(param1:TaskBase, param2:int, param3:TaskBase) : void
      {
         if(param3 is nslm2.modules.scenes.ctrls.LHHeroShowEffBase)
         {
            disposeList.push(param3);
         }
      }
      
      public function addDarkOther(param1:nslm2.modules.scenes.ctrls.LHHeroShowEffBase) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = this.taskArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = taskArr[_loc4_];
            if(_loc2_ != param1)
            {
               _loc2_.addDark();
            }
            _loc4_++;
         }
         _loc3_ = disposeList.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = disposeList[_loc4_];
            if(_loc2_ != param1)
            {
               _loc2_.addDark();
            }
            _loc4_++;
         }
      }
      
      public function removeDarkOther(param1:nslm2.modules.scenes.ctrls.LHHeroShowEffBase) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = this.taskArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = taskArr[_loc4_];
            if(_loc2_ != param1)
            {
               _loc2_.removeDark();
            }
            _loc4_++;
         }
         _loc3_ = disposeList.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = disposeList[_loc4_];
            if(_loc2_ != param1)
            {
               _loc2_.removeDark();
            }
            _loc4_++;
         }
      }
      
      override public function dispose() : void
      {
         RTools.disposeArrOrVector(this.disposeList);
      }
   }
}
