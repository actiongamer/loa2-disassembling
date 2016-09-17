package com.mz.core.mgrs
{
   import flash.display.Stage;
   import flash.display.Sprite;
   import morn.core.components.Component;
   import com.mz.core.components.comp2d.BlackRim;
   import away3d.containers.ObjectContainer3D;
   import flash.events.Event;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.configs.ClientConfig;
   import org.specter3d.context.AppGlobalContext;
   import flash.geom.Point;
   
   public class UIMgr
   {
      
      public static const MSG_GAME_RESIZE:String = "msg_game_resize";
      
      private static var _ins:com.mz.core.mgrs.UIMgr;
      
      public static var stage:Stage;
      
      public static var root:Sprite;
      
      public static var layer2D:Component;
      
      public static var rootRim:BlackRim;
      
      public static var spriteFor3D:Sprite;
      
      public static var root3D:ObjectContainer3D;
      
      private static var _gameWidth:int = 0;
      
      private static var _gameHeight:int = 0;
       
      
      public var dragLayer:Sprite;
      
      private var _useFullScreen:Boolean = false;
      
      private var stageW:int;
      
      private var stageH:int;
      
      public function UIMgr()
      {
         super();
         if(_ins)
         {
            throw new Error("单例，实例已经存在！");
         }
         _ins = this;
      }
      
      public static function get gameWidth() : int
      {
         return _gameWidth;
      }
      
      public static function get gameHeight() : int
      {
         return _gameHeight;
      }
      
      public static function get ins() : com.mz.core.mgrs.UIMgr
      {
         if(!_ins)
         {
            _ins = new com.mz.core.mgrs.UIMgr();
         }
         return _ins;
      }
      
      public function getDragLayer() : Sprite
      {
         return dragLayer;
      }
      
      public function get useFullScreen() : Boolean
      {
         return _useFullScreen;
      }
      
      public function set useFullScreen(param1:Boolean) : void
      {
         if(_useFullScreen != param1)
         {
            _useFullScreen = param1;
            this.resize(null);
         }
      }
      
      public function resize(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:int = stage.stageWidth;
         if(_loc5_ > 0)
         {
            stageW = _loc5_;
         }
         var _loc4_:int = stage.stageHeight - EnvConfig.ins.shellY;
         if(_loc4_ > 0)
         {
            stageH = _loc4_;
         }
         _gameWidth = MathUtil.maxMin(stageW,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_MIN_W);
         _gameHeight = MathUtil.maxMin(stageH,ClientConfig.SCENE_FIXED_H,ClientConfig.SCENE_MIN_H);
         root.x = (stageW - gameWidth) / 2 >> 0;
         root.y = (stageH - gameHeight) / 2 >> 0;
         rootRim.width = stageW;
         rootRim.height = stageH;
         rootRim.hole.x = root.x;
         rootRim.hole.y = root.y;
         rootRim.hole.width = gameWidth;
         rootRim.hole.height = gameHeight;
         rootRim.draw();
         layer2D.width = gameWidth;
         layer2D.height = gameHeight;
         if(root3D)
         {
            _loc2_ = (com.mz.core.mgrs.UIMgr.gameWidth - ClientConfig.SCENE_FIXED_W) / 2;
            _loc3_ = (com.mz.core.mgrs.UIMgr.gameHeight - ClientConfig.SCENE_FIXED_H) / 2;
            AppGlobalContext.stage3d.view3d.x = _loc2_;
            AppGlobalContext.stage3d.view3d.y = _loc3_;
            AppGlobalContext.stage3d.view3d2.x = _loc2_;
            AppGlobalContext.stage3d.view3d2.y = _loc3_;
            AppGlobalContext.stage3d.view3d.stage3DProxy.x = _loc2_ + root.x;
            AppGlobalContext.stage3d.view3d.stage3DProxy.y = _loc3_ + root.y + EnvConfig.ins.shellY;
         }
         ObserverMgr.ins.sendNotice("msg_game_resize");
      }
      
      public function get stageMouseXY() : Point
      {
         return new Point(stage.mouseX,stage.mouseY);
      }
      
      public function focusReset() : void
      {
         stage.focus = stage;
      }
   }
}
