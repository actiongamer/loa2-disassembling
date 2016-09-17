package org.specter3d.display.avatar2
{
   import flash.utils.Dictionary;
   import away3d.entities.BoneTag;
   import away3d.entities.Mesh;
   import org.specter3d.display.avatar2.data.AnimData;
   import org.specter3d.events.Avatar3DEvent;
   import away3d.events.AnimatorEvent;
   import away3d.animators.data.JointPose;
   import away3d.animators.data.SkeletonPose;
   import away3d.materials.methods.EffectMethodBase;
   import away3d.materials.methods.OutlineMethod2;
   
   public class AvatarBody3D extends AvatarPart3D
   {
       
      
      private var _parts:Dictionary;
      
      private var _partsVisible:Boolean;
      
      private var _canRevert:Boolean = false;
      
      public function AvatarBody3D()
      {
         super("body");
         _parts = new Dictionary();
      }
      
      override public function set action(param1:String) : void
      {
         .super.action = param1;
         if(_parts)
         {
            var _loc4_:int = 0;
            var _loc3_:* = _parts;
            for each(var _loc2_ in _parts)
            {
               if(_loc2_ is AvatarPart3D && (_loc2_ as AvatarPart3D).actFromParent)
               {
                  (_loc2_ as AvatarPart3D).action = param1;
               }
            }
         }
         startFrame();
      }
      
      override protected function validateEffectVisible() : void
      {
         super.validateEffectVisible();
         if(_parts)
         {
            var _loc3_:int = 0;
            var _loc2_:* = _parts;
            for each(var _loc1_ in _parts)
            {
               if(_loc1_)
               {
                  (_loc1_ as AvatarEffect3D).effectsVisible = _effectsVisible && _effectsVisibleFromParent;
               }
            }
         }
      }
      
      public function get partsVisible() : Boolean
      {
         return _partsVisible;
      }
      
      public function set partsVisible(param1:Boolean) : void
      {
         _partsVisible = param1;
         if(_parts)
         {
            var _loc4_:int = 0;
            var _loc3_:* = _parts;
            for each(var _loc2_ in _parts)
            {
               if(_loc2_)
               {
                  (_loc2_ as AvatarEffect3D).visible = param1;
               }
            }
         }
      }
      
      public function setAvatarPart(param1:String, param2:Avatar3D, param3:Boolean = true) : void
      {
         var _loc4_:Avatar3D = getAvatarPart(param1);
         if(_loc4_ != param2)
         {
            if(param3 && _loc4_)
            {
               _loc4_.dispose();
            }
            bindingAvatar(param1,param2);
         }
      }
      
      public function bindingAvatar(param1:String, param2:Avatar3D) : void
      {
         var _loc3_:* = null;
         var _loc4_:BoneTag = getBoneTag(param1);
         if(_loc4_)
         {
            if(param2)
            {
               _loc4_.addChild(param2);
               if(param2 is AvatarPart3D && (param2 as AvatarPart3D).actFromParent)
               {
                  (param2 as AvatarPart3D).action = action;
               }
               if(param2 is AvatarEffect3D)
               {
                  (param2 as AvatarEffect3D).effectsVisible = this.effectsVisible;
               }
               _parts[param1] = param2;
            }
            else
            {
               _loc3_ = getAvatarPart(param1);
               if(_loc3_)
               {
                  if(_loc3_.parent == _loc4_)
                  {
                     _loc4_.removeChild(_loc3_);
                  }
               }
               delete _parts[param1];
            }
         }
      }
      
      public function get body() : Mesh
      {
         return _avatarMesh;
      }
      
      public function get bodyClone() : Mesh
      {
         var _loc1_:* = null;
         if(_avatarMesh)
         {
            _loc1_ = _avatarMesh.clone(false) as Mesh;
            _loc1_.animator = _avatarMesh.animator;
            return _loc1_;
         }
         return null;
      }
      
      override public function dispose() : void
      {
         removeAvatarAll();
         super.dispose();
         _parts = null;
      }
      
      public function getAvatarPart(param1:String) : Avatar3D
      {
         return _parts[param1];
      }
      
      override public function getBoneTagByName(param1:String) : BoneTag
      {
         var _loc2_:* = null;
         if(_isAllowBinding)
         {
            _loc2_ = getBoneTag(param1);
         }
         return _loc2_;
      }
      
      public function get isAllowBinding() : Boolean
      {
         return _isAllowBinding;
      }
      
      public function removeAvatarAll() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _parts;
         for(var _loc1_ in _parts)
         {
            setAvatarPart(String(_loc1_),null);
         }
      }
      
      public function replaceAvatar(param1:String, param2:String, param3:Boolean, param4:Number = 1, param5:String = "default_group", param6:int = 10) : void
      {
         var _loc8_:* = null;
         var _loc11_:* = undefined;
         var _loc10_:* = null;
         var _loc9_:* = null;
         if(this.modelUrl == param1)
         {
            return;
         }
         _canRevert = param3;
         var _loc12_:Array = actionList();
         var _loc7_:AvatarBody3D = new AvatarBody3D();
         _loc7_.addEventListener("avatar_init_complete",onReplaceAvatarInitComplete);
         _loc7_.initAvatar(param1,param2,param5,param6,param4);
         if(!_canRevert)
         {
            _loc8_ = param1.substring(0,param1.lastIndexOf("/") + 1);
            _loc11_ = new Vector.<AnimData>();
            while(_loc12_.length)
            {
               _loc10_ = _loc12_.shift().value;
               _loc9_ = new AnimData(_loc10_);
               _loc9_.animUrl = _loc8_ + _loc10_ + ".act";
               _loc11_.push(_loc9_);
            }
            _loc7_.registerAnims(_loc11_);
         }
      }
      
      override public function scale(param1:Number) : void
      {
         var _loc2_:Number = param1 * 1;
         if(_loc2_ != this._scaleY)
         {
            if(this.hasEventListener("avatar_update_scale"))
            {
               this.dispatchEvent(new Avatar3DEvent("avatar_update_scale",param1));
            }
         }
         this._scaleX = _loc2_;
         this._scaleY = _loc2_;
         this._scaleZ = _loc2_;
         invalidateScale();
      }
      
      override public function set scaleX(param1:Number) : void
      {
         .super.scaleX = param1 * 1;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         var _loc2_:Number = param1 * 1;
         if(_loc2_ != this._scaleY)
         {
            if(this.hasEventListener("avatar_update_scale"))
            {
               this.dispatchEvent(new Avatar3DEvent("avatar_update_scale",param1));
            }
         }
         .super.scaleY = _loc2_;
      }
      
      override public function set scaleZ(param1:Number) : void
      {
         .super.scaleZ = param1 * 1;
      }
      
      override protected function assembleMesh() : void
      {
         super.assembleMesh();
         _animator && _animator.addEventListener("animator_enter_frame",onAnimatorEnterFrame);
         body.mouseEnabled = true;
      }
      
      private function onAnimatorEnterFrame(param1:AnimatorEvent) : void
      {
      }
      
      private function onReplaceAvatarInitComplete(param1:Avatar3DEvent) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc2_:AvatarBody3D = param1.target as AvatarBody3D;
         if(!_canRevert)
         {
            this.isAllowBinding = true;
            if(_parts)
            {
               var _loc7_:int = 0;
               var _loc6_:* = _parts;
               for(_loc4_ in _parts)
               {
                  _loc2_.setAvatarPart(_loc4_,_parts[_loc4_]);
               }
            }
         }
         dispatchEvent(new Avatar3DEvent("replace_avatar_complete",_loc2_));
      }
      
      private function onReplaceAvatarAnimAllComplete(param1:Avatar3DEvent) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc2_:AvatarBody3D = param1.target as AvatarBody3D;
         _loc2_.removeEventListener("avatar_anim_all_complete",onReplaceAvatarAnimAllComplete);
         if(!_canRevert)
         {
            this.isAllowBinding = true;
            if(_parts)
            {
               var _loc7_:int = 0;
               var _loc6_:* = _parts;
               for(_loc4_ in _parts)
               {
                  _loc2_.setAvatarPart(_loc4_,_parts[_loc4_]);
               }
            }
            dispatchEvent(new Avatar3DEvent("replace_avatar_complete",_loc2_));
         }
      }
      
      override public function set alpha(param1:Number) : void
      {
         .super.alpha = param1;
         var _loc4_:int = 0;
         var _loc3_:* = _parts;
         for each(var _loc2_ in _parts)
         {
            if(_loc2_)
            {
               _loc2_.alpha = param1;
            }
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         .super.visible = param1;
         var _loc4_:int = 0;
         var _loc3_:* = _parts;
         for each(var _loc2_ in _parts)
         {
            if(_loc2_)
            {
               _loc2_.visible = visible;
            }
         }
         if(param1)
         {
            startFrame();
         }
         else
         {
            stopFrame();
         }
      }
      
      override public function startFrame() : void
      {
         super.startFrame();
         var _loc3_:int = 0;
         var _loc2_:* = _parts;
         for each(var _loc1_ in _parts)
         {
            if(_loc1_ is AvatarPart3D)
            {
               (_loc1_ as AvatarPart3D).startFrame();
            }
         }
      }
      
      override public function stopFrame() : void
      {
         super.stopFrame();
         var _loc3_:int = 0;
         var _loc2_:* = _parts;
         for each(var _loc1_ in _parts)
         {
            if(_loc1_ is AvatarPart3D)
            {
               (_loc1_ as AvatarPart3D).stopFrame();
            }
         }
      }
      
      override protected function onAnimatorComplete(param1:AnimatorEvent) : void
      {
         if(param1.activeAnimationName == "die")
         {
            stopFrame();
         }
         super.onAnimatorComplete(param1);
      }
      
      public function jointPoseFromName(param1:String = "Bip01 Head") : JointPose
      {
         var _loc3_:* = null;
         if(_animator != null)
         {
            _loc3_ = _animator.globalPose;
            if(_loc3_ != null && _loc3_.jointPoses != null)
            {
               var _loc5_:int = 0;
               var _loc4_:* = _loc3_.jointPoses;
               for each(var _loc2_ in _loc3_.jointPoses)
               {
                  if(_loc2_ != null && _loc2_.name.indexOf("Head") >= 0)
                  {
                     return _loc2_;
                  }
               }
            }
         }
         return null;
      }
      
      override public function addMethod(param1:EffectMethodBase) : void
      {
         super.addMethod(param1);
         if(param1 is OutlineMethod2)
         {
            return;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _parts;
         for each(var _loc2_ in _parts)
         {
            if(_loc2_)
            {
               _loc2_.addMethod(param1);
            }
         }
      }
      
      override public function removeMethod(param1:EffectMethodBase) : void
      {
         super.removeMethod(param1);
         var _loc4_:int = 0;
         var _loc3_:* = _parts;
         for each(var _loc2_ in _parts)
         {
            if(_loc2_)
            {
               _loc2_.removeMethod(param1);
            }
         }
      }
   }
}
