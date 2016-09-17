package nslm2.modules.scenes.ctrls
{
   import proto.HeroInfo;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import flash.geom.Vector3D;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.utils.TransformUtil;
   import com.greensock.TweenLite;
   import com.mz.core.utils2.ShakeUtil;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.scenes.commons.SceneLotteryHero3D;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.mgrs.SoundMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class LHHeroShowEffNormal extends LHHeroShowEffBase
   {
       
      
      public var ctrl:nslm2.modules.scenes.ctrls.SceneLotteryHeroCtrl;
      
      public var reward:HeroInfo;
      
      public var index:int;
      
      private var effStcId:int;
      
      public var scene:Scene45Base;
      
      private var $pos:Vector3D;
      
      public function LHHeroShowEffNormal(param1:nslm2.modules.scenes.ctrls.SceneLotteryHeroCtrl, param2:Scene45Base, param3:Point, param4:HeroInfo, param5:int, param6:Boolean)
      {
         super(param2.effLayer3D,param3,param6);
         this.ctrl = param1;
         this.scene = param2;
         this.reward = param4;
         this.index = param5;
         effStcId = 12101;
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:SpecterEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(effStcId),true,parent);
         _loc1_.scaleAll = 1.8;
         _loc1_.position = TransformUtil.tran2DTo3D(xy.x,xy.y);
         TweenLite.delayedCall(0.2,this.showAvatar);
         ShakeUtil.shake(false,scene.layer3D,2,4,2,15);
         ShakeUtil.shake(true,UIMgr.layer2D,2,4,2,15);
         if(isOneLottery == false)
         {
            TweenLite.delayedCall(0.4,this.onComplete);
         }
      }
      
      private function cameraMove_cpl() : void
      {
      }
      
      private function showAvatar() : void
      {
         var _loc1_:int = 0;
         unit3D = new SceneLotteryHero3D(this.parent);
         unit3D.initByStcNpcId(reward.baseInfo.baseId);
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(reward.baseInfo.baseId);
         unit3D.tag3DVBox.initName(LocaleMgr.ins.getStr(_loc2_.name),ColorLib.qualityColor(_loc2_.quality));
         unit3D.tag3DVBox.initCareer(_loc2_.career_id,0);
         unit3D.x2d = xy.x;
         unit3D.y2d = xy.y;
         unit3D.rotation = -90;
         unit3D.alpha = 0;
         TweenLite.to(unit3D.avatar,0.3,{"alpha":1});
         unit3D.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
         unit3D.addEventListener("animator_complete",onAnimatorComplete);
         if(this.isOneLottery)
         {
            _loc1_ = StcMgr.ins.getNpcVo(reward.baseInfo.baseId).speak;
            if(_loc1_ > 0)
            {
               SoundMgr.ins.playTexiaoSound(UrlLib.speakUrl(_loc1_,1));
            }
         }
      }
      
      private function avatarAsset_onCpl(param1:Event) : void
      {
         unit3D.action = "std_3";
         if(isOneLottery)
         {
            TweenLite.delayedCall(0.4,this.onComplete);
         }
      }
      
      private function onAnimatorComplete(param1:Event) : void
      {
      }
      
      public function fadeOut() : void
      {
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(unit3D)
         {
            unit3D.dispose();
            unit3D = null;
         }
         TweenLite.killDelayedCallsTo(this.showAvatar);
         TweenLite.killDelayedCallsTo(this.onComplete);
      }
   }
}
