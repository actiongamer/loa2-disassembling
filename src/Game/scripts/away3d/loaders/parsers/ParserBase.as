package away3d.loaders.parsers
{
   import flash.events.EventDispatcher;
   import away3d.loaders.parsers.utils.ParserUtil;
   import flash.utils.ByteArray;
   import away3d.loaders.misc.ResourceDependency;
   import flash.utils.Timer;
   import flash.display.BitmapData;
   import away3d.tools.utils.TextureUtils;
   import org.specter3d.context.AppGlobalContext;
   import flash.utils.getTimer;
   import away3d.errors.AbstractMethodError;
   import morn.core.managers.timerMgrs.TimerManager;
   import away3d.library.assets.IAsset;
   import away3d.events.AssetEvent;
   import away3d.events.ParserEvent;
   import flash.net.URLRequest;
   import com.mz.core.logging.Log;
   import flash.events.TimerEvent;
   
   public class ParserBase extends EventDispatcher
   {
      
      protected static const PARSING_DONE:Boolean = true;
      
      protected static const MORE_TO_PARSE:Boolean = false;
       
      
      public var isParsering:Boolean = false;
      
      public var parserType:String;
      
      var _fileName:String;
      
      private var _name:String;
      
      protected var _dataFormat:String;
      
      protected var _data;
      
      protected var _frameLimit:Number;
      
      protected var _lastFrameTime:Number;
      
      private var _dependencies:Vector.<ResourceDependency>;
      
      private var _parsingPaused:Boolean;
      
      private var _parsingComplete:Boolean;
      
      private var _parsingFailure:Boolean;
      
      private var _timer:Timer;
      
      public function ParserBase(param1:String)
      {
         super();
         _dataFormat = param1;
         _dependencies = new Vector.<ResourceDependency>();
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      protected function getTextData() : String
      {
         return ParserUtil.toString(_data);
      }
      
      protected function getByteData() : ByteArray
      {
         return ParserUtil.toByteArray(_data);
      }
      
      public function isBitmapDataValid(param1:BitmapData) : Boolean
      {
         var _loc2_:Boolean = TextureUtils.isBitmapDataValid(param1);
         if(_loc2_)
         {
         }
         return _loc2_;
      }
      
      public function set parsingFailure(param1:Boolean) : void
      {
         _parsingFailure = param1;
      }
      
      public function get parsingFailure() : Boolean
      {
         return _parsingFailure;
      }
      
      public function get parsingPaused() : Boolean
      {
         return _parsingPaused;
      }
      
      public function get parsingComplete() : Boolean
      {
         return _parsingComplete;
      }
      
      public function get dataFormat() : String
      {
         return _dataFormat;
      }
      
      public function parseAsync(param1:*, param2:Number = 16) : void
      {
         parseNow(param1);
      }
      
      public function parseNow(param1:*) : void
      {
         _frameLimit = 50;
         _data = param1;
         _lastFrameTime = getTimer();
         if(proceedParsing() && !_parsingFailure)
         {
            finishParsing();
         }
      }
      
      public function get dependencies() : Vector.<ResourceDependency>
      {
         return _dependencies;
      }
      
      function resolveDependency(param1:ResourceDependency) : void
      {
         throw new AbstractMethodError();
      }
      
      function resolveDependencyFailure(param1:ResourceDependency) : void
      {
         throw new AbstractMethodError();
      }
      
      function resumeParsingAfterDependencies() : void
      {
         _parsingPaused = false;
         TimerManager.ins.doFrameLoop(1,this.onFrame);
      }
      
      protected function finalizeAsset(param1:IAsset, param2:String = null) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(param2 != null)
         {
            param1.name = param2;
         }
         var _loc5_:* = param1.assetType;
         if("animationSet" !== _loc5_)
         {
            if("animationState" !== _loc5_)
            {
               if("animationNode" !== _loc5_)
               {
                  if("stateTransition" !== _loc5_)
                  {
                     if("texture" !== _loc5_)
                     {
                        if("container" !== _loc5_)
                        {
                           if("geometry" !== _loc5_)
                           {
                              if("material" !== _loc5_)
                              {
                                 if("mesh" !== _loc5_)
                                 {
                                    if("skeleton" !== _loc5_)
                                    {
                                       if("skeletonPose" !== _loc5_)
                                       {
                                          if("entity" !== _loc5_)
                                          {
                                             if("segmentSet" !== _loc5_)
                                             {
                                                throw new Error("Unhandled asset type " + param1.assetType + ". Report as bug!");
                                             }
                                             _loc3_ = "segmentSet";
                                             _loc4_ = "segmentSetComplete";
                                          }
                                          else
                                          {
                                             _loc3_ = "entity";
                                             _loc4_ = "entityComplete";
                                          }
                                       }
                                       else
                                       {
                                          _loc3_ = "skelpose";
                                          _loc4_ = "skeletonPoseComplete";
                                       }
                                    }
                                    else
                                    {
                                       _loc3_ = "skeleton";
                                       _loc4_ = "skeletonComplete";
                                    }
                                 }
                                 else
                                 {
                                    _loc3_ = "mesh";
                                    _loc4_ = "meshComplete";
                                 }
                              }
                              else
                              {
                                 _loc3_ = "material";
                                 _loc4_ = "materialComplete";
                              }
                           }
                           else
                           {
                              _loc3_ = "geometry";
                              _loc4_ = "geometryComplete";
                           }
                        }
                        else
                        {
                           _loc3_ = "container";
                           _loc4_ = "containerComplete";
                        }
                     }
                     else
                     {
                        _loc3_ = "texture";
                        _loc4_ = "textureComplete";
                     }
                  }
                  else
                  {
                     _loc3_ = "stateTransition";
                     _loc4_ = "stateTransitionComplete";
                  }
               }
               else
               {
                  _loc3_ = "animationNode";
                  _loc4_ = "animationNodeComplete";
               }
            }
            else
            {
               _loc3_ = "animationState";
               _loc4_ = "animationStateComplete";
            }
         }
         else
         {
            _loc3_ = "animationSet";
            _loc4_ = "animationSetComplete";
         }
         if(!param1.name)
         {
            param1.name = _loc3_;
         }
         dispatchEvent(new AssetEvent("assetComplete",param1));
         dispatchEvent(new AssetEvent(_loc4_,param1));
      }
      
      protected function proceedParsing() : Boolean
      {
         throw new AbstractMethodError();
      }
      
      protected function dieWithError(param1:String = "Unknown parsing error") : void
      {
         TimerManager.ins.clearTimer(this.onFrame);
         if(_timer)
         {
            _timer.removeEventListener("timer",onInterval);
            _timer.stop();
            _timer = null;
         }
         dispatchEvent(new ParserEvent("parseError",param1));
      }
      
      protected function addDependency(param1:String, param2:URLRequest, param3:Boolean = false, param4:* = null, param5:Boolean = false) : void
      {
         _dependencies.push(new ResourceDependency(param1,param2,param4,this,param3,param5));
      }
      
      protected function pauseAndRetrieveDependencies() : void
      {
         TimerManager.ins.clearTimer(this.onFrame);
         if(_timer)
         {
            _timer.stop();
         }
         _parsingPaused = true;
         dispatchEvent(new ParserEvent("readyForDependencies"));
      }
      
      protected final function hasTime() : Boolean
      {
         return true;
      }
      
      protected function onFrame() : void
      {
         _lastFrameTime = getTimer();
         if(proceedParsing() && !_parsingFailure)
         {
            finishParsing();
         }
      }
      
      protected function onInterval(param1:TimerEvent = null) : void
      {
         try
         {
            _lastFrameTime = getTimer();
            if(proceedParsing() && !_parsingFailure)
            {
               finishParsing();
            }
            return;
         }
         catch(e:Error)
         {
            finishParsing(true);
            return;
         }
      }
      
      private function startParsing(param1:Number) : void
      {
         _frameLimit = param1;
         TimerManager.ins.doFrameLoop(1,this.onFrame);
      }
      
      protected function finishParsing(param1:Boolean = false) : void
      {
         TimerManager.ins.clearTimer(this.onFrame);
         if(_timer)
         {
            _timer.removeEventListener("timer",onInterval);
            _timer.stop();
            _timer = null;
         }
         _parsingComplete = true;
         if(param1)
         {
            dispatchEvent(new ParserEvent("parseError"));
         }
         else if(hasEventListener("parseComplete"))
         {
            dispatchEvent(new ParserEvent("parseComplete"));
         }
      }
   }
}
