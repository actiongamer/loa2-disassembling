package nslm2.modules.dungeons.scripts.cmds
{
   import nslm2.common.scene.multiLayer.DungeonMultilayerBg;
   import org.specter3d.display.Specter3D;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import nslm2.modules.dungeons.scripts.TweenToData;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import flash.geom.Point;
   import nslm2.utils.RTools;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.common.scene.multiLayer.mapEffects.MapEffect_Eff3D;
   import com.mz.core.utils2.ShakeUtil;
   import nslm2.modules.dungeons.scripts.ScriptCmdVo;
   import nslm2.common.scene.multiLayer.BgLayer;
   
   public class ScriptCmd_BgElevatorUp extends ScriptCmdBase
   {
       
      
      private var bg:DungeonMultilayerBg;
      
      private var shakeLayers:Vector.<Specter3D>;
      
      private var imgBg0:TileImg;
      
      private var imgBgH:int;
      
      private var tweenData:TweenToData;
      
      private var oriY:int;
      
      private var waitFrame:int = 0;
      
      public function ScriptCmd_BgElevatorUp(param1:DungeonMultilayerBg)
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         shakeLayers = new Vector.<Specter3D>();
         super();
         this.vo = new ScriptCmdVo();
         this.bg = param1;
         var _loc4_:int = this.bg.configVo.bgLayerConfigArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this.bg.bgLayers[_loc5_];
            if(_loc3_.configVo && _loc3_.configVo.kind == 2)
            {
               if(_loc3_.tileImg)
               {
                  _loc2_ = _loc3_.tileImg;
                  if(imgBg0 == null)
                  {
                     imgBg0 = _loc2_;
                     imgBgH = _loc3_.configVo.tileImg.oriHeight;
                     this.vo.time = imgBgH / bg.configVo.ctrlKind.speed * 1000;
                  }
               }
            }
            else
            {
               shakeLayers.push(this.bg.bgLayers[_loc5_]);
            }
            _loc5_++;
         }
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         vo.time = 12500;
         tweenData = new TweenToData();
         tweenData.oriXY = new Point(0,0);
         tweenData.aimXY = new Point(0,imgBgH);
         tweenData.totalFrame = RTools.msToFrame(this.vo.time);
         TimerManager.ins.doFrameLoop(1,this.onStep);
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         super.onStep(param1);
         tweenData.countXY(this.runFrame);
         this.imgBg0.repeatStartY = tweenData.result.y;
         if(this.runFrame > this.totalFrame)
         {
            if(waitFrame == 0)
            {
               if(this.bg.configVo.ctrlKind.pauseAndShake == 0)
               {
                  runFrame = 0;
               }
               else
               {
                  shakeOtherLayers();
                  switchEffPlay(false);
               }
            }
            waitFrame = Number(waitFrame) + 1;
            if(waitFrame > 120)
            {
               runFrame = 0;
               waitFrame = 0;
               switchEffPlay(true);
            }
         }
      }
      
      private function switchEffPlay(param1:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = undefined;
         var _loc3_:int = this.bg.effects.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.bg.effects[_loc4_];
            if(_loc2_ is MapEffect_Eff3D)
            {
               (_loc2_ as MapEffect_Eff3D).isPausing = !param1;
            }
            _loc4_++;
         }
      }
      
      private function shakeOtherLayers() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = this.shakeLayers.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.shakeLayers[_loc3_];
            ShakeUtil.shake(false,_loc1_,0,8,16,50);
            _loc3_++;
         }
      }
      
      override public function onEnd() : void
      {
         TimerManager.ins.clearTimer(this.onStep);
         tweenData = null;
         bg = null;
         super.onEnd();
      }
   }
}
