package nslm2.modules.dungeons.scripts
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import com.mz.core.logging.Log;
   import nslm2.modules.dungeons.scripts.configs.ScriptConfigList;
   import com.mz.core.utils2.task.TaskPool;
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmdBase;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   
   public class ScriptLib extends TaskBase
   {
       
      
      public var scriptId:int;
      
      private var scriptUrl:String;
      
      private var scriptOb:Object;
      
      public function ScriptLib(param1:int, param2:String)
      {
         super();
         scriptId = param1;
         scriptUrl = param2;
      }
      
      override public function exec() : void
      {
         super.exec();
         if(this.scriptUrl)
         {
            if(EnvConfig.ins.useServer == false)
            {
               ResMgr.ins.delRes(this.scriptUrl);
            }
            ResMgr.ins.load(8,this.scriptUrl,scriptLoad_cpl);
         }
         else
         {
            this.onComplete();
         }
      }
      
      private function scriptLoad_cpl(param1:String, param2:String) : void
      {
         var _loc3_:* = null;
         _loc3_ = param2;
         if(_loc3_)
         {
            try
            {
               scriptOb = JSON.parse(_loc3_);
            }
            catch(err:Error)
            {
               Log.fatal(this,"脚本解析错误",param1);
               return;
            }
         }
         countPreload();
      }
      
      private function countPreload() : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:* = null;
         _loc5_ = [];
         var _loc8_:int = 0;
         var _loc7_:* = this.scriptOb;
         for(var _loc3_ in this.scriptOb)
         {
            if(ScriptConfigList.ins.allTimePointList.containsKey(_loc3_))
            {
               _loc2_ = scriptOb[_loc3_];
               if(_loc2_ && _loc2_.length)
               {
                  _loc4_ = _loc2_.length;
                  _loc6_ = 0;
                  while(_loc6_ < _loc4_)
                  {
                     _loc1_ = ScriptUtil.jsonToCmd(_loc2_[_loc6_],null);
                     _loc5_ = _loc5_.concat(_loc1_);
                     _loc6_++;
                  }
                  continue;
               }
               continue;
            }
         }
         countPreload2(_loc5_);
      }
      
      private function countPreload2(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:TaskPool = new TaskPool();
         _loc3_.addHandlers(preload_cpl,preload_err,preload_process);
         var _loc2_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = param1[_loc5_];
            _loc3_.addTaskArr(_loc4_.getResTaskArr());
            _loc5_++;
         }
         _loc3_.stopWhenError = true;
         _loc3_.exec();
      }
      
      private function preload_cpl() : void
      {
         this.onComplete();
      }
      
      private function preload_err(param1:TaskPool) : void
      {
         this.onError(param1.errorMsg);
      }
      
      private function preload_process(param1:TaskPool, param2:int, param3:GetResTask) : void
      {
      }
      
      public function getScript(param1:String) : Array
      {
         var _loc2_:* = null;
         if(this.scriptOb)
         {
            _loc2_ = this.scriptOb[param1];
            if(_loc2_ && _loc2_.length > 0)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
