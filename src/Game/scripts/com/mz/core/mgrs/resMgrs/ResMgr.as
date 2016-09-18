package com.mz.core.mgrs.resMgrs
{
   import com.mz.core.mgrs.res3ds.BitmapDataFor3D;
   import flash.display.BitmapData;
   import morn.core.utils.NumberUtil;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import com.mz.core.utils.DictHash;
   import morn.core.managers.MassLoaderManager;
   import morn.core.handlers.Handler;
   import morn.core.managers.AssetManager;
   import com.mz.core.logging.Log;
   import com.mz.core.components.comp2d.bitmapClips.BmcData;
   import flash.utils.ByteArray;
   import morn.core.utils.BaUtil;
   import morn.core.components.View;
   import flash.system.LoaderContext;
   import com.mz.core.net.LoadByteTask;
   import flash.display.MovieClip;
   import flash.net.registerClassAlias;
   import flash.utils.Dictionary;
   import com.spriteSheet.SpriteSheetData;
   import com.spriteSheet.SpriteFrame;
   import com.mz.core.utils2.task.TaskPool;
   import flash.system.ApplicationDomain;
   import com.mz.core.configs.ClientConfig;
   import flash.display.Bitmap;
   import com.mz.core.utils2.reflects.GetSWFClassName;
   import flash.display.LoaderInfo;
   
   public class ResMgr
   {
      
      private static var _ins:com.mz.core.mgrs.resMgrs.ResMgr;
       
      
      protected var loadingDict:Object;
      
      protected var cacheDict:DictHash;
      
      private var count:int;
      
      public function ResMgr()
      {
         loadingDict = {};
         cacheDict = new DictHash();
         super();
      }
      
      public static function get ins() : com.mz.core.mgrs.resMgrs.ResMgr
      {
         if(_ins == null)
         {
            _ins = new com.mz.core.mgrs.resMgrs.ResMgr();
         }
         return _ins;
      }
      
      public static function transBmd2Dto3D(param1:BitmapData) : BitmapDataFor3D
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:* = null;
         _loc3_ = NumberUtil.ceilPow2up(param1.width);
         _loc2_ = NumberUtil.ceilPow2up(param1.height);
         var _loc5_:BitmapDataFor3D = new BitmapDataFor3D(_loc3_,_loc2_,true,0);
         _loc5_.oriW = param1.width;
         _loc5_.oriH = param1.height;
         if(_loc3_ != param1.width || _loc2_ != param1.height)
         {
            _loc4_ = new Matrix();
            _loc4_.scale(_loc3_ / param1.width,_loc2_ / param1.height);
            _loc5_.draw(param1,_loc4_,null,null,null,true);
            return _loc5_;
         }
         _loc5_.copyPixels(param1,new Rectangle(0,0,param1.width,param1.height),new Point(0,0));
         return _loc5_;
      }
      
      public function get mloader() : MassLoaderManager
      {
         return App.mloader;
      }
      
      public function load(param1:int, param2:String, param3:*, param4:uint = 3, param5:Boolean = false) : void
      {
         var _loc6_:* = param4;
         var _loc7_:ResLoadingVo = checkHad(param1,param2,param3,param5);
         if(_loc7_)
         {
            _loc7_.type = param1;
            var _loc8_:* = param1;
            if(15 !== _loc8_)
            {
               if(14 !== _loc8_)
               {
                  if(16 !== _loc8_)
                  {
                     if(17 !== _loc8_)
                     {
                        if(32 !== _loc8_)
                        {
                           if(33 !== _loc8_)
                           {
                              if(34 !== _loc8_)
                              {
                                 if(19 !== _loc8_)
                                 {
                                    if(3 !== _loc8_)
                                    {
                                       if(1 !== _loc8_)
                                       {
                                          if(10 !== _loc8_)
                                          {
                                             if(8 !== _loc8_)
                                             {
                                                if(82 !== _loc8_)
                                                {
                                                   if(13 !== _loc8_)
                                                   {
                                                      if(25 === _loc8_)
                                                      {
                                                         mloader.loadDB(param2,_loc6_,new Handler(load_complete,[param2]),new Handler(load_progress,[param2]),new Handler(load_error),false);
                                                      }
                                                   }
                                                }
                                                addr152:
                                                mloader.loadTXT(param2,_loc6_,new Handler(load_complete,[param2]),new Handler(load_progress,[param2]),new Handler(load_error),false);
                                             }
                                             addr151:
                                             §§goto(addr152);
                                          }
                                          else
                                          {
                                             mloader.loadBYTE(param2,_loc6_,new Handler(load_complete,[param2]),new Handler(load_progress,[param2]),new Handler(load_error),false);
                                          }
                                          §§goto(addr151);
                                       }
                                       else if(!(param2.indexOf("jpg.uiPreview") == 0 || param2.indexOf("png.uiPreview") == 0))
                                       {
                                          mloader.loadBMD(param2,_loc6_,new Handler(load_complete,[param2]),new Handler(load_progress,[param2]),new Handler(load_error),false);
                                       }
                                    }
                                    else
                                    {
                                       mloader.loadSWF(param2,_loc6_,new Handler(load_complete,[param2]),new Handler(load_progress,[param2]),new Handler(load_error),false);
                                    }
                                 }
                              }
                              mloader.loadBYTE(param2,_loc6_,new Handler(load_complete,[param2]),new Handler(load_progress,[param2]),new Handler(load_error),false);
                           }
                        }
                        addr25:
                        if(cacheDict.containsKey(param2))
                        {
                           parseUIBaArr(param2,getRes(param2));
                        }
                        else
                        {
                           mloader.loadBYTE(param2,_loc6_,new Handler(load_complete,[param2]),new Handler(load_progress,[param2]),new Handler(load_error),false);
                        }
                     }
                     addr24:
                     §§goto(addr25);
                  }
                  addr23:
                  §§goto(addr24);
               }
               addr22:
               §§goto(addr23);
            }
            §§goto(addr22);
         }
      }
      
      private function checkHad(param1:int, param2:String, param3:*, param4:Boolean = false) : ResLoadingVo
      {
         var _loc5_:* = null;
         if(cacheDict.containsKey(param2))
         {
            if(param1 == 33 || param1 == 33)
            {
               _loc5_ = new ResLoadingVo();
               _loc5_.isSustained = param4;
               _loc5_.url = param2;
               _loc5_.handlerBatch.addHandler(73,param3);
               loadingDict[param2] = _loc5_;
               return _loc5_;
            }
            Handler.execute(param3,[param2,getRes(param2)]);
            return null;
         }
         if(loadingDict.hasOwnProperty(param2))
         {
            (loadingDict[param2] as ResLoadingVo).handlerBatch.addHandler(73,param3);
            return null;
         }
         if(AssetManager.isClassAsset(param2))
         {
            Log.warn(this,"miss assets",param2);
            Handler.execute(param3,[param2,null]);
            return null;
         }
         _loc5_ = new ResLoadingVo();
         _loc5_.isSustained = param4;
         _loc5_.url = param2;
         _loc5_.handlerBatch.addHandler(73,param3);
         loadingDict[param2] = _loc5_;
         return _loc5_;
      }
      
      public function getBmc(param1:String) : BmcData
      {
         var _loc2_:* = com.mz.core.mgrs.resMgrs.ResMgr.ins.getRes(param1);
         if(_loc2_)
         {
            if(_loc2_ is Class)
            {
               _loc2_ = new BmcData(new (_loc2_ as Class)());
               setRes(param1,_loc2_);
            }
            return _loc2_;
         }
         return null;
      }
      
      public function getRes(param1:String) : *
      {
         var _loc2_:* = null;
         if(cacheDict.containsKey(param1))
         {
            _loc2_ = cacheDict.getValue(param1) as ResCacheVo;
            if(_loc2_)
            {
               return _loc2_.data;
            }
            return null;
         }
         return null;
      }
      
      public function gc() : void
      {
      }
      
      private function load_complete(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         if(loadingDict.hasOwnProperty(param1))
         {
            _loc3_ = loadingDict[param1] as ResLoadingVo;
            _loc4_ = param2;
            var _loc12_:* = _loc3_.type;
            if(15 !== _loc12_)
            {
               if(14 !== _loc12_)
               {
                  if(16 !== _loc12_)
                  {
                     if(17 !== _loc12_)
                     {
                        if(3 !== _loc12_)
                        {
                           if(1 !== _loc12_)
                           {
                              if(32 !== _loc12_)
                              {
                                 if(33 !== _loc12_)
                                 {
                                    if(19 !== _loc12_)
                                    {
                                       if(10 !== _loc12_)
                                       {
                                          if(8 !== _loc12_)
                                          {
                                             if(82 !== _loc12_)
                                             {
                                                if(13 !== _loc12_)
                                                {
                                                   if(25 !== _loc12_)
                                                   {
                                                      if(34 === _loc12_)
                                                      {
                                                         parseSSD(param1,_loc4_);
                                                         return;
                                                      }
                                                   }
                                                   else
                                                   {
                                                      if(!View.xmlMap)
                                                      {
                                                         View.xmlMap = {};
                                                      }
                                                      _loc12_ = 0;
                                                      var _loc11_:* = _loc4_;
                                                      for(var _loc6_ in _loc4_)
                                                      {
                                                         View.xmlMap[_loc6_] = _loc4_[_loc6_];
                                                      }
                                                   }
                                                }
                                                else
                                                {
                                                   _loc5_ = String(_loc4_);
                                                   _loc5_ = _loc5_.replace(/\n\r/g,"");
                                                   _loc5_ = _loc5_.replace(/\t/g,"");
                                                   try
                                                   {
                                                      _loc4_ = JSON.parse(_loc5_);
                                                   }
                                                   catch(err:Error)
                                                   {
                                                      Log.error(this,"JSON解析错误:",param1);
                                                   }
                                                }
                                             }
                                             else
                                             {
                                                try
                                                {
                                                   _loc4_ = XML(_loc4_);
                                                }
                                                catch(err:Error)
                                                {
                                                   Log.error(this,"XML解析错误:",param1,err);
                                                }
                                             }
                                          }
                                       }
                                    }
                                    else
                                    {
                                       this.setCache(param1,BaUtil.unzipArr(_loc4_));
                                       return;
                                    }
                                 }
                                 else
                                 {
                                    parseUIBa(param1,_loc4_,true);
                                    return;
                                 }
                              }
                              else
                              {
                                 parseUIBa(param1,_loc4_,false);
                                 return;
                              }
                           }
                        }
                        setCache(param1,_loc4_);
                     }
                  }
                  loadSwfByteNoDomain(_loc4_ as ByteArray,_loc3_);
                  return;
               }
            }
            loadSwfByte(_loc4_ as ByteArray,_loc3_);
            return;
         }
      }
      
      private function loadSwfByte(param1:ByteArray, param2:ResLoadingVo) : void
      {
         var _loc3_:LoaderContext = new LoaderContext();
         _loc3_.allowCodeImport = true;
         new LoadByteTask(param1,_loc3_,param2.url).addCompleteHandler(new Handler(loadSwfByte_onCpl,[param2])).exec();
      }
      
      private function loadSwfByte_onCpl(param1:ResLoadingVo, param2:LoadByteTask) : void
      {
         var _loc3_:* = null;
         var _loc4_:String = param2.url;
         switch(int(param1.type) - 14)
         {
            case 0:
               setCache(_loc4_,param2.loader.content as MovieClip);
               break;
            case 1:
               _loc3_ = new BmcData(param2.loader.content as MovieClip);
               setCache(_loc4_,_loc3_);
         }
         param2.stop();
      }
      
      private function parseSSD(param1:String, param2:ByteArray) : void
      {
         registerClassAlias("flash.utils.ByteArray",ByteArray);
         registerClassAlias("flash.utils.Dictionary",Dictionary);
         registerClassAlias("com.spriteSheet.SpriteSheetData",SpriteSheetData);
         registerClassAlias("com.spriteSheet.SpriteFrame",SpriteFrame);
         var _loc3_:SpriteSheetData = param2.readObject() as SpriteSheetData;
         setCache(param1,_loc3_);
      }
      
      private function parseUIBa(param1:String, param2:ByteArray, param3:Boolean) : void
      {
         var _loc4_:* = undefined;
         if(param2.length > 0)
         {
            _loc4_ = BaUtil.unzipArr(param2,param3);
            parseUIBaArr(param1,_loc4_);
         }
         else
         {
            this.setCache(param1,new Vector.<ZipBaVo>());
         }
      }
      
      private function parseUIBaArr(param1:String, param2:Vector.<ZipBaVo>) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         if(param2)
         {
            _loc4_ = new TaskPool();
            _loc5_ = param2.length;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc3_ = param2[_loc6_];
               if(_loc3_.name)
               {
                  if(!this.cacheDict.containsKey(_loc3_.name))
                  {
                     _loc4_.addTask(new LoadByteTask(_loc3_.ba,new LoaderContext(false,ApplicationDomain.currentDomain)).addCompleteHandler(new Handler(loadUIBaPicCpl,[param1,_loc3_])));
                  }
               }
               _loc6_++;
            }
            _loc4_.addCompleteHandler(new Handler(parseUIBaListCpl,[param1,param2]));
            _loc4_.stopWhenError = false;
            _loc4_.exec();
         }
         else
         {
            this.setCache(param1,new Vector.<ZipBaVo>());
         }
      }
      
      private function loadUIBaPicCpl(param1:String, param2:ZipBaVo, param3:LoadByteTask) : void
      {
         var _loc4_:ResLoadingVo = loadingDict[param1] as ResLoadingVo;
         if(ClientConfig.firstBattle == 1)
         {
            if(param2.name.indexOf(".uiFirstBattle.") > -1)
            {
               param2.name = param2.name.replace(".uiFirstBattle.",".a5.");
            }
         }
         this.setRes(param2.name,(param3.loader.content as Bitmap).bitmapData);
         if(_loc4_.isSustained == false)
         {
            this.tranToCited(param2.name);
         }
         param3.stop();
      }
      
      private function parseUIBaListCpl(param1:*, param2:Vector.<ZipBaVo>) : void
      {
         this.setCache(param1,param2);
      }
      
      private function loadSwfByteNoDomain(param1:ByteArray, param2:ResLoadingVo) : void
      {
         var _loc3_:LoaderContext = new LoaderContext();
         _loc3_.allowCodeImport = true;
         new LoadByteTask(param1,_loc3_,param2.url).addCompleteHandler(new Handler(loadSwfByteNoDomain_onCpl,[param2,param1])).exec();
      }
      
      private function loadSwfByteNoDomain_onCpl(param1:ResLoadingVo, param2:ByteArray, param3:LoadByteTask) : void
      {
         var _loc7_:String = param3.url;
         var _loc5_:Vector.<String> = GetSWFClassName.parse(param2,_loc7_);
         var _loc4_:LoaderInfo = param3.loader.content.loaderInfo;
         var _loc6_:ApplicationDomain = _loc4_.applicationDomain as ApplicationDomain;
         if(_loc5_.length > 0)
         {
            setCache(_loc7_,Class(_loc6_.getDefinition(_loc5_[0])));
         }
         param3.stop();
      }
      
      public function tranToCited(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:ResCacheVo = cacheDict.getValue(param1) as ResCacheVo;
         if(_loc3_)
         {
            _loc2_ = _loc3_.data as BitmapData;
            try
            {
               _loc2_.width;
               if(!(_loc2_ is CiteBitmapData))
               {
                  _loc2_ = new CiteBitmapData(_loc2_,param1);
                  _loc3_.data = _loc2_;
               }
               return;
            }
            catch($err:Error)
            {
               Log.error(this,param1,"is disposed");
               this.delRes(param1);
               return;
            }
         }
      }
      
      public function getResFor3D(param1:String) : BitmapDataFor3D
      {
         var _loc3_:* = null;
         var _loc2_:BitmapDataFor3D = com.mz.core.mgrs.resMgrs.ResMgr.ins.getRes(param1 + "_3d");
         if(_loc2_ == null)
         {
            _loc3_ = com.mz.core.mgrs.resMgrs.ResMgr.ins.getRes(param1);
            _loc2_ = transBmd2Dto3D(_loc3_);
            com.mz.core.mgrs.resMgrs.ResMgr.ins.setRes(param1 + "_3d",_loc2_);
         }
         return _loc2_;
      }
      
      public function setRes(param1:String, param2:*, param3:ResLoadingVo = null) : void
      {
         var _loc4_:ResCacheVo = new ResCacheVo();
         _loc4_.url = param1;
         _loc4_.data = param2;
         if(param3)
         {
            _loc4_.type = param3.type;
            _loc4_.isSustained = param3.isSustained;
         }
         cacheDict.put(param1,_loc4_);
      }
      
      public function delRes(param1:String) : void
      {
         cacheDict.remove(param1);
         mloader.stopAndClearLoad(param1);
      }
      
      private function setCache(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         if(loadingDict.hasOwnProperty(param1))
         {
            _loc3_ = loadingDict[param1] as ResLoadingVo;
            setRes(param1,param2,_loc3_);
            delete loadingDict[param1];
            _loc3_.handlerBatch.execute(73,[param1,param2]);
         }
      }
      
      private function load_progress(param1:String, param2:Number) : void
      {
         var _loc3_:ResLoadingVo = loadingDict[param1] as ResLoadingVo;
      }
      
      private function load_error(param1:String) : void
      {
         var _loc2_:ResLoadingVo = loadingDict[param1] as ResLoadingVo;
         cacheDict.put(param1,null);
         delete loadingDict[param1];
         _loc2_.handlerBatch.execute(73,[param1,null]);
      }
      
      public function clear() : void
      {
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = cacheDict.dict;
         for(var _loc2_ in cacheDict.dict)
         {
            _loc3_ = cacheDict.getValue(_loc2_) as ResCacheVo;
            if(_loc3_)
            {
               _loc1_ = _loc3_.data as CiteBitmapData;
               if(_loc1_)
               {
                  if(_loc1_.countCited() <= 0)
                  {
                     cacheDict.remove(_loc2_);
                     _loc1_.dispose();
                  }
               }
               else if(_loc3_.type == 33)
               {
                  if(_loc3_.isSustained == false)
                  {
                     cacheDict.remove(_loc2_);
                  }
               }
            }
         }
         Log.debug(this,"clear leave:",cacheDict.size);
      }
   }
}
