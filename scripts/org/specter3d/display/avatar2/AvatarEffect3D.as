package org.specter3d.display.avatar2
{
   import org.specter3d.utils.HashMap;
   import org.specter3d.display.avatar2.data.AvatarEffectVO;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.display.particle.EffectManager;
   import org.specter3d.events.Avatar3DEvent;
   
   public class AvatarEffect3D extends Avatar3D
   {
       
      
      protected var _bindingEffects:HashMap;
      
      private var _waitingBindURLs:Vector.<String>;
      
      protected var _effectsVisible:Boolean = true;
      
      protected var _effectsVisibleFromParent:Boolean = true;
      
      public function AvatarEffect3D(param1:String)
      {
         _waitingBindURLs = new Vector.<String>();
         super(param1);
         _bindingEffects = new HashMap();
         this.addEventListener("avatar_init_complete",onAvatarInitComplete);
      }
      
      public function addEffect(param1:AvatarEffectVO) : void
      {
         var _loc2_:* = null;
         if(isDispose)
         {
            return;
         }
         if(!param1.effectUrl)
         {
            return;
         }
         if(getBindingEffect(param1.effectUrl) == null && _waitingBindURLs.indexOf(param1.effectUrl) == -1)
         {
            if(param1.billboard)
            {
               creatEffect(param1.effectUrl,true,param1.boneTag);
            }
            else if(_avatarMesh)
            {
               creatEffect(param1.effectUrl,false,param1.boneTag);
            }
            else
            {
               _waitingBindURLs.push(param1.effectUrl);
            }
         }
      }
      
      public function set effectsVisibleFromParent(param1:Boolean) : void
      {
         _effectsVisibleFromParent = param1;
         validateEffectVisible();
      }
      
      public function set effectsVisible(param1:Boolean) : void
      {
         _effectsVisible = param1;
         validateEffectVisible();
      }
      
      protected function validateEffectVisible() : void
      {
         if(_bindingEffects == null)
         {
            return;
         }
         _bindingEffects.forEach(bindingEffectsForEach);
      }
      
      private function bindingEffectsForEach(param1:Vector.<SpecterEffect>) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc2_.visibleAndStop = _effectsVisible && _effectsVisibleFromParent;
         }
      }
      
      public function get effectsVisible() : Boolean
      {
         return _effectsVisible;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         .super.visible = param1;
         effectsVisibleFromParent = param1;
      }
      
      private function creatEffect(param1:String, param2:Boolean, param3:String = null) : void
      {
         var _loc4_:SpecterEffect = EffectManager.createEffect(param1,false,this);
         var _loc5_:Vector.<SpecterEffect> = _bindingEffects.getValue(param1) as Vector.<SpecterEffect>;
         if(_loc5_ == null)
         {
            _loc5_ = new Vector.<SpecterEffect>();
         }
         _loc5_.push(_loc4_);
         _loc4_.visibleAndStop = _effectsVisible && _effectsVisibleFromParent;
         _bindingEffects.put(param1,_loc5_);
         _loc4_.boneTag = param3;
      }
      
      private function onAvatarInitComplete(param1:Avatar3DEvent) : void
      {
         this.removeEventListener("avatar_init_complete",onAvatarInitComplete);
         if(isDispose || !_avatarMesh)
         {
            return;
         }
         while(_waitingBindURLs.length)
         {
            creatEffect(_waitingBindURLs.shift(),false);
         }
      }
      
      public function getBindingEffect(param1:String) : Vector.<SpecterEffect>
      {
         return _bindingEffects.getValue(param1) as Vector.<SpecterEffect>;
      }
      
      public function changeEffects(param1:Vector.<AvatarEffectVO>) : void
      {
         var _loc2_:int = 0;
         if(isDispose)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            addEffect(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      override public function dispose() : void
      {
         this.removeEventListener("avatar_init_complete",onAvatarInitComplete);
         removeEffectAll();
         super.dispose();
         if(_bindingEffects)
         {
            _bindingEffects.clear();
            _bindingEffects = null;
         }
      }
      
      public function removeEffect(param1:String) : Boolean
      {
         if(isDispose)
         {
            return false;
         }
         var _loc3_:Vector.<SpecterEffect> = _bindingEffects.remove(param1) as Vector.<SpecterEffect>;
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            _loc2_.dispose();
            _loc2_ = null;
         }
         return true;
      }
      
      public function removeEffectAll() : void
      {
         var _loc3_:* = undefined;
         if(isDispose)
         {
            return;
         }
         var _loc2_:Array = _bindingEffects.keySet();
         while(_loc2_.length)
         {
            _loc3_ = _bindingEffects.remove(_loc2_.pop()) as Vector.<SpecterEffect>;
            var _loc5_:int = 0;
            var _loc4_:* = _loc3_;
            for each(var _loc1_ in _loc3_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
         }
      }
   }
}
