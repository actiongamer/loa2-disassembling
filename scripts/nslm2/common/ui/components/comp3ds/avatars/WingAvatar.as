package nslm2.common.ui.components.comp3ds.avatars
{
   import org.specter3d.display.avatar2.AvatarPart3D;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import morn.core.utils.StringUtils;
   import nslm2.utils.ConfigUtil;
   import nslm2.modules.fightPlayer.LoadZipS3dActTask;
   import org.specter3d.events.Avatar3DEvent;
   import away3d.events.AnimatorEvent;
   import com.greensock.TweenLite;
   import away3d.materials.methods.ColorTransformMethod;
   import flash.geom.ColorTransform;
   import com.greensock.TimelineLite;
   import com.greensock.easing.Sine;
   
   public class WingAvatar extends AvatarPart3D
   {
       
      
      private var _aniTime:Number;
      
      private var _glowColorTransformMethod:ColorTransformMethod;
      
      private var _glowColorTransform:ColorTransform;
      
      private var _glowTimeLineLite:TimelineLite;
      
      public function WingAvatar()
      {
         super("Bip01 Spine1");
         this.actFromParent = true;
         this.action = "std_2";
         rotationY = 90;
         rotationZ = 90;
         rotationX = 180;
         x = 1;
         y = -8;
         visible = false;
      }
      
      override public function set action(param1:String) : void
      {
         var _loc2_:* = param1;
         if("run" !== _loc2_)
         {
            if("run_3" !== _loc2_)
            {
               if("ride_2" !== _loc2_)
               {
                  .super.action = "std_3";
               }
               else
               {
                  .super.action = "ride";
               }
            }
            addr34:
            return;
         }
         .super.action = "run_3";
         §§goto(addr34);
      }
      
      public function init(param1:StcModelVo, param2:String = "default_group", param3:int = 10, param4:Number = 1, param5:Boolean = true) : void
      {
         this.bothSides = param5;
         if(StringUtils.isNull(param1.extra) == false)
         {
            ConfigUtil.setExtra(this,param1.extra);
         }
         addEventListener("avatar_anim_all_complete",onAvatarAnimAllComplete);
         new LoadZipS3dActTask(this,param1.pathFolder,null,param1.path_s3d,param1.path_texture_auto,0,this.bothSides).exec();
      }
      
      private function onAvatarAnimAllComplete(param1:Avatar3DEvent) : void
      {
         removeEventListener("avatar_anim_all_complete",onAvatarAnimAllComplete);
         _animator && _animator.addEventListener("animator_enter_frame",onAnimatorEnterFrame);
         visible = true;
         _aniTime = this.getAnimationTotalTime("std_2") * 0.001;
      }
      
      override protected function updateBounds() : void
      {
         if(avatarMesh && avatarMesh.bounds)
         {
            avatarMesh.bounds.nullify();
         }
      }
      
      private function onAnimatorEnterFrame(param1:AnimatorEvent) : void
      {
         !_isAllowBinding && true;
         if(_animator.currentFrame == 1 && _aniTime > 0)
         {
            showAttackedEffect();
         }
      }
      
      override public function dispose() : void
      {
         _animator && _animator.removeEventListener("animator_enter_frame",onAnimatorEnterFrame);
         if(_glowTimeLineLite)
         {
            _glowTimeLineLite.kill();
            _glowTimeLineLite = null;
         }
         if(_glowColorTransform)
         {
            TweenLite.killTweensOf(_glowColorTransform);
            _glowColorTransform = null;
         }
         if(_glowColorTransformMethod)
         {
            _glowColorTransformMethod.dispose();
            _glowColorTransformMethod = null;
         }
         super.dispose();
      }
      
      public function showAttackedEffect() : void
      {
         if(_glowColorTransformMethod == null)
         {
            _glowColorTransformMethod = new ColorTransformMethod();
            _glowColorTransform = new ColorTransform(1,1,1,1);
            _glowColorTransformMethod.colorTransform = _glowColorTransform;
         }
         if(!hasMethod(_glowColorTransformMethod))
         {
            addMethod(_glowColorTransformMethod);
         }
         _glowTimeLineLite && _glowTimeLineLite.kill();
         _glowTimeLineLite = new TimelineLite();
         _glowTimeLineLite.append(TweenLite.to(_glowColorTransform,_aniTime * 0.45,{
            "redMultiplier":1.11,
            "greenMultiplier":1.11,
            "blueMultiplier":1.11,
            "ease":Sine.easeInOut
         }));
         _glowTimeLineLite.append(TweenLite.to(_glowColorTransform,_aniTime * 0.5,{
            "redMultiplier":1,
            "greenMultiplier":1,
            "blueMultiplier":1
         }));
      }
   }
}
