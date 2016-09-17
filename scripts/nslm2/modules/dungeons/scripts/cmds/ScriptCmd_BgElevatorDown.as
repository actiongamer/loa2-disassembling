package nslm2.modules.dungeons.scripts.cmds
{
   import nslm2.common.scene.multiLayer.DungeonMultilayerBg;
   import org.specter3d.display.Specter3D;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import nslm2.modules.fightPlayer.AvatarEquipBody3D;
   import nslm2.modules.dungeons.scripts.TweenToData;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import flash.geom.Point;
   import nslm2.utils.RTools;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.utils2.ShakeUtil;
   import nslm2.common.scene.multiLayer.BgLayer;
   import nslm2.modules.dungeons.scripts.ScriptCmdVo;
   
   public class ScriptCmd_BgElevatorDown extends ScriptCmdBase
   {
       
      
      private var bg:DungeonMultilayerBg;
      
      private var shakeLayers:Vector.<Specter3D>;
      
      private var shakeCtrls:Vector.<nslm2.modules.dungeons.scripts.cmds.ShakeLayerCtrl>;
      
      private var shakeImgs:Vector.<TileImg>;
      
      private var model3ds:Vector.<AvatarEquipBody3D>;
      
      private var imgBg0:TileImg;
      
      private var imgBgH:int;
      
      private var tweenData:TweenToData;
      
      private var waitFrame:int = 0;
      
      public function ScriptCmd_BgElevatorDown(param1:DungeonMultilayerBg)
      {
         $bg = param1;
         shakeLayers = new Vector.<Specter3D>();
         shakeCtrls = new Vector.<nslm2.modules.dungeons.scripts.cmds.ShakeLayerCtrl>();
         shakeImgs = new Vector.<TileImg>();
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
                     imgBgH = $bgLayer.configVo.tileImg.oriHeight;
                     this.vo.time = imgBgH / bg.configVo.ctrlKind.speed * 1000;
                  }
               }
            }
            else if($bgLayer.tileImg)
            {
               shakeImgs.push($bgLayer.tileImg);
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
         len = shakeLayers.length;
         i = 0;
         while(i < len)
         {
            var $shakeCtrl:nslm2.modules.dungeons.scripts.cmds.ShakeLayerCtrl = new nslm2.modules.dungeons.scripts.cmds.ShakeLayerCtrl(this.shakeLayers[i],this.shakeImgs[i]);
            shakeCtrls.push($shakeCtrl);
            $shakeCtrl.play(0.8 * (i + 1),i);
            i = Number(i) + 1;
         }
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         tweenData = new TweenToData();
         tweenData.oriXY = new Point(0,0);
         tweenData.aimXY = new Point(0,-imgBgH);
         tweenData.totalFrame = RTools.msToFrame(this.vo.time);
         TimerManager.ins.doFrameLoop(1,this.onStep);
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         handlerVo = param1;
         super.onStep(handlerVo);
         tweenData.countXY(this.runFrame);
         this.imgBg0.repeatStartY = tweenData.result.y;
         if(this.runFrame > this.totalFrame)
         {
            if(waitFrame == 0)
            {
               this.imgBg0.repeatStartY = tweenData.result.y;
               if(model3ds && model3ds.length > 0)
               {
                  model3ds.forEach(function(param1:AvatarEquipBody3D, ... rest):void
                  {
                     param1.action = "std_2";
                  });
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
         RTools.disposeArrOrVector(this.shakeCtrls);
         shakeCtrls = null;
         tweenData = null;
         bg = null;
         super.onEnd();
      }
   }
}
