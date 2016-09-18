package org.specter3d.context
{
   import flash.events.EventDispatcher;
   import org.specter3d.loaders.ILoader;
   import org.specter3d.net.NetGet;
   import flash.display.Stage;
   import flash.display.DisplayObjectContainer;
   import org.specter3d.display.Specter3DStage;
   import away3d.core.managers.AnimatorManager;
   import com.mz.core.utils.LocalData;
   import flash.system.Capabilities;
   import org.specter3d.events.Specter3DContextEvent;
   import flash.events.Event;
   import com.mz.core.configs.EnvConfig;
   import org.specter3d.interfaces.ISpecterLayout;
   import flash.display.DisplayObject;
   import away3d.filters.Filter3DBase;
   import org.specter3d.loaders.MassLoaderManagerProxy;
   
   public final class AppGlobalContext extends EventDispatcher
   {
      
      public static const LOCAL_DATA_PlayQuality:String = "AppGlobalContext.LOCAL_DATA_PlayQuality";
      
      public static const PlayQuality_HIGH:int = 3;
      
      public static const PlayQuality_MIDDLE:int = 2;
      
      public static const PlayQuality_LOW:int = 1;
      
      public static var PlayQuality:int = 3;
      
      public static var autoTransition:Boolean = true;
      
      public static var numJoint:int = 32;
      
      public static var hasParseFrameLimited:Boolean = true;
      
      public static const SIZE_CHANGED:String = "size_changed";
      
      public static var FLASH_VERSION:int = int(Capabilities.version.split(" ")[1].split(",")[0]);
      
      public static var QueueLoader:ILoader = new MassLoaderManagerProxy();
      
      public static var asynLoader:ILoader = new MassLoaderManagerProxy();
      
      private static var _netGet:NetGet;
      
      public static var stageMaxHeight:int = 590;
      
      public static var stageMaxWidth:int = 1024;
      
      public static var stageMinHeight:int = 570;
      
      public static var stageMinWidth:int = 1000;
      
      private static var _absoluteX:int = 512;
      
      private static var _absoluteY:int = 295;
      
      public static var sceneWidth:int;
      
      public static var sceneHeight:int;
      
      public static var sceneOriginalHeight:int;
      
      public static var mainStage:Stage;
      
      private static var _engineInitCompleteCallback:Function = null;
      
      private static var _rootApp:DisplayObjectContainer;
      
      private static var _stage2d:Stage;
      
      private static var _stage3d:Specter3DStage;
      
      private static var _cameraPlaying:Boolean = false;
      
      private static var _gameAngle:Boolean = true;
      
      public static var animatorManager:AnimatorManager;
      
      public static var avgFPS:int = 0;
       
      
      public function AppGlobalContext()
      {
         super();
      }
      
      public static function get netGet() : NetGet
      {
         if(!_netGet)
         {
            _netGet = new NetGet();
         }
         return _netGet;
      }
      
      public static function get gameAngle() : Boolean
      {
         return _gameAngle;
      }
      
      public static function set gameAngle(param1:Boolean) : void
      {
         _gameAngle = param1;
      }
      
      public static function get cameraPlaying() : Boolean
      {
         return _cameraPlaying;
      }
      
      public static function set cameraPlaying(param1:Boolean) : void
      {
         _cameraPlaying = param1;
      }
      
      public static function get AbsX() : int
      {
         return Math.round(_absoluteX);
      }
      
      public static function get AbsY() : int
      {
         return Math.round(_absoluteY);
      }
      
      public static function autoSize(param1:Boolean) : void
      {
         if(param1)
         {
            stage2d.addEventListener("resize",updateLayout);
         }
         else
         {
            stage2d.hasEventListener("resize") && stage2d.removeEventListener("resize",updateLayout);
         }
         updateLayout(null);
      }
      
      public static function initEngine(param1:Stage, param2:DisplayObjectContainer, param3:Function, param4:int = 30, param5:Boolean = true, param6:String = "noScale", param7:String = "TL") : void
      {
         PlayQuality = LocalData.insCurPlayer.load("AppGlobalContext.LOCAL_DATA_PlayQuality",3);
         _stage2d = param1;
         _stage2d.frameRate = param4;
         _stage2d.scaleMode = param6;
         _stage2d.align = param7;
         if(Capabilities.screenDPI > 200)
         {
            _stage2d.quality = "8x8linear";
         }
         else
         {
            _stage2d.quality = "high";
         }
         _stage2d.showDefaultContextMenu = false;
         autoSize(param5);
         if(param3 != null)
         {
            _rootApp = param2;
            _engineInitCompleteCallback = param3;
            AppGlobalContext.stage2d.addEventListener("EngineInitComplete",engineInitComplete);
            AppGlobalContext.stage2d.dispatchEvent(new Specter3DContextEvent("EngineInitComplete"));
         }
      }
      
      private static function stageRightClick(param1:Event) : void
      {
      }
      
      public static function initStage3d(param1:Specter3DStage) : void
      {
         AppGlobalContext._stage3d = param1;
      }
      
      public static function get rootApp() : DisplayObjectContainer
      {
         return _rootApp;
      }
      
      public static function get stage2d() : Stage
      {
         return _stage2d;
      }
      
      public static function get stage3d() : Specter3DStage
      {
         return _stage3d;
      }
      
      private static function engineInitComplete(param1:Specter3DContextEvent) : void
      {
         AppGlobalContext.stage2d.removeEventListener("EngineInitComplete",engineInitComplete);
         animatorManager = new AnimatorManager(true);
      }
      
      private static function updateLayout(param1:Event) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = undefined;
         AppGlobalContext.stageMaxWidth = _stage2d.stageWidth < AppGlobalContext.stageMinWidth?AppGlobalContext.stageMinWidth:int(_stage2d.stageWidth);
         AppGlobalContext.stageMaxHeight = _stage2d.stageHeight - EnvConfig.ins.shellY < AppGlobalContext.stageMinHeight?AppGlobalContext.stageMinHeight:_stage2d.stageHeight - EnvConfig.ins.shellY;
         AppGlobalContext._absoluteX = stageMaxWidth / 2;
         AppGlobalContext._absoluteY = stageMaxHeight / 2;
         if(!(AppGlobalContext.rootApp is ISpecterLayout))
         {
            return;
         }
         _loc3_ = uint(0);
         while(_loc3_ < AppGlobalContext.rootApp.numChildren)
         {
            _loc2_ = AppGlobalContext.rootApp.getChildAt(_loc3_);
            if(_loc2_ is ISpecterLayout)
            {
               (_loc2_ as ISpecterLayout).updateLayout();
            }
            _loc3_++;
         }
         (AppGlobalContext.rootApp as ISpecterLayout).updateLayout();
         if(AppGlobalContext.stage2d.hasEventListener("size_changed"))
         {
            AppGlobalContext.stage2d.dispatchEvent(new Event("size_changed"));
         }
      }
      
      public static function sortNameLayer() : void
      {
         deepSortFuc = function(param1:DisplayObjectContainer, param2:DisplayObjectContainer):Number
         {
            if(param1.y > param2.y)
            {
               return 1;
            }
            if(param1.y < param2.y)
            {
               return -1;
            }
            return 0;
         };
      }
      
      public static function addFillter(param1:Filter3DBase) : void
      {
         var _loc2_:Array = AppGlobalContext.stage3d.view3d.filters3d;
         if(_loc2_ && _loc2_.indexOf(param1) != -1)
         {
            return;
         }
         if(_loc2_ == null)
         {
            _loc2_ = [];
         }
         _loc2_.push(param1);
         AppGlobalContext.stage3d.view3d.filters3d = _loc2_;
      }
      
      public static function removeFillter(param1:Filter3DBase) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = AppGlobalContext.stage3d.view3d.filters3d;
         if(_loc3_ && _loc3_.indexOf(param1) != -1)
         {
            _loc2_ = _loc3_.indexOf(param1);
            if(_loc2_ != -1)
            {
               _loc3_.slice(_loc2_,1);
            }
         }
      }
      
      public static function removeAllFillters() : void
      {
         AppGlobalContext.stage3d.view3d.filters3d = null;
      }
   }
}
