package com.mz.core.mgrs.res3ds
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.mgrs.resMgrs.ZipBaVo;
   import flash.utils.ByteArray;
   import morn.core.utils.PathUtil;
   import org.specter3d.loaders.parsers.ECTParser;
   import away3d.loaders.parsers.ParserBase;
   import org.specter3d.loaders.parsers.PLEParser;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import away3d.events.AssetEvent;
   import org.specter3d.loaders.AssetLib;
   
   public class AddUrlBaTo3DLoaderTask extends TaskBase
   {
       
      
      public var zipBaVo:ZipBaVo;
      
      public var url:String;
      
      public var ba:ByteArray;
      
      public function AddUrlBaTo3DLoaderTask(param1:String, param2:ByteArray)
      {
         super();
         this.url = param1;
         this.ba = param2;
      }
      
      override public function exec() : void
      {
         var _loc1_:* = null;
         super.exec();
         this.ba.position = 0;
         var _loc2_:* = PathUtil.parseSuffix(url);
         if("ect" !== _loc2_)
         {
            if("ple" === _loc2_)
            {
               _loc1_ = new PLEParser();
            }
         }
         else
         {
            _loc1_ = new ECTParser();
         }
         if(_loc1_)
         {
            _loc1_.name = url;
            _loc1_.addEventListener("assetComplete",onAssetComplete,false,1000);
            _loc1_.parseNow(ba);
         }
         else
         {
            AppGlobalContext.asynLoader.loadOne(new ResourceVo(url,0,onLoadAnimOver).setRawBa(ba));
         }
      }
      
      private function onAssetComplete(param1:AssetEvent) : void
      {
         AssetLib.putAsset(AssetLib.operationUrlByVersion(url),param1.asset,"default_group");
         this.onLoadAnimOver(url);
      }
      
      private function onLoadAnimOver(param1:String) : void
      {
         this.onComplete();
      }
   }
}
