package nslm2.common.ui.components.comp3ds.ctrls
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import morn.core.utils.StringUtils;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.utils.TransformUtil;
   import com.mz.core.utils.MathUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.SoundMgr;
   import away3d.events.AnimatorEvent;
   import com.greensock.TweenLite;
   
   public class Avatar3DWinActionCtrl implements IDispose
   {
      
      private static var _lastSoundName:String;
       
      
      private var unit3D:Unit3DBase;
      
      private var stdAction:String;
      
      public var playSound:Boolean = true;
      
      private var winRo:int;
      
      public function Avatar3DWinActionCtrl(param1:Unit3DBase = null, param2:String = null, param3:Boolean = true)
      {
         super();
         this.stdAction = param2 || param1.actStd;
         this.playSound = param3;
         if(param1)
         {
            bind(param1);
         }
      }
      
      public function bind(param1:Unit3DBase) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:* = null;
         disposeBind();
         this.unit3D = param1;
         if(unit3D.stcNpcId)
         {
            _loc5_ = StcMgr.ins.getNpcVo(unit3D.stcNpcId);
         }
         if(this.unit3D.action == "win")
         {
            return;
         }
         if(_loc5_)
         {
            if(StringUtils.isNull(_loc5_.model_id) == false)
            {
               _loc6_ = StcMgr.ins.getModelVo(int(_loc5_.model_id));
               if(_loc6_)
               {
                  this.winRo = _loc6_.winRo;
                  if(this.winRo != 0)
                  {
                     this.unit3D.box3D2.setRotation(TransformUtil.ro3Dto2D(winRo),false);
                  }
               }
            }
         }
         this.unit3D.action = "win";
         unit3D.addEventListener("animator_complete",onAnimatorComplete,false,0,true);
         if(_loc5_)
         {
            _loc4_ = _loc5_.speak;
            if(_loc4_ > 0)
            {
               if(playSound)
               {
                  _loc3_ = _loc5_.quality;
                  _loc7_ = 1;
                  if(_loc3_ == 3 || _loc3_ == 4)
                  {
                     _loc7_ = MathUtil.randomInt(2,1);
                  }
                  else if(_loc3_ == 5 || _loc3_ == 6)
                  {
                     _loc7_ = MathUtil.randomInt(3,1);
                  }
                  _loc2_ = UrlLib.speakUrl(_loc4_,_loc7_);
                  if(_loc2_ != _lastSoundName)
                  {
                     this.clearSound();
                  }
                  _lastSoundName = _loc2_;
                  SoundMgr.ins.playTexiaoSound(_loc2_);
               }
            }
         }
      }
      
      private function clearSound() : void
      {
         if(!StringUtils.isNull(_lastSoundName))
         {
            SoundMgr.ins.clearTexiao(_lastSoundName);
            _lastSoundName = null;
         }
      }
      
      private function onAnimatorComplete(param1:AnimatorEvent = null) : void
      {
         if(this.unit3D.action == "win")
         {
            TweenLite.delayedCall(10,resetAction,null,true);
         }
         else
         {
            this.dispose();
         }
      }
      
      private function resetAction() : void
      {
         if(unit3D.isDispose == false)
         {
            if(this.winRo != 0)
            {
               this.unit3D.box3D2.setRotation(TransformUtil.ro3Dto2D(0),true);
            }
            unit3D.action = stdAction;
         }
         this.dispose();
      }
      
      private function disposeBind() : void
      {
         if(unit3D != null)
         {
            unit3D.removeEventListener("animator_complete",onAnimatorComplete);
            unit3D = null;
         }
      }
      
      public function dispose() : void
      {
         disposeBind();
      }
   }
}
