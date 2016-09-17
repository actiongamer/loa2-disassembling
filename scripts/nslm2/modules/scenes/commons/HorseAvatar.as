package nslm2.modules.scenes.commons
{
   import org.specter3d.display.avatar2.AvatarBody3D;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import morn.core.utils.StringUtils;
   import nslm2.utils.ConfigUtil;
   import nslm2.modules.fightPlayer.LoadZipS3dActTask;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import org.specter3d.display.avatar2.data.AvatarEffectVO;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.greensock.TweenLite;
   import com.mz.core.utils.MathUtil;
   import flash.events.Event;
   
   public class HorseAvatar extends AvatarBody3D
   {
       
      
      public var inUI:Boolean;
      
      public var delay:Number;
      
      public function HorseAvatar()
      {
         super();
      }
      
      public function initByStcModelId(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc7_:Number = NaN;
         var _loc6_:StcModelVo = StcMgr.ins.getModelVo(param1);
         var _loc8_:Number = _loc6_.scale <= 0?DefindConsts.SCENE_AVATAR_SCALE_SCENE:Number(_loc6_.scale);
         if(this.inUI && _loc6_.ui_scale > 0)
         {
            _loc8_ = _loc8_ * _loc6_.ui_scale;
         }
         this.scaleAll = _loc8_;
         this.bothSides = true;
         if(StringUtils.isNull(_loc6_.extra) == false)
         {
            ConfigUtil.setExtra(this,_loc6_.extra);
         }
         this.name = "坐骑测试";
         new LoadZipS3dActTask(this,_loc6_.pathFolder,null,_loc6_.path_s3d,_loc6_.path_texture_auto,0,this.bothSides).exec();
         this.addEventListener("animator_complete",onAnimatorComplete);
         if(!StringUtils.isNull(_loc6_.effect_id))
         {
            _loc3_ = _loc6_.effect_id.split("|");
            var _loc10_:int = 0;
            var _loc9_:* = _loc3_;
            for each(var _loc2_ in _loc3_)
            {
               _loc5_ = StcMgr.ins.getSpecialEffectVo(int(_loc2_));
               _loc7_ = _loc5_.scale <= 0?1:Number(_loc5_.scale);
               _loc4_ = new AvatarEffectVO();
               _loc4_.effectUrl = UrlLib.e3d_particle(_loc5_.effect);
               _loc4_.boneTag = _loc5_.tag;
               _loc4_.billboard = _loc5_.other == 1;
               _loc4_.scale = _loc7_;
               addEffect(_loc4_);
            }
         }
      }
      
      override public function set action(param1:String) : void
      {
         TweenLite.killDelayedCallsTo(this.ride1delay);
         .super.action = param1;
         if(this.action == "ride_1")
         {
            TweenLite.delayedCall(delay == -1?MathUtil.random(25,15):Number(delay),this.ride1delay);
         }
      }
      
      private function ride1delay() : void
      {
         if(this.isDispose)
         {
            return;
         }
         this.action = "ride_3";
      }
      
      private function onAnimatorComplete(param1:Event) : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(this.action == "ride_3")
         {
            this.action = "ride_1";
         }
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(this.ride1delay);
         this.removeEventListener("animator_complete",onAnimatorComplete);
         super.dispose();
      }
   }
}
