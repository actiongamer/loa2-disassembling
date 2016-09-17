package nslm2.modules.battles.battle
{
   import away3d.cameras.Camera3D;
   import flash.utils.Dictionary;
   import flash.geom.Matrix3D;
   import away3d.filters.Filter3DBase;
   import away3d.cameras.lenses.PerspectiveLens;
   import org.specter3d.context.AppGlobalContext;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import away3d.filters.MotionBlurFilter3D;
   import nslm2.common.scene.multiLayer.DungeonMultilayerBg;
   import away3d.controllers.FollowController;
   
   public class SlowMotiontHandler
   {
      
      private static var _ins:nslm2.modules.battles.battle.SlowMotiontHandler;
       
      
      public function SlowMotiontHandler()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.battle.SlowMotiontHandler
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.battle.SlowMotiontHandler();
         }
         return _ins;
      }
      
      private static function play(param1:Camera3D, param2:BattleStartVo, param3:Player, param4:Dictionary, param5:Function = null) : void
      {
         camer3D = param1;
         vo = param2;
         target = param3;
         gameObjectList = param4;
         callbackComplete = param5;
         onTweenUpdate = function():void
         {
            setAllSpeed(FPUtil.playSpeed(),gameObjectList);
         };
         onTweenComplete = function():void
         {
            callbackComplete && callbackComplete();
            if(camer3D.lens is PerspectiveLens)
            {
               camer3D.transform = oriTransForm;
            }
            BattlePlayer.CYCLES_FPS = oriFps;
            setAllSpeed(FPUtil.playSpeed(),gameObjectList);
            if(target.layer2D)
            {
               target.layer2D.visible = ori2DVisible;
            }
            if(fillter)
            {
               fillter.dispose();
               fillter = null;
            }
            AppGlobalContext.removeAllFillters();
         };
         var oriFps:Number = BattlePlayer.CYCLES_FPS;
         var ori2DVisible:Boolean = target.layer2D.visible;
         var oriTransForm:Matrix3D = camer3D.transform.clone();
         target.layer2D.visible = false;
         BattlePlayer.CYCLES_FPS = 1;
         setAllSpeed(FPUtil.playSpeed(),gameObjectList);
         TweenLite.to(BattlePlayer,2,{
            "CYCLES_FPS":oriFps,
            "ease":Cubic.easeInOut,
            "onUpdate":onTweenUpdate,
            "onComplete":onTweenComplete,
            "delay":0.5
         });
         var fillter:Filter3DBase = new MotionBlurFilter3D();
         AppGlobalContext.addFillter(fillter);
      }
      
      private static function setAllSpeed(param1:Number, param2:Dictionary) : void
      {
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = param2;
         for each(var _loc4_ in param2)
         {
            _loc3_ = _loc4_ as Player;
            if(_loc3_)
            {
               _loc3_.avatarBody.playbackSpeed = param1;
               _loc3_.setAllSelfEffSpeed(param1);
            }
         }
      }
      
      public function rotate(param1:BattleStartVo, param2:Player, param3:Dictionary) : void
      {
         vo = param1;
         target = param2;
         gameObjectList = param3;
         onTweenComplete = function():void
         {
            camer3D._controller = null;
            if(vo && vo.maps && vo.maps is DungeonMultilayerBg)
            {
               var _loc1_:Boolean = true;
               (vo.maps as DungeonMultilayerBg).blackCover.visible = _loc1_;
               (vo.maps as DungeonMultilayerBg).bgAllLayer.visible = _loc1_;
            }
         };
         var camer3D:Camera3D = AppGlobalContext.stage3d.camera3d;
         var tiltAngle:Number = !!vo.isBoss?12:24;
         var dis:Number = !!vo.isBoss?2300:Number(2200);
         new FollowController(camer3D,target.avatar,tiltAngle,dis);
         if(vo && vo.maps && vo.maps is DungeonMultilayerBg)
         {
            var _loc5_:Boolean = false;
            (vo.maps as DungeonMultilayerBg).blackCover.visible = _loc5_;
            (vo.maps as DungeonMultilayerBg).bgAllLayer.visible = _loc5_;
         }
         play(camer3D,vo,target,gameObjectList,onTweenComplete);
      }
      
      public function pan(param1:BattleStartVo, param2:Player, param3:Dictionary) : void
      {
         vo = param1;
         target = param2;
         gameObjectList = param3;
         onTweenComplete = function():void
         {
            if(camer3D.lens is PerspectiveLens)
            {
               (camer3D.lens as PerspectiveLens).fieldOfView = oriFieldOfView;
            }
            if(vo && vo.maps && vo.maps is DungeonMultilayerBg)
            {
               (vo.maps as DungeonMultilayerBg).blackCover.visible = true;
            }
         };
         var camer3D:Camera3D = AppGlobalContext.stage3d.camera3d;
         var oriFieldOfView:Number = (camer3D.lens as PerspectiveLens).fieldOfView;
         var moveX:Number = !!vo.isBoss?target.x / 2:Number(target.x);
         var fieldOfView:Number = !!vo.isBoss?30:10;
         TweenLite.to(camer3D.lens,1.9,{
            "fieldOfView":fieldOfView,
            "ease":Cubic.easeInOut,
            "delay":-1
         });
         play(camer3D,vo,target,gameObjectList,onTweenComplete);
         camer3D.moveRight(moveX);
         if(vo && vo.maps && vo.maps is DungeonMultilayerBg)
         {
            (vo.maps as DungeonMultilayerBg).blackCover.visible = false;
         }
      }
   }
}
