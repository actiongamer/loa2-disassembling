package nslm2.modules.scenes.ctrls
{
   import flash.geom.Point;
   import proto.HeroInfo;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.utils.TransformUtil;
   import com.mz.core.utils2.ShakeUtil;
   import com.mz.core.mgrs.UIMgr;
   import com.greensock.TweenLite;
   import nslm2.modules.scenes.commons.SceneLotteryHero3D;
   import flash.geom.Vector3D;
   import flash.events.Event;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DWinActionCtrl;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.SoundMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.ColorLib;
   
   public class LHHeroShowEffHigh extends LHHeroShowEffBase
   {
       
      
      public var ctrl:nslm2.modules.scenes.ctrls.SceneLotteryHeroCtrl;
      
      private var centerXY:Point;
      
      public var reward:HeroInfo;
      
      public var index:int;
      
      private var effStcId:int;
      
      public var scene:Scene45Base;
      
      private var oriScaleAll:Number;
      
      private var effCenter:SpecterEffect;
      
      private var winActionCtrl:Avatar3DWinActionCtrl;
      
      public function LHHeroShowEffHigh(param1:nslm2.modules.scenes.ctrls.SceneLotteryHeroCtrl, param2:Scene45Base, param3:Point, param4:Point, param5:HeroInfo, param6:int, param7:Boolean)
      {
         super(param2.effLayer3D,param4,param7);
         this.ctrl = param1;
         this.scene = param2;
         this.centerXY = param3;
         this.reward = param5;
         this.index = param6;
         effStcId = 12102;
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:SpecterEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(effStcId),true,parent);
         _loc1_.scaleAll = 1.8;
         _loc1_.position = TransformUtil.tran2DTo3D(xy.x,xy.y);
         if(this.isOneLottery)
         {
            if(this.ctrl.emCtrl)
            {
               this.ctrl.emCtrl.hideAll(0.2);
            }
         }
         ShakeUtil.shake(false,scene.layer3D,2,8,3,30);
         ShakeUtil.shake(true,UIMgr.layer2D,2,8,3,30);
         TweenLite.delayedCall(0.3,this.hideEffCenter);
         TweenLite.delayedCall(0.75,this.showAvatar);
      }
      
      private function cameraMove_cpl() : void
      {
      }
      
      private function hideEffCenter() : void
      {
         if(this.isStop)
         {
            return;
         }
         if(this.ctrl.emCtrl)
         {
            this.ctrl.emCtrl.hideAll(0.4);
         }
      }
      
      private function showAvatar() : void
      {
         unit3D = new SceneLotteryHero3D(this.parent);
         unit3D.useBigTex = true;
         unit3D.initByStcNpcId(reward.baseInfo.baseId);
         unit3D.pos2d = this.centerXY.clone();
         var _loc1_:Vector3D = unit3D.position;
         TransformUtil.scene45ChangeDeep(_loc1_,-100);
         unit3D.position = _loc1_;
         unit3D.rotation = -90;
         unit3D.rotationX = 20;
         oriScaleAll = unit3D.box3D2.scaleAll;
         unit3D.box3D2.scaleAll = oriScaleAll * 1.5;
         unit3D.visible = false;
         unit3D.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
         TweenLite.delayedCall(1.5,timeoutCpl);
      }
      
      private function timeoutCpl() : void
      {
         if(this.isStop)
         {
            return;
         }
         showAvatar1();
      }
      
      private function avatarAsset_onCpl(param1:Event) : void
      {
         if(this.isStop)
         {
            return;
         }
         showAvatar1();
      }
      
      private function showAvatar1() : void
      {
         TweenLite.killDelayedCallsTo(this.timeoutCpl);
         unit3D.removeEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
         ShakeUtil.shake(false,scene.layer3D,0,6,20,80);
         ShakeUtil.shake(true,UIMgr.layer2D,0,6,20,80);
         effCenter = EffectManager.createEffect(Effect3DUtils.getUrlBySid(12103),true,parent);
         effCenter.scaleAll = 2.5;
         var _loc1_:Vector3D = TransformUtil.tran2DTo3D(centerXY.x,centerXY.y);
         effCenter.position = _loc1_;
         TweenLite.delayedCall(0.6,showAvatar2);
      }
      
      private function showAvatar2() : void
      {
         switchDarkOther(true);
         ObserverMgr.ins.sendNotice("MSG_LOTTERY_HIGH_NAME",this.reward);
         scene.tweenMoveCtrl.exec(ctrl.func_pos2d.add(new Point(0,-100)),1.25,0.3);
         unit3D.visible = true;
         if(winActionCtrl == null)
         {
            winActionCtrl = new Avatar3DWinActionCtrl(unit3D);
         }
         TweenLite.delayedCall(0.6,addStage_onClick);
         var _loc1_:int = StcMgr.ins.getNpcVo(reward.baseInfo.baseId).speak;
         if(_loc1_ > 0)
         {
            SoundMgr.ins.playTexiaoSound(UrlLib.speakUrl(_loc1_,1));
         }
      }
      
      private function addStage_onClick() : void
      {
         UIMgr.stage.addEventListener("click",stage_onClick);
      }
      
      private function stage_onClick(param1:Event) : void
      {
         UIMgr.stage.removeEventListener("click",stage_onClick);
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(reward.baseInfo.baseId);
         unit3D.tag3DVBox.initName(LocaleMgr.ins.getStr(_loc2_.name),ColorLib.qualityColor(_loc2_.quality));
         unit3D.tag3DVBox.initCareer(_loc2_.career_id,0);
         this.close();
      }
      
      private function close() : void
      {
         switchDarkOther(false);
         effCenter.dispose();
         ObserverMgr.ins.sendNotice("MSG_LOTTERY_HIGH_NAME",null);
         scene.tweenMoveCtrl.exec(ctrl.func_pos2d_see,1,0.2);
         if(isOneLottery == false)
         {
            TweenLite.to(unit3D,0.3,{
               "x2d":xy.x,
               "y2d":xy.y,
               "rotationX":0
            });
         }
         TweenLite.to(unit3D.box3D2,0.3,{"scaleAll":oriScaleAll});
         TweenLite.delayedCall(0.35,this.onComplete);
      }
      
      private function switchDarkOther(param1:Boolean) : void
      {
         if(param1)
         {
            this.ctrl.heroShowEffList.addDarkOther(this);
            this.ctrl.effLottering.visible = false;
         }
         else
         {
            this.ctrl.heroShowEffList.removeDarkOther(this);
            this.ctrl.effLottering.visible = true;
            if(this.ctrl.emCtrl)
            {
               this.ctrl.emCtrl.showAll(0.5);
            }
         }
      }
      
      override public function onComplete() : void
      {
         this.unit3D.tag3DVBox.validateTag3DBox();
         super.onComplete();
      }
      
      override public function dispose() : void
      {
         UIMgr.stage.removeEventListener("click",stage_onClick);
         if(unit3D)
         {
            unit3D.dispose();
            unit3D = null;
         }
         TweenLite.killDelayedCallsTo(this.timeoutCpl);
         TweenLite.killDelayedCallsTo(this.showAvatar);
         TweenLite.killDelayedCallsTo(this.onComplete);
         super.dispose();
      }
   }
}
