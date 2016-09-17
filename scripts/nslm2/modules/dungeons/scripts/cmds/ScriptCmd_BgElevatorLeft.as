package nslm2.modules.dungeons.scripts.cmds
{
   import nslm2.common.scene.multiLayer.DungeonMultilayerBg;
   import org.specter3d.display.Specter3D;
   import nslm2.modules.fightPlayer.AvatarEquipBody3D;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import nslm2.modules.dungeons.scripts.TweenToData;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import flash.geom.Point;
   import nslm2.utils.RTools;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.utils2.ShakeUtil;
   import nslm2.common.scene.multiLayer.BgLayer;
   import morn.core.components.HBox;
   import nslm2.modules.dungeons.scripts.ScriptCmdVo;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.ui.components.debug3d.Object3DParams;
   import com.mz.core.mgrs.UIMgr;
   
   public class ScriptCmd_BgElevatorLeft extends ScriptCmdBase
   {
       
      
      private var bg:DungeonMultilayerBg;
      
      private var shakeLayers:Vector.<Specter3D>;
      
      private var model3ds:Vector.<AvatarEquipBody3D>;
      
      private var imgBg0:TileImg;
      
      private var imgBgW:int;
      
      private var tweenData:TweenToData;
      
      private var waitFrame:int = 0;
      
      public function ScriptCmd_BgElevatorLeft(param1:DungeonMultilayerBg)
      {
         $bg = param1;
         shakeLayers = new Vector.<Specter3D>();
         super();
         this.vo = new ScriptCmdVo();
         this.bg = $bg;
         var len:int = this.bg.configVo.bgLayerConfigArr.length;
         var i:int = 0;
         while(i < len)
         {
            var $bgLayer:BgLayer = this.bg.bgLayers[i];
            if($bgLayer.configVo && $bgLayer.configVo.kind == 2)
            {
               if($bgLayer.tileImg)
               {
                  var $imgBg:TileImg = $bgLayer.tileImg;
                  if(imgBg0 == null)
                  {
                     imgBg0 = $imgBg;
                     imgBgW = $bgLayer.configVo.tileImg.oriWidth;
                     this.vo.time = imgBgW / bg.configVo.ctrlKind.speed * 1000;
                  }
               }
            }
            else
            {
               shakeLayers.push($bgLayer);
            }
            i = Number(i) + 1;
         }
         model3ds = this.bg.model3ds;
         if(model3ds && model3ds.length > 0)
         {
            model3ds.forEach(function(param1:AvatarEquipBody3D, ... rest):void
            {
               param1.action = "run";
            });
         }
         if(false && model3ds && model3ds.length > 0 && EnvConfig.ins.useServer == false)
         {
            var debugBox:HBox = new HBox();
            debugBox.y = 40;
            if(model3ds && model3ds.length > 0)
            {
               model3ds.forEach(function(param1:AvatarEquipBody3D, ... rest):void
               {
                  var _loc3_:* = null;
                  _loc3_ = new Object3DParams("model3D");
                  _loc3_.bind(param1);
                  debugBox.addChild(_loc3_);
               });
            }
            UIMgr.stage.addChild(debugBox);
         }
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         tweenData = new TweenToData();
         tweenData.aimXY = new Point(imgBgW,0);
         tweenData.oriXY = new Point(0,0);
         tweenData.totalFrame = RTools.msToFrame(this.vo.time);
         TimerManager.ins.doFrameLoop(1,this.onStep);
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         handlerVo = param1;
         super.onStep(handlerVo);
         tweenData.countXY(this.runFrame);
         this.imgBg0.repeatStartX = tweenData.result.x;
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
                  if(model3ds && model3ds.length > 0)
                  {
                     model3ds.forEach(function(param1:AvatarEquipBody3D, ... rest):void
                     {
                        param1.action = "std_2";
                     });
                  }
               }
            }
            waitFrame = Number(waitFrame) + 1;
            if(waitFrame > 0)
            {
               runFrame = 0;
               waitFrame = 0;
               if(model3ds && model3ds.length > 0)
               {
                  model3ds.forEach(function(param1:AvatarEquipBody3D, ... rest):void
                  {
                     param1.action = "run";
                  });
               }
            }
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
