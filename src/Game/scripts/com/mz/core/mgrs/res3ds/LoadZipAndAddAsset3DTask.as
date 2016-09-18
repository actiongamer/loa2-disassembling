package com.mz.core.mgrs.res3ds
{
   import com.mz.core.utils2.task.TaskBase;
   import org.specter3d.loaders.AssetLib;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import com.mz.core.mgrs.resMgrs.ZipBaVo;
   import com.mz.core.utils2.task.TaskPool;
   import morn.core.utils.PathUtil;
   
   public class LoadZipAndAddAsset3DTask extends TaskBase
   {
       
      
      public var pathFolder:String;
      
      public var baUrl:String;
      
      public function LoadZipAndAddAsset3DTask(param1:String, param2:String)
      {
         pathFolder = param1;
         baUrl = param2;
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:* = AssetLib.getData(baUrl);
         if(_loc1_ is Array)
         {
            this.onComplete();
         }
         else
         {
            AppGlobalContext.QueueLoader.loadOne(new ResourceVo(baUrl,1,loadBaCpl));
         }
      }
      
      private function loadBaCpl(param1:String) : void
      {
         var _loc7_:* = null;
         var _loc3_:* = undefined;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:* = null;
         var _loc6_:* = null;
         if(isStop)
         {
            return;
         }
         if(AssetLib.hasAsset(baUrl) == false)
         {
            this.onComplete();
            return;
         }
         var _loc8_:* = AssetLib.getData(baUrl);
         if(_loc8_ is Array)
         {
            this.onComplete();
         }
         else
         {
            _loc3_ = _loc8_;
            if(_loc3_ == null)
            {
               this.onComplete();
               return;
            }
            _loc4_ = new TaskPool();
            _loc4_.stopWhenError = false;
            _loc5_ = _loc3_.length;
            _loc9_ = 0;
            while(_loc9_ < _loc5_)
            {
               _loc2_ = _loc3_[_loc9_];
               _loc6_ = pathFolder + _loc3_[_loc9_].name;
               _loc4_.addTask(new AddUrlBaTo3DLoaderTask(_loc6_,_loc2_.ba));
               _loc9_++;
            }
            _loc4_.addCompleteHandler(taskPoolCpl);
            _loc4_.exec();
         }
      }
      
      private function taskPoolCpl() : void
      {
         var _loc4_:* = null;
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:* = null;
         if(isStop)
         {
            return;
         }
         if(AssetLib.hasAsset(baUrl) == false)
         {
            this.onComplete();
            return;
         }
         var _loc5_:* = AssetLib.getData(baUrl);
         if(_loc5_ is Array)
         {
            _loc4_ = _loc5_ as Array;
            this.onComplete();
         }
         else
         {
            _loc4_ = [];
            _loc2_ = _loc5_;
            _loc3_ = _loc2_.length;
            _loc6_ = 0;
            while(_loc6_ < _loc3_)
            {
               _loc1_ = _loc2_[_loc6_];
               _loc4_.push(PathUtil.parseName(_loc1_.name));
               _loc6_++;
            }
            AssetLib.putAsset(AssetLib.operationUrlByVersion(baUrl),_loc4_);
            this.onComplete();
         }
      }
   }
}
